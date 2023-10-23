class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :set_album

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    # @song = Song.new
    
    @song = @album.songs.build
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    # @song = Song.new(song_params)

    @song = @album.songs.build(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to [@album, @song], notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to [@album, @song], notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy!

    respond_to do |format|
      format.html { redirect_to album_songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    def set_album
      @album = Album.find(params[:album_id])
    end
    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name)
    end
end
