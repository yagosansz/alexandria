class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :given_name, presence: true
  validates :family_name, presence: true
end
