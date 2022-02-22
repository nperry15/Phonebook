class PhoneBook
    NUM_ROT = 3
    NUM_LENGTH = 12
    DASH_CHAR = "-"
    
    NAME = 0
    NUMB = 1
    IS_LISTED = 2
    
    

    def initialize
        @data = Array.new
    end

    def add(name, number, is_listed)
        #check if number is valid
        if !(validToAdd(name, number, is_listed)) then return false end
        info = Array.new
        
        info[NAME] = name
        info[NUMB] = number
        info[IS_LISTED] = is_listed
        
        @data.push(info)
        
        return true
    end

    def lookup(name)
        i = 0
        while i < @data.length
            if @data[i][IS_LISTED] && @data[i][NAME] == name
                return @data[i][NUMB]
            end
            i += 1
        end
        
        return nil
    end

    def lookupByNum(number)
        i = 0
        while i < @data.length
            if @data[i][IS_LISTED] && @data[i][NUMB] == number
                return @data[i][NAME]
            end
            i += 1
        end
        
        return nil
    end

    def namesByAc(areacode)
        list = Array.new
        i = 0
        while i < (@data.length)
            aCode = Array.new
            
            x = 0
            while x < NUM_ROT
                aCode[x] = @data[i][NUMB][x]
                x += 1
            end
            
            if areacode == aCode*"" then list.push(@data[i][NAME]) end

            i += 1
        end
        return list
    end
    
    private def validNumber(num)
        if num.length != NUM_LENGTH then return false end
        i = 0
        while i < NUM_LENGTH
            if(i == NUM_ROT || i == ((NUM_ROT * 2) + 1)) then
                if num[i] != DASH_CHAR then return false end
            else
                if !(num[i].to_i.to_s == num[i]) then return false end
            end
            i += 1
        end

        true
    end
    
    private def nameAvailable(name, is_listed)
        i = 0
        while i < @data.length
            if @data[i][NAME] == name
                return false
            end
            i += 1
        end
        return true
    end
    
    private def numberAvailable(num, is_listed)
        i = 0
        while i < @data.length
            if @data[i][NUMB] == num
                if (is_listed) && (@data[i][IS_LISTED])
                    return false
                end
            end
            i += 1
        end
        return true
    end
    
    private def validToAdd(name, num, is_listed)
        if (validNumber(num) && nameAvailable(name, is_listed) && numberAvailable(num, is_listed))
            return true
        end
        return false
    end
end
