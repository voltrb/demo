class SwitchesController < ModelController
  model :page
  
  def initialize
    super
    
    self._middle = self._box3.and((self._box1).or(self._box2))
    self._light1 = self._box1.or(self._middle)
    self._light2 = self._box2.or(self._middle)
  end
end