class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/movies/#{@comment.movie.id}" 
    else
      @movie = @comment.prototype
      @comments = @movie.comments.includes(:user)
      render "movies/show"
    end
  end  


  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, movie_id: params[:movie_id])
  end
end