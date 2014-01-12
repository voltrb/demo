class IndexController < ModelController
  def initialize
    @model = page
    
    self._todo_lists << {_name: 'One', _todos: []}
    self._todo_lists << {_name: 'Two', _todos: []}
    self._todo_lists << {_name: 'Three', _todos: []}
    
    cur_index = params._index.or(0).to_i
    
    cur_todo = self._todo_lists[cur_index]
    self._current_todo = cur_todo
    
    20.times do
      self._current_todo._todos << {_label: "Test"}
    end
  end
  
  def current_template
    @current_template ||= params._controller.or('landing')
  end
  
  def add_todo_list
    self._todo_lists << {_name: self._new_todo_list_name.cur, _todos: []}
    self._new_todo_list_name = ''
  end
  
  def remove_todo_list(index)
    self._todo_lists.delete_at(index)
  end
  
  def set_current_todo(index)
    Benchmark.bm do 
      params._index = index.cur
    end
  end
  
  def add_todo
    self._current_todo._todos << {_label: self._new_todo.cur, _completed: false}
    self._new_todo = ''    
  end
  
  def checked
    # _current_todo._todos.count {|v|  r = v._completed == true ; r }
    ReactiveValue.new(5)
  end
  
  def send_message
    channel.send('Cool beans')
  end
end
