#
# The controller used to access the articles resources
class ArticlesController < ApplicationController
  #
  # Route: GET /articles
  # Returns all articles as JSON
  def index
    @articles = Article.all
  end

end
