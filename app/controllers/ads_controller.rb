class AdsController < ApplicationController
  def index
    @ads = Ad.where({
      region_id: params[:region_id],
      category_id: params[:category_id]
    })
  end
end
