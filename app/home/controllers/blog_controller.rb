class BlogController < ModelController
  model :store

  def index
    page._blog_name = 'Test Blog'

    page._new_post = Post.new
  end

  def format_number(number)
    number.with {|s| s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse }
  end

  def format_with_breaks(str)
    str.gsub("\n", "<br />")
  end

  def add_post
    store._posts << page._new_post.cur.attributes

    page._new_post = Post.new
  end

  def toggle_comments
    controller._showing_comments = (!controller._showing_comments).cur
  end

end
