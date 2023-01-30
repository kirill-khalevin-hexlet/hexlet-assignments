# frozen_string_literal: true

# BEGIN
def get_same_parity(data)
  modulo = (data.first || 0) % 2
  data.filter { |num| num % 2 == modulo }
end
# END
