def BubbleSort(array)

    n = array.length()
    
    for k in (1...n) do
        j = n-k
        
        for i in (0...j)

            if array[i] > array[i+1]

                array[i], array[i+1] = array[i+1], array[i]
            
            end
        end
    end
end
