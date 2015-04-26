class ArticleMailer < ApplicationMailer
  default from: 'admin@myblog.com'
  def new_article_created(article, subscription)
    @article = article
    @subscription = subscription
    mail to: subscription.email, subject: 'A new article has been posted'
  end
end