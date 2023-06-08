class Review < ApplicationRecord
  belongs_to :building

  validates :content, presence: true
end
