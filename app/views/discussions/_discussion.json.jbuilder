json.extract! discussion, :id, :url, :title, :comments_count, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
