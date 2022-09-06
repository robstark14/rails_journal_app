class Task < ApplicationRecord
    validates :name, presence:true, uniqueness:true, length: {maximum:100}
    validates :details, length:{maximum: 1000}
    belongs_to :category
end
