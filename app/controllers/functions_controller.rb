class FunctionsController < ApplicationController
  def create
    node = CustomFunctionNode.create! :data => {:body => params[:body]}

    render json: node, status: 201
  end
end