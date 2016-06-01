class Page < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true
  validates :body, presence: true
end
