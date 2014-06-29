json.(category, :name, :created_at, :updated_at)

posts ||= nil
unless posts.nil?
  posts.each do |post|
    json.partial! 'post/post', post: post
  end
end
