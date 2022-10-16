class Classroom < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name, case_sensitive: false
    
    def to_s
        name
    end
end
