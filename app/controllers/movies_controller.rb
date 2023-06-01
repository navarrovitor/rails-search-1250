class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        if params[:query].present?
            @movies = PgSearch.multisearch(params[:query]).map do |movie|
                movie = movie.searchable
            end
        end
    end
end
