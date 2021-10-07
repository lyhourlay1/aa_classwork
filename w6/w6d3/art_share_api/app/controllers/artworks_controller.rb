class ArtworksController < ApplicationController

  def index
    artworks = Artwork.all
    render json: artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
    
  end

  def create
    # debugger
    artwork = Artwork.new(artwork_params)
    if artwork.save
      redirect_to "/artworks/#{artwork.id}"
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end    
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
