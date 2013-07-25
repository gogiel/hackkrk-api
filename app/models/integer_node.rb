class IntegerNode < Node
  def as_json(opts)
    {
        kind: kind,
        type:type_name,
        value:value,
        id:id
    }
  end

  def type_name
    'int'
  end

  def value
    integer_value
  end
end