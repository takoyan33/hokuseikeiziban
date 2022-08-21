class Public::BookmarksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @bookmark = @board.bookmarks.new(user_id: @current_user.id)
    if @bookmark.save!
    else
      redirect_to request.referer 
    end
  end

  # def destroy
  #   @board = Board.find(params[:id])
  #   @bookmark = @board.bookmarks.find_by(user_id: @current_user.id)
  #   if @bookmark.present? 
  #     @bookmark.destroy
  #   else
  #     redirect_to request.referer
  #   end
  # end
end