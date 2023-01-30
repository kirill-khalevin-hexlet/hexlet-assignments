# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_stack
    arr = [1, 2, 3, 4]
    stack = Stack.new(arr)

    assert { stack.to_a == arr }
    assert { stack.empty? == false }
    assert { stack.size == arr.size }
    assert { stack.pop! == 4 }
    stack.push!(10)
    assert { stack.to_a == [1, 2, 3, 10] }
    stack.clear!
    assert { stack.to_a == [] }

  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
