class ItemsController < ModelController
  model :page
  
  def initialize
    super
    
    
    _new_item = Item.new
  end
  
  def add_item
    self._items << _new_item.cur
    
    puts self._items.last.cur.options.inspect
    self._new_item = Item.new
  end
  
  def test1(event)
    puts event.inspect
    puts event.target.inspect
    `console.log(event.js_event);`
  end
end