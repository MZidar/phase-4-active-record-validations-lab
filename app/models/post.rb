class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        unless !!title && title.match(/Top \d|Won't Believe|Secret|Guess/)
            errors.add(:title, "Sorry, need clicks bro.")
        end
    
    end

end
