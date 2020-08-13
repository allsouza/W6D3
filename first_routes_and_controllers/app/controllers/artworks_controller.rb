class ArtworksController < ApplicationController

    
    def index
        @rtworks = Artwork.where(artist_id: params[:user_id])
       
        @rtworks += Artwork.joins(:shares)
                            .where(artwork_shares: {viewer_id: params[:user_id]})
                            .where.not(artist_id: params[:user_id])
        
        # Alternative:
        # @user = User.find(params[:user_id])
        # result = @user.artworks + @user.shared_artworks.where.not(ids different)

        render json: @rtworks
    end

    def show
        @rtwork = Artwork.find_by(id: params[:id]) 

        render json: @rtwork
    end
        
    def create
        @rtwork = Artwork.new(artwork_params)

        if @rtwork.save
            redirect_to artwork_url(@rtwork)
        else
           render json: @rtwork.errors.full_messages, status: 422 
        end
    end

    def update
        @rtwork = Artwork.find(params[:id])

        if @rtwork.update(artwork_params)
            redirect_to artwork_url(@rtwork)
        else
            render json: @rtwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @rtwork = Artwork.find(params[:id])
        @rtwork.destroy 
        redirect_to artworks_url
    end

    private 

    def artwork_params
        params.require(:artwork).permit(:artist_id, :image_url, :title)
    end
end