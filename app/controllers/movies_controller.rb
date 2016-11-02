require 'byebug'
class MoviesController < ApplicationController
  before_action :set_movie!, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:show, :index]

  def index
    # byebug
    unalpha = Movie.all 
    @movies = unalpha.sort_by {|movie| movie.title}
  end

  def show 
    @opinion = UserMovie.find_by(movie_id: @movie.id, user_id: session[:user_id])
    # byebug
    sql_feelings = UserMovie.find_by_sql("select rating, count(*) as count from user_movies where movie_id = #{@movie.id} group by rating order by rating")
    @feelings = sql_feelings.map do |feeling|
      ["user rating: #{feeling.rating}", feeling.count]
    end
    @feelings.to_h
  end

  def new
    @movie = Movie.new
  end

  def create
    temp_movie = Movie.find_by(imdbID: params["imdbID"])
    if !temp_movie 
      new_movie = Omdb.newify(params["imdbID"])
      @movie = Movie.create(new_movie)
    else 
      @movie = temp_movie 
    end
    #byebug
    if !params[:rating].empty? && !params[:year_seen].empty? && !session[:user_id].nil?
      @opinion = UserMovie.new(user_id: current_user, movie_id: @movie.id, rating: params[:rating], year_seen: params[:year_seen], big_screen: params[:big_screen])
      if @opinion.save
        redirect_to movie_path(@movie)
      else
        @moviesearch = [Choice.find_by(imdbID: params["imdbID"])]
        render 'movies/new'
      end 
    else
      redirect_to movie_path(@movie)
    end
  end
  

  def edit
    # byebug
    check_me = UserMovie.find_by(movie_id: @movie.id, user_id: session[:user_id])
    if !check_me
      @opinion = UserMovie.new(movie_id: @movie.id, user_id: current_user)
    else
      @opinion = check_me
    end 
    
    render 'user_movies/edit'
     # byebug
  end

  def update
    permits = params[:movie].permit(:title, :year, :director_id)
    permits[:director_id] = @movie.director_id
    @movie.update(permits)
    if !@movie.valid?
      self.edit
      render :edit
     else
      director = Director.find_or_create_by(name: params[:movie][:director]) 
      params[:movie][:director_id] = director.id
      parameter = params[:movie].permit(:title, :year, :rating, :director_id)
      @movie.update(parameter)
      redirect_to movie_path(@movie)
    end
  end 

  def destroy
    @movies = Movie.all # do I need that or does it know from movies_url? 
    UserMovie.where(movie_id: @movie.id).destroy_all    
    @movie.delete
    redirect_to movies_url
  end


  private

  def movie_params
    params[:movie].permit(:title, :director_id, :year, :link, :director)
  end

  def set_movie!
    @movie = Movie.find(params[:id])
  end

end
