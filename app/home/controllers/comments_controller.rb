class CommentsController < ModelController
  def initialize(data=nil)
    if data
      model(data)
      puts "init with #{data.inspect} - #{data.locals.inspect}"
    end
  end
end
