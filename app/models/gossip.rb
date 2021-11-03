class Gossip < ApplicationRecord
    validates :title, :content,
        presence: { message: "must be given please" }
    validates :title,
        length: {minimum: 3, maximum: 14}
    
    belongs_to :user
    has_and_belongs_to_many :tags
    has_many :comments
end

