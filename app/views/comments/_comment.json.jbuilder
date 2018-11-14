json.extract! comment, :id, :discussion_id, :name, :email, :body, :ip_address, :user_agent, :created_at, :updated_at
json.url comment_url(comment, format: :json)
