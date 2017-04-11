function [ carrierWawe, timeAxis, numberOfSamplesInSymbol, x, y ] = ChannelQPSK( WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega )

sampleFrequency = 20000; % czestotliwosc probkowania [Hz]
    amplitude = 0.5;          % amplituda
    signalLength = (1/WAWE_FREQUENCY)*(BIT_NUMBER/2);
    symbolLength = (1/WAWE_FREQUENCY);
    
    numberOfSamples = signalLength*sampleFrequency;
    numberOfSamplesInSymbol = symbolLength*sampleFrequency;
    timeAxis = 0:1/(sampleFrequency):(numberOfSamples-1)/(sampleFrequency);
    
    carrierWawe = zeros(1, numberOfSamplesInSymbol*(BIT_NUMBER/2));
    x= zeros(1, BIT_NUMBER/2);
    y= zeros(1, BIT_NUMBER/2);
    
    for i = 1:(BIT_NUMBER/2)
        if bitArray(2*i) == 0
                if bitArray((2*i)-1) == 0
                    offset = 0.625;
                end 
                if bitArray((2*i)-1) == 1
                    offset = 0.875;
                end
        end
        if bitArray(2*i) == 1
                if bitArray((2*i)-1) == 0
                    offset = 0.375;
                end 
                if bitArray((2*i)-1) == 1
                    offset = 0.125;
                end
        end
        amplitudeDist = sigmaU*randn();
        sigmaDist = sigmaOmega*randn();
        x(i)=(amplitudeDist+amplitude)*cos(2*pi*(offset + sigmaDist));
        y(i)=(amplitudeDist+amplitude)*sin(2*pi*(offset + sigmaDist));

        for j = 1:numberOfSamplesInSymbol
            carrierWawe(((i-1)*numberOfSamplesInSymbol)+j) = (amplitudeDist+amplitude)*cos(2*pi*WAWE_FREQUENCY*timeAxis(((i-1)*numberOfSamplesInSymbol)+j) + 2*pi*(offset + sigmaDist));
        end
    end
end