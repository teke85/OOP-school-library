class Nameable
  def correct_name
    raise NotImplementedError, "The '#{self.class}##{__method__}' method is not implemented by #{self.class}"
  end
end

