class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save 
  		flash[:success] = "Article has been created"
  		redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
  	end
  end

  def show
    
  end

  protected

  def resource_not_found
    flash[:alert] = "The article you requested can not be found"
    redirect_to root_path
  end

  private

  def article_params
  	params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
  
end
