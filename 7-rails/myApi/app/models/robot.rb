class Robot < ApplicationRecord
  validates :profession, :name, :fly, presence: true
end
