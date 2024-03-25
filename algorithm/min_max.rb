# Method calculate min sum and max sum
# Return array of min sum and max sum
def find_min_max(array_input)
  sum_total = array_input.sum
  max_sum = nil
  min_sum = nil
  array_input.each do |item|
    total = sum_total - item
    max_sum = total if max_sum.nil? || max_sum < total
    min_sum = total if min_sum.nil? || min_sum > total
  end
  [min_sum, max_sum]
end

# Get input array and call method to calculate
puts 'Enter 5 integer space-separated:'
array_input = gets.chomp.split.map(&:to_i)
result = find_min_max(array_input)
puts 'Min sum and max sum:'
puts result.join(' ')
