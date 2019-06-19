class Course < ApplicationRecord
  has_and_belongs_to_many :users
  validates :name, presence: true
  has_many :lectures
  has_many_attached :documents
end
