class CommentsController < ModelController
  model :page
  
  def initialize(data=nil)
    puts "init with #{data.inspect} - #{data.locals.inspect}"
    @model = data
  end
end
