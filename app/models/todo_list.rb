class TodoList < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :title, length: { minimum: 2 }
end
