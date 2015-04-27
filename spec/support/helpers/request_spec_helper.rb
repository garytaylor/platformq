module RequestSpecHelper
  def response_json
    JSON.parse(response.body).with_indifferent_access
  end
  # For now, the current user is the first user
  def current_user
    User.first
  end
end