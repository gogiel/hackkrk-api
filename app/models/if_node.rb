class IfNode < Node
  def as_json(opts)
    {
        kind: kind,
        predicate: predicate,
        true_branch: true_branch,
        false_branch: false_branch,
        id:id
    }
  end

  def predicate
    data[:predicate]
  end

  def true_branch
    data[:true_branch]
  end

  def false_branch
    data[:false_branch]
  end

  def value
    if Node.find(predicate).value
      Node.find(true_branch).value
    else
      Node.find(false_branch).value
    end
  end
end