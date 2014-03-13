class CommentsController < ModelController
  def initialize(data=nil)
    model(data) if data
  end

  def add_comment
    self.post._comments << controller._comment.cur.attributes
    controller._comment = {}
  end
end
