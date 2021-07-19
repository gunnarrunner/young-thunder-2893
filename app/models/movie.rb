class Movie < ApplicationRecord
  belongs_to :studio
  has_many :roles
  has_many :actors, through: :roles

  def order_youngest_to_oldest
    actors.order(:age)
  end

  def average_age
    actors.average(:age)   
  end
end