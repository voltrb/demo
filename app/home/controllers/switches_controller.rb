class SwitchesController < ModelController
  model :page
  
  def initialize
    super
    
    self._p1 = _box4.and(_box1.or(_box2))
    self._p2 = _box5.and(_box2.or(_box3))
    
    self._c1 = _box1.or(_p1).or(_p2.and(_box4))
    self._c2 = _box2.or(_p1).or(_p2)
    self._c3 = _box3.or(_p2).or(_p1.and(_box5))
  end
end