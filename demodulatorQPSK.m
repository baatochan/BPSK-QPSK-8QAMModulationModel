function [ demodulatedBitArrayQPSK ] = demodulatorQPSK (x, y, BIT_NUMBER)

demodulatedBitArrayQPSK = zeros(BIT_NUMBER, 1);

for i = 1:BIT_NUMBER/2

    if x(i) > 0
        
        if y(i) > 0
            
            demodulatedBitArrayQPSK((2*i) - 1) = 1;
            demodulatedBitArrayQPSK(2*i) = 1;
            
        else
            
            demodulatedBitArrayQPSK((2*i) - 1) = 1;
            demodulatedBitArrayQPSK(2*i) = 0;
            
        end
       
    else
        
        if y(i) > 0
            
            demodulatedBitArrayQPSK((2*i) - 1) = 0;
            demodulatedBitArrayQPSK(2*i) = 1;
            
        else
            
            demodulatedBitArrayQPSK((2*i) - 1) = 0;
            demodulatedBitArrayQPSK(2*i) = 0;
            
        end
        
    end
    
end

end