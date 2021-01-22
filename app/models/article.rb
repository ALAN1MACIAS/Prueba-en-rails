class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true # Valida que el elemencto no este vacio
  validates :body, presence: true, length: {minimum:20, maximum:250}
end
