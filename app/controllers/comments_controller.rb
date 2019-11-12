class CommentsController < ApplicationController
    def create
        params.permit!
        @current_user ||= User.find_by(id: session[:user_id])
        @post = WhateverChat.find(params[:id])
        @post.comments.create :userid => @current_user.id, :body => params[:commentBody]
        redirect_to("/whatever_chats/"+params[:id])
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

end
