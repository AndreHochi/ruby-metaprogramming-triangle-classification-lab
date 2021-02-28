require 'pry'

class Triangle

  attr_accessor :a, :b, :c, :kind

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
    tri_check
    type_of_tri
  end

  def tri_check
    ordered_lengths = [self.a, self.b, self.c].sort
    ##binding.pry
    if (ordered_lengths[0] + ordered_lengths[1] <= ordered_lengths[2]) || self.a <= 0 || self.b <= 0 || self.c <= 0 
      raise TriangleError
    end
  end

  def type_of_tri
    num_same = 0
    ordered_lengths = [self.a, self.b, self.c].sort
    if ordered_lengths[0] == ordered_lengths[1]
      num_same = num_same + 1
    end

    if ordered_lengths[1] == ordered_lengths[2]
      num_same = num_same + 1
    end

    if num_same == 0
      self.kind = :scalene
    elsif num_same == 1
      self.kind = :isosceles
    else
      self.kind = :equilateral
    end

  end

  class TriangleError < StandardError
    # triangle error code
  end
end