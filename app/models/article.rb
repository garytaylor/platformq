#
# A blog article belonging to a user
class Article < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
end
