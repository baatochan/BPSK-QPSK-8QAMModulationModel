function [ carrierWawe, timeAxis, numberOfSamplesInSymbol, x, y ] = ChannelPSK( WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega )

 % Parametry
    sampleFrequency = 20000; % czestotliwosc probkowania [Hz]
    amplitude = 0.5;          % amplituda
    signalLength = (1/WAWE_FREQUENCY)*BIT_NUMBER;
    symbolLength = (1/WAWE_FREQUENCY);
    
    
    
    numberOfSamples = signalLength*sampleFrequency;
    numberOfSamplesInSymbol = symbolLength*sampleFrequency;
    timeAxis = 0:1/(sampleFrequency):(numberOfSamples-1)/(sampleFrequency);
    
    
    
    carrierWawe = zeros(1, numberOfSamplesInSymbol*BIT_NUMBER);
    x= zeros(1, BIT_NUMBER);
    y= zeros(1, BIT_NUMBER);
    
    
    for i = 1:BIT_NUMBER
        if bitArray(i) == 0
            offset = 0.5;
        else
            offset = 0;
        end
        amplitudeDist = sigmaU*randn();
        sigmaDist = sigmaOmega*randn();
        x(i)=(amplitudeDist+amplitude)*cos(2*pi*(offset + sigmaDist));
        y(i)=(amplitudeDist+amplitude)*sin(2*pi*(offset + sigmaDist));
        for j = 1:numberOfSamplesInSymbol
           % deltaU(((i-1)*numberOfSamplesInSymbol)+j)
            carrierWawe(((i-1)*numberOfSamplesInSymbol)+j) = (amplitudeDist+amplitude)*cos(2*pi*WAWE_FREQUENCY*timeAxis(((i-1)*numberOfSamplesInSymbol)+j) + 2*pi*(offset+sigmaDist));
        end
    end
end

