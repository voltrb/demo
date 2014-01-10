class User < Model
  def full_name
    return self._first_name + self._last_name
  end
end