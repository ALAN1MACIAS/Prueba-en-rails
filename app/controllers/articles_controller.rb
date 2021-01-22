class ArticlesController < ApplicationController

  # get "/articles"
  def index
    @articles = Article.all # Obtener todos los registros
  end
  # get "/articles/:id"
  def show
    @articles = Article.find(params[:id]) # Encuentra un registro por su ID
  end
  # get "/articles/new"
  def new
    @articles = Article.new
  end
  # post "/articles"
  def create
    # @articles = Article.new(title: params[:article][:title], body: params[:article][:body])
    @articles = Article.new(article_params) # Llamando a article_params, para insertar

    if @articles.save
      redirect_to @articles
    else
      render :new # Haciendo render de la accion new
    end
  end
  def destroy
    @articles = Article.find(params[:id]) # Elimina el objeto de la DB
    if @articles.destroy
      redirect_to articles_path
    else
      redirect_to @articles
    end
  end
  
  private
    def article_params
      # Indica que campos estan permitidos insertar, para evitar inyecciones SQL
      params.require(:article).permit(:title,:body)
    end
end