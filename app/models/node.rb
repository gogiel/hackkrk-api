class Node < ActiveRecord::Base
  serialize :data, Hash

  def evaluate
    value
  end

  def value

  end
end
