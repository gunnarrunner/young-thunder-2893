class Role < ApplicationRecord
  # validates :
  belongs_to :movie
  belongs_to :actor
end