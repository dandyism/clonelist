class Users::RegistrationsController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
