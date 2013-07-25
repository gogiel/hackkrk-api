class CustomFunctionNode < Node
  def body
    data[:body]
  end

  # TODO set db id sequence for node to start with higher id (builtin functions)

  def as_json(opts)
    {
        body: body,
        id: id
    }
  end

  def value(custom_arguments = nil)
    node = Node.find(body)
    if node.is_a?(FunctionNode) && node.has_custom_arguments?
      node.value(custom_arguments)
    else
      node.value
    end
  end

end