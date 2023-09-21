$alfabet = "abcdefghijklmnopqrstuvwxyz"
$ALFABET = $alfabet.upcase

$largoABC = $alfabet.length
 
def indexInList(list, value)

    n = list.length
    index = ""

    for i in (0...n)

        if list[i] == value
            
            index = i
          
        end
    end
    return index
end


def caesar_cipher(string, shift)
    stringList = string.split("")
    n = stringList.length

    for i in (0...n) 

        if $alfabet.include?(stringList[i])

            index = (indexInList($alfabet.split(""), stringList[i]) + shift) % $largoABC
            stringList[i] = $alfabet[index]
        
        elsif $ALFABET.include?(stringList[i])

            index = (indexInList($ALFABET.split(""), stringList[i]) + shift) % $largoABC
            stringList[i] = $ALFABET[index]            
            
        end
    end

    return stringList.join
end