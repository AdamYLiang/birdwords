class Like < ApplicationRecord
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id, 
    class_name: :User

  belongs_to :chirp,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Chirp
end