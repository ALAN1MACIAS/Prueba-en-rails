class ArticlesController < ApplicationController

  # get "/articles"
  def index
    @articles = Article.all # Con esto podemos acceder a los datos desde la vista y el controlador
  end
  # get "/articles/:id"
  def show
    @articles = Article.find(params[:id]) # params es un hash que lleva todos los paremetros que se enviaron al servidor web
  end
  # get "/articles/new"
  def new
    @articles = Article.new
  end
  # post "/articles"
  def create
    @articles = Article.new(title: params[:article][:title], body: params[:article][:body])
    @articles.save
    redirect_to @articles
  end
end