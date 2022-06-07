class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: @article, status: :ok, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


end
