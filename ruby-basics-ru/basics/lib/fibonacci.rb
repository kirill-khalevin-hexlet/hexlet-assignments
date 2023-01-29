# frozen_string_literal: true

# BEGIN
def fibonacci(n)
  return 0 if n.zero?

  arr = []
  n.times do |_|
    first = arr[0] || 0
    arr[0] = arr[1] || 0
    arr[1] = (arr[1] || 1) + first
  end
  arr[0] > arr[1] ? arr[0] : arr[1]
end
# END
