#
# In preference to using active model callbacks which could for example send an email automatically to all subscribers
# whenever an article is created.  This then creates a model which you can only use in circumstances where you want that
# behaviour.  Personally, I prefer to see the code in the controller so that are no magic callback handlers doing things
# that I may not expect. -
# This class contains logic that you want to execute from a controller or a model to perform various tasks at key stages
module ArticleService
  class << self
    def after_user_article_create(article)
      Subscription.all.each do |subscription|
        ArticleMailer.new_article_created(article, subscription).deliver_later
      end

    end
  end

end