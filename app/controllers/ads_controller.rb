class AdsController < ApplicationController
  def index
    region = Region.find(params[:region_id])
    @ads = region.ads.where(category_id: params[:category_id])
  end
end
