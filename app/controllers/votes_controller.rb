class VotesController < ApplicationController
  before_action :find_photo

  def create
    @photo.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :upvote }
    end
  end

  def destroy
    @photo.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :downvote }
    end
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end
end