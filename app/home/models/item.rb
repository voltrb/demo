class Item < Model
  def full_name
    'Mr ' + _name
  end
end