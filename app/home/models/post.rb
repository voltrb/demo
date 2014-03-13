class Post < Model
  validate :_title, length: 10
  validate :_body, length: 10
end