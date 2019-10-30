#Find the integer that produces the longest Collatz sequence

def longest_collatz_sequence(max, min = 1)
  # Stores n for the longest chain
  longest_n = 0

  #Stores length of longest chain
  longest_chain = 0

  # Caches lengths
  collatz_lengths = {}

  # Checks each value between min and max
  (min..max).each do |n|

    # Counts length of chain
    count = 1

    # Preserve value of n for storing when longest chain is found
    i = n

    # While the value of the chain is > 1
    while i > 1
      # If Collatz length has already been found for current i
      if collatz_lengths[i]
        # For remainder of the sequence, use the length that was already found
        count += collatz_lengths[i]
        # Stop
        break
      else
        # Store the next number in the sequence - if i is even, divide by 2, else multiply by 3 and add 1
        i = i.even? ? i / 2 : 3 * i + 1
        # Increment chain length count
        count += 1
      end
    end

    # Cache sequence length for current n
    collatz_lengths[n] = count

    # If current n created longest chain, store values
    if count > longest_chain
      longest_chain = count
      longest_n = n
    end
  end
  longest_n
end

puts longest_collatz_sequence(1000000, 1)