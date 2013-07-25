class IntegerNode < Node
  def as_json(opts)
    {
        kind: kind,
        type:type_name,
        value:integer_value,
        id:id
    }
  end

  def type_name
    'int'
  end
end