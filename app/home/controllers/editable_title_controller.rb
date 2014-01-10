class EditableTitleController < ModelController
  def initialize(*args)
    super
    
    @toggled = ReactiveValue.new(false)
  end
  
  def toggled
    @toggled
  end
  
  def toggle_editing
    puts "Toggle"
    controller._toggled = (!controller._toggled).cur
  end
  
  def title_edit(event)
    if event.key_code == 13
      event.stop
      
      toggle_editing
    end
  end
end