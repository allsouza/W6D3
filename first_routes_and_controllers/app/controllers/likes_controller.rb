class LikesController < ApplicationController


    def create 
        @like = Like.new(like_params)
        if params.has_key?(:comment_id)
            @like.comment_id = params[:comment_id]
            redirect_id = Comment.find(params[:comment_id]).artwork.id
        elsif params.has_key?(:artwork_id)
            @like.artwork_id = params[:artwork_id]
            redirect_id = params[:artwork_id]
        end

        if @like.save
            redirect_to artwork_likes_url(redirect_id)
        else
            render json: @like.errors.full_messages, status: 422
        end
    end

    def destroy 
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to user_likes_url(@like)
    end

    def index
        if params.has_key?(:user_id)
            @likes = User.find(params[:user_id]).likes
        elsif params.has_key?(:artwork_id)
            @likes = Artwork.find(params[:artwork_id]).likes
        end
        render json: @likes
    end

    private
    def like_params
        params.require(:like).permit(:liker_id)
    end

end