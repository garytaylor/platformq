#
# The controller used to access the articles resources
class ArticlesController < ApplicationController
  #@TODO This is a workaround as I havent implemented a way to get the authenticity token over the API
  protect_from_forgery except: :create
  #
  # Route: GET /articles
  # Returns all articles as JSON
  def index
    @articles = Article.all
  end
  def create
    @article = Article.new params.permit(:title, :body, :url_slug)
    @article.owner = current_user
    @article.body_content_type = 'text/x-markdown'
    @article.posted_on = Time.now
    if @article.save
      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        render :error
      end
    end
  end

end
