class Item < ApplicationRecord
  belongs_to :todo_list
  validates :title, length: { minimum: 2 }
end
