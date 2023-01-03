# frozen_string_literal: true

module Web
  class ApplicationController < ActionController::Base
    helper_method :resource_movie

    def resource_movie
      @movie = Movie.find(params[:movie_id])
    end
  end
end
