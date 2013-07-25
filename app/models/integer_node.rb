class IntegerNode < Node
  def as_json(opts)
    {kind:kind,type:type,value:integer_value,id:id}
  end
end