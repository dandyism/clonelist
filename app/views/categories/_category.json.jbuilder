json.(category, :id, :name, :created_at, :updated_at)

posts ||= nil
unless posts.nil?
  json.posts(posts) do |post|
    json.partial! 'posts/post', post: post
  end
end
