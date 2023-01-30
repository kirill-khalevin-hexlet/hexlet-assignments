# frozen_string_literal: true

# BEGIN
def count_by_years(data)
  data.filter { |human| human[:gender] == 'male' }
      .each_with_object({}) do |man, years|
        year = man[:birthday].split('-').first
        years[year] ||= 0
        years[year] += 1
      end
end
# END
