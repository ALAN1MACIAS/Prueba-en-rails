class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_article, except: [:index, :new, :create]
  before_action :authenticate_editor?, only: [:new,:create,:update]
  before_action :authenticate_admin?, only: [:destroy, :publish]

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 3).publicados.ultimos
  end

  def show
    @articles.update_visits_count
    @comment = Comment.new
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = current_user.articles.new(article_params)
    @articles.categories = params[:categories]
    #raise params.to_yaml #Dispara lo parametros que se le estan enviando
    if @articles.save
      redirect_to @articles
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    if @articles.destroy
      redirect_to articles_path
    else
      redirect_to @articles
    end
  end

  def update
    if @articles.update_attributes(article_params)
      redirect_to @articles
    else
      redirect_to :edit
    end
  end

  def publish
    @articles.publish!
    redirect_to @articles
  end
  
  private
    def set_article
      @articles = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:body,:cover,:categories)
    end
end