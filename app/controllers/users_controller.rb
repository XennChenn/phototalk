class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@photos = @user.photos
  end


  protected

  def update_resources(resource, params)
  		resource.update_without_password(params)
  end
end
