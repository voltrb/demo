class IndexController < ModelController
  def initialize
    @model = page
    
    self._list << {_label: 'One'}
    self._list << {_label: 'Two'}
    self._list << {_label: 'Three'}
  end
end