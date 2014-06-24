class AdsController < ApplicationController
  def index
    @ads = Ad.find_by({
      region_id: params[:region_id],
      category_id: params[:category_id]
    })
  end
end
