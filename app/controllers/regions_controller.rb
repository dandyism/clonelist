class RegionsController < ApplicationController
  def index
    
  end
  
  def show
    @region = Region.find(params[:id])
  end
end
