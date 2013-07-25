class FunctionsController < ApplicationController
  def create
    node = CustomFunctionNode.create! :data => {:body => params[:body]}

    render json: node, status: 201
  end

  def update
    node = CustomFunctionNode.find(params[:id])
    node.data = {:body => params[:body]}
    node.save!

    render json: node, status: 201
  end
end