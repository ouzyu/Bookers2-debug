class TagMap < ApplicationRecord
  belongs_to :book
  belongs_to :tag

  validates :book_id, presence: true
  validates :tag_id, presence: true
end
