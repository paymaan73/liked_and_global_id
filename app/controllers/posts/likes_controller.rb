class Posts::LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.users_posts.create(post: post)
    redirect_to post, notice: "Post Liked"
  end

  def destroy
    # post = Post.find(params[:post_id])
    # current_user.users_posts.find_by(post: post).destroy!
    # redirect_to post, notice: "Post Unliked"

    user_post = GlobalID::Locator.locate_signed(params[:id])
    user_post.destroy
    redirect_to post_path(user_post.post_id), notice: "Post unliked"
  end
end
