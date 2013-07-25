class ArgumentNode < Node
  def argument
    data[:argument]
  end

  def as_json(opts)
    {
        kind: 'argument',
        argument: argument,
        id: id
    }
  end
end