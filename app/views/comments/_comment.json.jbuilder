json.extract! comment, :id, :content, :parent_id, :root_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
