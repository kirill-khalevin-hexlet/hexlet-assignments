# frozen_string_literal: true

module Web
  module Movies
    class CommentsController < Web::ApplicationController
      before_action :resource_movie
      before_action :find_comment, only: %i[show edit update destroy]

      def index
        @comments = @movie.comments
      end

      def show; end

      def new
        @comment = @movie.comments.build
      end

      def edit; end

      def create
        @comment = @movie.comments.build(permitted_comment_params)

        if @comment.save
          redirect_to movie_comments_path(@movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(permitted_comment_params)
          redirect_to movie_comments_path(@movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        if @comment.destroy
          redirect_to movie_comments_path(@movie), notice: t('.success')
        else
          redirect_to movie_comments_path(@movie), notice: t('.fail')
        end
      end

      private

      def find_comment
        @comment = @movie.comments.find(params[:id])
      end

      def permitted_comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
