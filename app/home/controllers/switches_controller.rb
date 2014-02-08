class SwitchesController < ModelController
  model :page
  
  def initialize
    super
    
    self._c1 = self._box1.or(self._box4)
    self._c2 = self._box2.or(self._box4).or(self._box5)
    self._c3 = self._box3.or(self._box5)
    # self._middle = self._box3.and((self._box1).or(self._box2))
    # self._light1 = self._box1.or(self._middle)
    # self._light2 = self._box2.or(self._middle)
  end
end