# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if stop < start

  result = []
  start.upto(stop) do |number|
    current = "#{number % 3 == 0 ? 'Fizz' : ''}#{number % 5 == 0 ? 'Buzz' : ''}"
    current = current.empty? ? number : current
    result << current
  end
  result.join(' ')
end
# END
