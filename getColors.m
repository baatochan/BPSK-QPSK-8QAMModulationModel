function [colorPSK, colorQPSK] = getColors (BIT_NUMBER, bitArray)

colorPSK = zeros(BIT_NUMBER, 3);
colorQPSK = zeros(floor(BIT_NUMBER/2), 1);

for i=1:BIT_NUMBER
    if bitArray(i) == 0
        colorPSK(i,1)=0;
        colorPSK(i,2)=0;
        colorPSK(i,3)=1;
    end
    if bitArray(i) == 1
        colorPSK(i,1)=1;
        colorPSK(i,2)=0;
        colorPSK(i,3)=0;
    end
end

for i = 1:(BIT_NUMBER/2)
        if bitArray(2*i) == 0
                if bitArray((2*i)-1) == 0
                    colorQPSK(i) = 1;
                end 
                if bitArray((2*i)-1) == 1
                    colorQPSK(i) = 2;
                end
        end
        if bitArray(2*i) == 1
                if bitArray((2*i)-1) == 0
                    colorQPSK(i) = 3;
                end 
                if bitArray((2*i)-1) == 1
                    colorQPSK(i) = 4;
                end
        end
end

end