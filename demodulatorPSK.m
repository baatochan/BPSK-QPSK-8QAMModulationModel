function [ demodulatedBitArrayPSK ] = demodulatorPSK (x, BIT_NUMBER)

demodulatedBitArrayPSK = zeros(BIT_NUMBER, 1);

for i = 1:BIT_NUMBER

    if x(i) > 0
        
        demodulatedBitArrayPSK(i) = 1;
       
    else
        
        demodulatedBitArrayPSK(i) = 0;
        
    end
    
end

end