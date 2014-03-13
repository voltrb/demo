class IndexController < ModelController
  model :page

  def todos
    puts "TODOS"
    cur_index = params._index.or(0).to_i

    cur_todo = self._todo_lists[cur_index]
    self._current_todo = cur_todo

    if self._todo_lists.nil?.cur
      self._todo_lists << {_name: 'One', _todos: []}
      self._todo_lists << {_name: 'Two', _todos: []}
      self._todo_lists << {_name: 'Three', _todos: []}

      20.times do
        self._todo_lists[0]._todos << {_label: "Test"}
      end
    end

    self._all_checked.on('changed') do
      check_all(self._all_checked.cur)
    end

    # @results = store._items.find('$query' => {:_complete => true}, '$orderby' => {:_name => 1})

    # @results = store._items.find({:_complete => true})

    self._new_todo = Todo.new
  end

  def db_find
    @results = store._items.find({:_name => _name_filter})
  end

  def forms
    self._item = Item.new

    # self._name_filter = '_name'
    # @results = store._items.find({'$query' => {}, '$orderby' => {_name_filter => -1}})
  end

  def results
    @results
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
    self._current_todo._todos << self._new_todo.cur
    self._new_todo = Todo.new
  end

  def completed
    _current_todo._todos.count {|v|  v._completed == true }
    # ReactiveValue.new(5)
  end

  def send_message
    # channel.send('Cool beans')
    tasks.call('StoreTasks', 'save', 1,2,3)
  end
end
