class Restaurant < ActiveRecord::Base
    has_many :reviews 
    has_many :customers, through: :reviews

    def self.fanciest 
        self.order("price desc").first
    end

    def all_reviews 
        return self.reviews.map do |review| 
            "Review for #{review.restaurant.name} by #{review.customer.full_name}: #{review.star_rating} stars."
        end
    end
end