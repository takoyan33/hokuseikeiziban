class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @board = Board.find(params[:board_id])
    @bookmark = @board.bookmarks.new(user_id: current_user.id)　#①
    if @bookmark.save
    else
      redirect_to request.referer #②
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @bookmark = @board.bookmarks.find_by(user_id: current_user.id)
    if @bookmark.present? #③
      @bookmark.destroy
    else
      redirect_to request.referer
    end
  end
end