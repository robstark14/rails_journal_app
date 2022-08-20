class Category < ApplicationRecord
  validates :name, presence:true, uniqueness:true, length: {maximum:20}
  validates :description, presence:true, length:{minimum: 10, maximum: 100}

end
