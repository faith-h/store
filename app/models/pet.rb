class Pet < ApplicationRecord
  belongs_to :department
  has_many :comments
end
