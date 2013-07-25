class StringNode < Node
  def as_json(opts)
    {
        kind: kind,
        type:type_name,
        value:value,
        id:id
    }
  end

  def type_name
    'string'
  end

  def value
    string_value
  end
end