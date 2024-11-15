class SongsController < ApplicationController

  # '/search?query=thriller'
  def search
    # @songs = Song.where(title: params[:query])
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
    raise
  end

  # '/songs/named/thriller'
  def search_two
    # @songs = Song.where(title: params[:name])
    @songs = Song.where('title ILIKE ?', "%#{params[:name]}%")
    raise
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new # give this to the form helper
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
