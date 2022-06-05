class BookmarksController < ApplicationController
  def create
    @merchandise = Merchandise.find(params[:merchandise_id])
    current_user.bookmark(@merchandise)
    redirect_back fallback_location: merchandises_path
  end

  def destroy
    @merchandise = current_user.bookmarks.find(params[:id]).merchandise
    current_user.unbookmark(@merchandise)
    redirect_back fallback_location: merchandises_path
  end
end
