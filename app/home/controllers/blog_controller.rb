class BlogController < ModelController
  model :page
  
  def initialize
    puts "Blog!"
    super
    
    self._blog_name = 'Test Blog'
    self._new_post._title = ''
  end
  
  def dom_ready
    puts "Blog Dom Ready"
  end
  
  def dom_removed
    puts "Blog Dom Removed"
  end
  
  def format_number(number)
    number.with {|s| s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse }
  end
  
  def format_with_breaks(str)
    str.gsub("\n", "<br />")
  end
  
  def add_post
    _posts << _new_post.cur.attributes
    
    self._new_post = {}
  end
  
  def toggle_comments
    controller._showing_comments = (!controller._showing_comments).cur
  end
  
end
