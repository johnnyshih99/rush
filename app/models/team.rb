class Team < ApplicationRecord
  has_many :players
  validates :abbr, presence: true
  validates :abbr, uniqueness: true
end
