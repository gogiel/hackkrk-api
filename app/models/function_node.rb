class FunctionNode < Node
  serialize :arguments, Array

  def has_custom_arguments?
    Node.find(arguments.first).is_a? ArgumentNode
  end

  def value(custom_arguments = nil)
    puts "calculating value of #{id} with #{custom_arguments}"
    case function.to_s
      when '3'

        puts "has_custom_arguments? #{has_custom_arguments?}"
        if !has_custom_arguments?
          arguments.map{|id| Node.find(id).value}.inject(:+)
        else
          custom_arguments.map{|id| Node.find(id).value}.inject(:+)
        end
      when '4'
        if !has_custom_arguments?
        arguments.map{|id| Node.find(id).value}.inject(:*)
        end
      when '5'
        if !has_custom_arguments?
        a, b= arguments.map{|id| Node.find(id).value}
        else
        a, b= custom_arguments.map{|id| Node.find(id).value}
        end
        a < b

      else
        node = CustomFunctionNode.find(function)
        node.value(arguments)
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