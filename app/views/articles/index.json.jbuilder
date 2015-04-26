json.items do
  json.array! @articles do |article|
    json.author article.owner.name
    json.title article.title
    json.posted_on article.posted_on
    json.body article.body
    json.body_content_type article.body_content_type
    json.id article.id
    json.url_slug article.url_slug
    json.comments do
      json.array! article.comments do |comment|
        json.body comment.body
        json.author comment.owner.name
        json.posted_on comment.posted_on
      end
    end
  end
end
json.total @articles.count