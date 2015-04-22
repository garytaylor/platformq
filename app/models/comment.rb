#
# A comment belonging to an article and a user
#
class Comment < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :article
end
