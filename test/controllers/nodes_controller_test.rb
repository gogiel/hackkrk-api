require 'test_helper'

class NodesControllerTest < ActionController::TestCase
  test "creating an integer constant" do
    params = {:format => "json", :kind => "constant", :type => "int", :value => 891}

    post :index, params

    nodes = JSON.parse(@response.body)
    puts "blabla"
    puts nodes.inspect
  end
  # test "the truth" do
  #   assert true
  # end
end
