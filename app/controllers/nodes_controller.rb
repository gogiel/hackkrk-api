class NodesController < ApplicationController
  def create
    # TODO move it
    kind = params[:kind]
    case kind
      when 'constant'
        node = constant_node
    end
    return unless node

    node.kind = kind
    node.save!
    render :json => node, :status => 201
  end

  def show
    render :json => Node.find(params[:id])
  end

  def constant_node
    if (value = params[:value].to_s)
      case params[:type]
        when 'int'
          if !(value =~ /^[-+]?[0-9]+$/)
            render :json => {error: "Could not parse integer"},
                   :status => 422 and return
          end
          node = IntegerNode.new :integer_value => value.to_i
        else
          node = Node.new
      end
    else
      node = Node.new
    end
    node
  end

end
