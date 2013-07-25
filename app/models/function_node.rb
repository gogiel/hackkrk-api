class FunctionNode < Node
  serialize :arguments, Array

  def evaluate
    value
  end

  def value
    case function.to_s
      when '3'
        arguments.map{|id| Node.find(id).value}.inject(:+)
      when '4'
        arguments.map{|id| Node.find(id).value}.inject(:*)
      when '5'
        a, b= arguments.map{|id| Node.find(id).value}
        a < b
    end
  end

  def as_json(opts)
    {
        kind: kind,
        function:function.to_i,
        arguments:arguments,
        id:id
    }
  end
end