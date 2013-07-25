class FunctionsController < ApplicationController
  def add
    render :json => {id: 3}
  end

  def mult
    render :json => {id: 4}
  end

  def create
    render :json => {body: params[:body], id: 6}
  end

  def lt
    render :json => {id: 5}
  end
end
