class NodesController < ApplicationController
  def create
    # TODO move it
    if (value = params[:value])
      case params[:type]
        when 'int'
          node = IntegerNode.new :integer_value => value
        else
          node = Node.new
      end
    else
      node = Node.new
    end
    node.kind = params[:kind]

    node.save!
    render :json => node

  end
end
