function [BER] = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArray)

iterator = 0;

for i = 1:BIT_NUMBER
   
    if bitArray(i) ~= demodulatedBitArray(i)
        
        iterator = iterator + 1;
        
    end
    
end

BER = iterator / BIT_NUMBER;

end