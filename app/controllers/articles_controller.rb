class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:  [:show, :index]
  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all
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
  
  private
    def set_article
      @articles = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:body,:cover)
    end
end