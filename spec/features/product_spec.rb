require 'rails_helper'

describe "Article", type: :feature do
  it "Redirecciona al articulo creado despues de crear un articulo" do
    visit "/articles/new"
    fill_in 'article_title', with: "Mi primer articulo"
    fill_in 'article_body', with: "Creando primera prueba con capibara y rspec"
    check 'categories_'
    find("input[type='submit']").click
    expect(page).to have_content('Mi primer producto')  
  end
end