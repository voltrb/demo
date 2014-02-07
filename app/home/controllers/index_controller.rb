class IndexController < ModelController
  model :page
  
  def initialize 
    self._todo_lists << {_name: 'One', _todos: []}
    self._todo_lists << {_name: 'Two', _todos: []}
    self._todo_lists << {_name: 'Three', _todos: []}
    
    cur_index = params._index.or(0).to_i
    
    cur_todo = self._todo_lists[cur_index]
    self._current_todo = cur_todo
    
    20.times do
      self._current_todo._todos << {_label: "Test"}
    end
    
    self._all_checked.on('changed') do
      check_all(self._all_checked.cur)
    end
  end
  
  def clicked(arg)
    puts "Clicked: #{arg}"
  end
  
  def remove_item_at(index)
    puts "REMOVE AT: #{index.cur}"
    store._items.delete_at(index.cur)
  end
  
  def check_all(true_false)
    todos = self._current_todo._todos
    todos.size.cur.times do |index|
      todos[index]._completed = true_false
    end
  end
  
  def add_items
    
    a = store._items.cur
    a << {_name: 'one'}
    a << {_name: 'two2'}
    
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
    # channel.send('Cool beans')
    tasks.call('StoreTasks', 'save', 1,2,3)
  end
end
