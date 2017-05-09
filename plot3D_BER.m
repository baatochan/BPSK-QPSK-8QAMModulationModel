clear;
Size=20;    %%%%%%%%%%%%%%%%%%%%%%%%% "Rozdzielczoœæ wykresu"
BER_PSK_VALUE = zeros(Size, Size);
BER_QPSK_VALUE = zeros(Size, Size);
BIT_NUMBER = 5000; %ilosc bitow do wygenerowania
WAWE_FREQUENCY = 1000; %[Hz] czestotliwosc fali nosnej

maxSigmaU=1.5;      %max wartosc odchylen standarowych
maxSigmaOmega=0.3;
for i=1:Size
    for j=1:Size
        sigmaU=i/Size*(maxSigmaU);                            %odchylenie standardowe U
        sigmaOmega=j/Size*(maxSigmaOmega);                        %odchylenie standardowe Omegi

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

ArraySigmaU= 1/Size*(maxSigmaU):1/Size*(maxSigmaU):maxSigmaU;
ArraySigmaOmega= 1/Size*(maxSigmaOmega):1/Size*(maxSigmaOmega):maxSigmaOmega;

surf(ArraySigmaOmega,ArraySigmaU,BER_PSK_VALUE)
figure(2);
surf(ArraySigmaOmega,ArraySigmaU,BER_QPSK_VALUE)

