class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true # Valida que el elemencto no este vacio
  validates :body, presence: true, length: {minimum:20, maximum:250}
end
