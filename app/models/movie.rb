class Movie < ApplicationRecord
  belongs_to :director

  include PgSearch::Model
  
  pg_search_scope :search_movies,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true }
    }
  
  pg_search_scope :global_search,
    against: [ :title, :synopsis ],
    associated_against: {
      director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

    multisearchable against: [:title, :synopsis]
end

