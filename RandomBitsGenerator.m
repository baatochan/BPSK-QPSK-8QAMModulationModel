function bitArray = RandomBitsGenerator(BIT_NUMBER)

    bitArray = rand(BIT_NUMBER,1); %generacja losowych liczb z przedzialu (0,1)

    for i = 1:BIT_NUMBER %zamiana losowych liczb na bity (jesli x<0.5 to 0, else 1)
        if(bitArray(i) < 0.5)
            bitArray(i) = 0;
        else
            bitArray(i) = 1;
        end
    end

end
