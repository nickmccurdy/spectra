class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  def all
    @albums = Album.all
  end

  # GET /artists/name/albums
  def index
    @albums = Artist.find(params.permit(:artist_id)[:artist_id]).albums
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  # Guarantee that no such album exists prior to creating it.
  # If there is no artist matching the one given, create it as well
  # Create a new album.
  def create
    @album = Album.new do |a|
      a.title = album_params[:title]
      a.artist = Artist.find_or_create_by(name: album_params[:artist]) do |artist|
        artist.rating = 0
      end
      a.rating = album_params[:rating]
      a.art = album_params[:art]
      a.release_date = album_params[:release_date]
      a.is_compilation = album_params[:is_compilation]
      a.num_discs = 0
    end

    respond_to do |format|
      if @album.save
        format.html { redirect_to artist_album_url(@album.artist, @album),
                                  notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    params[:album][:artist] = Artist.find_or_create_by(name: params[:album][:artist])
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to artist_album_url(@album.artist, @album), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to artist_albums_url(@album.artist), notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def album_params
    params.require(:album).permit(:title, :rating, :artist, :cover, :release_date, :is_compilation)
  end
end
