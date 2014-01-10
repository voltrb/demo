class BlogController < ModelController
  def initialize
    @model = page

    self._blog_name = self._blog_name.or('The Coolz').cur
    self._blog_name2 = self._blog_name.or('Yes').cur
    _new_post._title = ''
  end
  
  def add_post
    _posts << _new_post.cur.attributes
    
    self._new_post = {}
  end
  
  def toggle_comments
    controller._showing_comments = (!controller._showing_comments).cur
  end
  
end
