function [ carrierWawe, timeAxis, numberOfSamplesInSymbol, x, y, x0, y0, x1, y1 ] = ChannelPSK( WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega )

 % Parametry
    sampleFrequency = 20000; % czestotliwosc probkowania [Hz]
    amplitude = 0.5;          % amplituda
    signalLength = (1 / WAWE_FREQUENCY) * BIT_NUMBER;
    symbolLength = 1/WAWE_FREQUENCY;
    
    
    
    numberOfSamples = signalLength*sampleFrequency;
    numberOfSamplesInSymbol = symbolLength*sampleFrequency;
    timeAxis = 0:1/(sampleFrequency):(numberOfSamples-1)/(sampleFrequency);
    
    
    
    carrierWawe = zeros(1, numberOfSamplesInSymbol*BIT_NUMBER);
    x= zeros(1, BIT_NUMBER);
    y= zeros(1, BIT_NUMBER);
    x0_temp= zeros(1, BIT_NUMBER);
    y0_temp= zeros(1, BIT_NUMBER);
    x1_temp= zeros(1, BIT_NUMBER);
    y1_temp= zeros(1, BIT_NUMBER);
    
    
    for i = 1:BIT_NUMBER
        amplitudeDist = sigmaU*randn();
        sigmaDist = sigmaOmega*randn();
        
        if bitArray(i) == 0
            offset = 0.5;
            x0_temp(i)=(amplitudeDist+amplitude)*cos(2*pi*(offset + sigmaDist));
            y0_temp(i)=(amplitudeDist+amplitude)*sin(2*pi*(offset + sigmaDist));
        else
            offset = 0;
            x1_temp(i)=(amplitudeDist+amplitude)*cos(2*pi*(offset + sigmaDist));
            y1_temp(i)=(amplitudeDist+amplitude)*sin(2*pi*(offset + sigmaDist));
        end
        
        x(i)=(amplitudeDist+amplitude)*cos(2*pi*(offset + sigmaDist));
        y(i)=(amplitudeDist+amplitude)*sin(2*pi*(offset + sigmaDist));
        for k = 1:numberOfSamplesInSymbol
           % deltaU(((i-1)*numberOfSamplesInSymbol)+j)
            carrierWawe(((i-1)*numberOfSamplesInSymbol)+k) = (amplitudeDist+amplitude)*cos(2*pi*WAWE_FREQUENCY*timeAxis(((i-1)*numberOfSamplesInSymbol)+k) + 2*pi*(offset+sigmaDist));
        end
    end
    
    iterator0 = 0;
    iterator1 = 0;
    
    for i=1:BIT_NUMBER
        if x0_temp(i) ~= 0
            if y0_temp(i) ~= 0
                iterator0 = iterator0 + 1;
            end
        end
    end
    
    for i=1:BIT_NUMBER
        if x1_temp(i) ~= 0
            if y1_temp(i) ~= 0
                iterator1 = iterator1 + 1;
            end
        end
    end
    
    x0= zeros(1, iterator0);
    y0= zeros(1, iterator0);
    x1= zeros(1, iterator1);
    y1= zeros(1, iterator1);
    
    k = 0;
    for i=1:BIT_NUMBER
        if x0_temp(i) ~= 0
            if y0_temp(i) ~= 0
                k = k + 1;
              	x0(k) = x0_temp(i);
              	y0(k) = y0_temp(i);
            end
        end
    end
    
    k=0;
    for i=1:BIT_NUMBER
        if x1_temp(i) ~= 0
            if y1_temp(i) ~= 0
                k = k + 1;
              	x1(k) = x1_temp(i);
              	y1(k) = y1_temp(i);
            end
        end
    end
    
    
end

