class NodesController < ApplicationController
  def create
    # TODO move it
    kind = params[:kind]
    case kind
      when 'constant'
        node = constant_node
      when 'invoke'
        node = invoke_node
      when 'if'
        node = if_node
    end
    return unless node

    node.kind = kind
    node.save!
    render :json => node, :status => 201
  end

  def show
    render :json => Node.find(params[:id])
  end

  def evaluate
    render :json => {
        :result => Node.find(params[:id]).value
    }
  end

  private

  def constant_node
    if (value = params[:value].to_s)
      case params[:type]
        when 'int'
          if !(value =~ /^[-+]?[0-9]+$/)
            render :json => {error: "Could not parse integer"},
                   :status => 422 and return
          end
          node = IntegerNode.new :integer_value => value.to_i
        when 'bool'
          unless value == 'true' || value == 'false'
            render :json => {error: "Could not parse boolean"}  ,
                    :status => 422 and return
          end
          node = BoolNode.new :bool_value => value
        when 'string'
        else
          node = Node.new
      end
    else
      node = Node.new
    end
    node
  end

  def invoke_node
    arguments = params[:arguments]
    arguments = JSON.parse(arguments) if arguments.is_a?(String)
    FunctionNode.new function: params[:function],
                     arguments: arguments
  end

  def if_node
    node = IfNode.new :data => {
        predicate: params[:predicate],
        true_branch: params[:true_branch],
        false_branch: params[:false_branch]
    }

    # POST /nodes with {"kind":"if","predicate":4,"true_branch":1,"false_branch":2} => 201:
    #{"kind":"if","predicate":4,"true_branch":1,"false_branch":2,"id":5}
  end
end
