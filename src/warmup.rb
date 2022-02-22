def fib(n)
    sequence = Array.new

    if n == 0 then
      return []
    elsif n == 1 then
        return [0]
    elsif n == 2 then
        return [0, 1]
    else
        sequence = fib(n-1)
        sequence << sequence[-2] + sequence[-1]
        return sequence
    end
end

def isPalindrome(n)
    list = Array.new
    
    while n > 0
      digit = n % 10
      n /= 10
      puts digit
      list.push(digit)
    end
    
    i = 0
    while i < (list.length / 2)
        if list[i] != list[(-i)-1] then
            return false
        end
        i += 1
    end
    
    return true
end

def nthmax(n, a)
    if n >= a.length
        return nil
    end
    a.sort! {|x, y| y<=>x}
    return a[n]
end

def freq(s)
    if s.empty? then
        return s
    else
        list = Hash.new()
        
        i = 0
        while i < s.length
            if list.has_key?(s[i])
                list[s[i]] += 1
            else
                list.store(s[i], 1)
            end
            
            i += 1
        end
        list.key(list.values.max)
    end
end

def zipHash(arr1, arr2)
    if arr1.length !=  arr2.length then
        return nil
    else
        list = Hash.new
        
        i = 0
        while i < arr1.length
            list.store(arr1[i], arr2[i])
            i += 1
        end
        return list
    end
end

def hashToArray(hash)
    arr = Array.new
    
    hash.each_key do |i|
        hashes = Array.new
        hashes[0] = i
        hashes[1] = hash[i]
        arr.push(hashes)
    end
    return arr
end
