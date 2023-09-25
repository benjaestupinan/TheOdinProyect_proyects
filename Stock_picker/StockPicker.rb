def indexOfMax(array)

    n = array.length()
    maxValue = array.max()

    for i in (0...n) do
        if array[i] == maxValue
            return i
        end        
    end

end


def stock_picker(arrOfDays)

    n = arrOfDays.length
    profitBestDays = 0

    for i in (0...n) do

        if arrOfDays.slice(i,n-i).max() - arrOfDays[i] > profitBestDays
            
            bestDays = [i, i + indexOfMax(arrOfDays.slice(i,n-i))]
            profitBestDays = arrOfDays.slice(i,n-i).max() - arrOfDays[i]
            puts("#{arrOfDays.slice(i,n-i).max()} - #{arrOfDays[i]} = #{profitBestDays}")


        end
        
    end

    if profitBestDays == 0

        return "There's no possible to make a profit"

    else
        return bestDays
    end
end