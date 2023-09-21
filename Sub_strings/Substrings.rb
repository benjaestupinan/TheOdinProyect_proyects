def CountIn(string, substrings)
    
    arr = string.downcase.split("")
    n_arr = arr.length

    subarr = substrings.downcase.split("")
    n_sub = subarr.length

    count = 0

    for i in (0...n_arr)
        
        if subarr[0] == arr[i] and i + n_sub <= n_arr and subarr == arr.slice(i,n_sub)
            count += 1
        end
    end

    return count
end


def substrings(string, dictionary)
    
    n = dictionary.length
    hash = Hash.new()

    for i in (0...n)
        sum = CountIn(string, dictionary[i])
        if sum > 0
            hash[dictionary[i]] = sum
        end
    end
    return hash
end