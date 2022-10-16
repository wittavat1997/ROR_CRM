class Service < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :duration, numericality: {greater_then_or_equal_to: 0, less_than_or_equal_to: 100}
    validates :client_price, numericality: {greater_then_or_equal_to: 0, less_than_or_equal_to: 10000}
    
    def to_s
        name
    end
end
