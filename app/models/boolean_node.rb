class BooleanNode < Node
  def as_json(opts)
    {
        kind: kind,
        type:type_name,
        value:value,
        id:id
    }
  end

  def type_name
    'bool'
  end

  def value
    data[:boolean]
  end
end