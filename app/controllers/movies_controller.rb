class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]

  def index
    @movies = Movie.all.order(id: "DESC")
  end
  

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new  
    end
  end  

  def show
    if user_signed_in?
      @movie = Movie.find(params[:id])
      @comment = Comment.new
      @comments = @movie.comments.includes(:user)
    end
    redirect_to root_path
  end

  def edit
    @movie =Movie.find(params[:id])
    unless @movie.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :explanation,:video,:price).merge(user_id: current_user.id)
  end
end