class FunctionsController < ApplicationController
  def add
    render :json => {id: 3}
  end

  def mult
    render :json => {id: 4}
  end
end
