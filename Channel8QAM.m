function [carrierWawe, timeAxis, x, y] = Channel8QAM(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega)

sampleFrequency = 20000; % czestotliwosc probkowania [Hz]
    amplitude = 0.5;          % amplituda, pamietaj zmienic rowniez w demodulatorze; programista plakal jak programowal
    signalLength = (1/WAWE_FREQUENCY)*(BIT_NUMBER/3);
    symbolLength = (1/WAWE_FREQUENCY);
    
    numberOfSamples = signalLength*sampleFrequency;
    numberOfSamplesInSymbol = symbolLength*sampleFrequency;
    timeAxis = 0:1/(sampleFrequency):(numberOfSamples-1)/(sampleFrequency);
    
    carrierWawe = zeros(1, floor(numberOfSamplesInSymbol*(BIT_NUMBER/3)));
    x= zeros(1, floor(BIT_NUMBER/3));
    y= zeros(1, floor(BIT_NUMBER/3));
       
    for i = 1:(BIT_NUMBER/3)
        if bitArray(3*i) == 0
            if bitArray((3*i)-1) == 0
                if bitArray((3*i)-2) == 0
                    amplitudeOffset = 0.5;
                    offset = 0.625;
                end
                if bitArray((3*i)-2) == 1
                    amplitudeOffset = 1;
                    offset = 0.5;
                end
            end 
            if bitArray((3*i)-1) == 1
                if bitArray((3*i)-2) == 0
                    amplitudeOffset = 1;
                    offset = 0.75;
                end
                if bitArray((3*i)-2) == 1
                    amplitudeOffset = 0.5;
                    offset = 0.375;
                end
            end
        end
        if bitArray(3*i) == 1
            if bitArray((3*i)-1) == 0
                if bitArray((3*i)-2) == 0
                    amplitudeOffset = 1;
                    offset = 0;                    
                end
                if bitArray((3*i)-2) == 1
                    amplitudeOffset = 0.5;
                    offset = 0.125;
                end
            end 
            if bitArray((3*i)-1) == 1
                if bitArray((3*i)-2) == 0
                    amplitudeOffset = 0.5;
                    offset = 0.875;
                end
                if bitArray((3*i)-2) == 1
                    amplitudeOffset = 1;
                    offset = 0.25;
                end
            end
        end
        amplitudeDist = sigmaU*randn();
        sigmaDist = sigmaOmega*randn();
        x(i)=(amplitudeDist+(amplitude*amplitudeOffset))*cos(2*pi*(offset + sigmaDist));
        y(i)=(amplitudeDist+(amplitude*amplitudeOffset))*sin(2*pi*(offset + sigmaDist));

        for j = 1:numberOfSamplesInSymbol
            carrierWawe(((i-1)*numberOfSamplesInSymbol)+j) = (amplitudeDist+(amplitude*amplitudeOffset))*cos(2*pi*WAWE_FREQUENCY*timeAxis(((i-1)*numberOfSamplesInSymbol)+j) + 2*pi*(offset + sigmaDist));
        end
    end


end