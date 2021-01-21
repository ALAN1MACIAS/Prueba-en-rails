class ArticlesController < ApplicationController

  # get "/articles"
  def index
    @articles = Article.all # Con esto podemos acceder a los datos desde la vista y el controlador
  end
  # get "/articles/:id"
  def show
    @articles = Article.find(params[:id]) # params en un hash que lleva todos los paremetros que se enviaron al servidor web
  end
  
end