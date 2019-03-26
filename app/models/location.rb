class Location < ApplicationRecord
    validates :name, presence: true

    has_many :users,
        class_name: :User,
        primary_key: :id,
        foreign_key: :location_id

    has_many :chirps,
        through: :users,
        source: :chirps
end