class Chirp < ApplicationRecord
    validates :body, presence: true
    # author is the name of the method we're writing
    # primary key is 99% of the time ID

    # if the foreign key is present on a table, that means "belongs_to"
    #belongs to method also creates chirp.author and chirp.author = 
    

    
    belongs_to :author, 
        class_name: :User,
        primary_key: :id,
        foreign_key: :author_id

    #has one come after the belongs_to because it relies on the belongs_to
    #association
    has_one :location,
        through: :author,
        source: :location
    
    has_many :likes,
      primary_key: :id, # in our own class (has_many)
      foreign_key: :chirp_id,
      class_name: :Like
    
    has_many :likers,
      through: :likes,
      source: :user

    #Below are valid inputs as well

    # belongs_to :author, 
    #     class_name: "User",
    #     primary_key: :id,
    #     foreign_key: :author_id

    
    # belongs_to (:author, 
    #     {class_name: :User,
    #     primary_key: :id,
    #     foreign_key: :author_id})
end