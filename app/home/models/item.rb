class Item < Model
  validate :_name, length: 4
  # validate :_address, length: 20
  # validate :_city, length: 5

end