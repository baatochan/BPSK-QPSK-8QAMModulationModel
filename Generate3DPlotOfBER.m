function Generate3DPlotOfBER ( BIT_NUMBER, WAWE_FREQUENCY, RESOLUTION, maxSigmaU, maxSigmaOmega)
%% Prepare Arrays

BER_PSK_VALUE = zeros(RESOLUTION, RESOLUTION);
BER_QPSK_VALUE = zeros(RESOLUTION, RESOLUTION);

%% Generate BER Values

for i=1:RESOLUTION
    for j=1:RESOLUTION
        sigmaU=i/RESOLUTION*(maxSigmaU); %odchylenie standardowe U
        sigmaOmega=j/RESOLUTION*(maxSigmaOmega); %odchylenie standardowe Omegi

        bitArray = RandomBitsGenerator(BIT_NUMBER);
        [carrierWawe3, timeAxis3, numberOfSamplesInSymbol3, x3, y3] = ChannelQPSK( WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);
        [carrierWawe4, timeAxis4, numberOfSamplesInSymbol4, x4, y4] = ChannelPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);

        [ demodulatedBitArrayPSK ] = demodulatorPSK (x4, BIT_NUMBER);
        [ demodulatedBitArrayQPSK ] = demodulatorQPSK (x3, y3, BIT_NUMBER);

        BER_PSK = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArrayPSK);
        BER_QPSK = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArrayQPSK);

        BER_PSK_VALUE(i, j)=BER_PSK;
        BER_QPSK_VALUE(i, j)=BER_QPSK;
    end
end

%% Prepare results

ArraySigmaU= 1/RESOLUTION*(maxSigmaU):1/RESOLUTION*(maxSigmaU):maxSigmaU;
ArraySigmaOmega= 1/RESOLUTION*(maxSigmaOmega):1/RESOLUTION*(maxSigmaOmega):maxSigmaOmega;

%% Show plot for BPSK

figure(5);
surf(ArraySigmaOmega,ArraySigmaU,BER_PSK_VALUE);
title('plot for BPSK');
xlabel ('SigmaOmega');
ylabel ('SigmaU');
zlabel ('BER');

%% Show plot for QPSK

figure(6);
surf(ArraySigmaOmega,ArraySigmaU,BER_QPSK_VALUE);
title('plot for QPSK');
xlabel ('SigmaOmega');
ylabel ('SigmaU');
zlabel ('BER');

end
