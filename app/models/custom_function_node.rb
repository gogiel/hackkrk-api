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

  def value
    Node.find(body).value
  end
end