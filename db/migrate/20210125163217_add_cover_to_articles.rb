class AddCoverToArticles < ActiveRecord::Migration[6.0]
  def change
    add_attachment :articles,:cover
  end
end
