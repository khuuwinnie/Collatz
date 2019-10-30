def longest_collatz_sequence(max, min = 1)
  longest_n = 0
  longest_chain = 0
  collatz_lengths = {}

  (min..max).each do |n|
    count = 1
    i = n

    while i > 1
      if collatz_lengths[i]
        count += collatz_lengths[i]
        break
      else
        i = i.even? ? i / 2 : 3 * i + 1
        count += 1
      end
    end

    collatz_lengths[n] = count

    if count > longest_chain
      longest_chain = count
      longest_n = n
    end

  end
  longest_n
end

puts longest_collatz_sequence(1000000, 1)