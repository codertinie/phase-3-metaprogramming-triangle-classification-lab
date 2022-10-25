require 'pry'

class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    #if all sides ar equal
    if a == b && b == c 
      :equilateral
      #if two sides are equal
    elsif  a == c || a == b || b==c
      :isosceles
      #if no side is equal
    else
      :scalene
    end
  end


  # all sides must be greater than zero and no negative numbers
  def all_sides_greater_than_zero?
    [a,b,c].all?(&:positive?)
  end

  #sum of two sides must be greater than the third side
  def valid_triangle?
    a + b > c && a + c > b && c + b > a
  end

  #check if the triangle is valid
  def validate_triangle
    raise TriangleError unless valid_triangle? && all_sides_greater_than_zero?
  end

  #custom error message
  class TriangleError < StandardError
  end
end
binding.pry
