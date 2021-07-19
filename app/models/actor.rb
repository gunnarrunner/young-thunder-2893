class Actor < ApplicationRecord
  # validates :
  # belongs_to :
  has_many :roles
  has_many :movies, through: :roles
end