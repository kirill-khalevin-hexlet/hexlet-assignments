# frozen_string_literal: true

module Web
  module Movies
    class ReviewsController < Web::ApplicationController
      before_action :resource_movie
      before_action :find_review, only: %i[show edit update destroy]

      def index
        @reviews = @movie.reviews.order(created_at: :desc)
      end

      def show; end

      def new
        @review = @movie.reviews.build
      end

      def edit; end

      def create
        @review = @movie.reviews.build(permitted_review_params)

        if @review.save
          redirect_to movie_reviews_path(@movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if @review.update(permitted_review_params)
          redirect_to movie_reviews_path(@movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        if @review.destroy
          redirect_to movie_reviews_path(@movie), notice: t('.success')
        else
          redirect_to movie_reviews_path(@movie), notice: t('.fail')
        end
      end

      private

      def find_review
        @review = @movie.reviews.find(params[:id])
      end

      def permitted_review_params
        params.require(:review).permit(:body)
      end
    end
  end
end
