# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]
  before_action :find_post, only: %i[show edit update destroy]

  # BEGIN
  def index
    authorize Post
    @posts = Post.all
  end

  def show; end

  def new
    authorize Post
    @post = current_user.posts.build
  end

  def edit; end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)

    if @post.save
      sign_in @post
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def find_post
    @post = Post.find params[:id]
    authorize @post
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :title,
      :body
    )
  end
  # END
end
