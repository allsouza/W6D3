class CommentsController < ApplicationController

    def index
        if params.has_key?(:user_id)
            @comments = User.find(params[:user_id]).comments
        elsif params.has_key?(:artwork_id)
            @comments = Artwork.find(params[:artwork_id]).comments
        end
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.artwork_id = params[:id]
        # debugger
        if @comment.save
            redirect_to "/artworks/#{params[:id]}/comments"
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        art_id = @comment.artwork_id
        @comment.destroy
        redirect_to "/artworks/#{art_id}/comments"
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id)
    end

    

end