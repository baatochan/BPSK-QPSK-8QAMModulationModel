function TransmitSignal (WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega)
%% Modulate and send through channel

[carrierWawe3, timeAxis3, numberOfSamplesInSymbol3, x3, y3] = ChannelQPSK( WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);
[carrierWawe4, timeAxis4, numberOfSamplesInSymbol4, x4, y4] = ChannelPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);

%% Show modulated signal

figure(2)
subplot(2,1,1);
plot (timeAxis3,carrierWawe3,'b')
xlabel ('czas[s]');
ylabel ('sygnal');
subplot(2,1,2);
plot (timeAxis4,carrierWawe4,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

%% Get colors for phasor plot

[colorPSK, colorQPSK] = getColors (BIT_NUMBER, bitArray);

%% Show phasor plot

figure(3)
scatter(x3,y3,10,colorQPSK,'filled');
axis([-1 1 -1 1]);

figure(4)
scatter(x4,y4,10,colorPSK,'filled');
axis([-1 1 -1 1]);

%% Demodulate signal

demodulatedBitArrayPSK = demodulatorPSK (x4, BIT_NUMBER);
demodulatedBitArrayQPSK = demodulatorQPSK (x3, y3, BIT_NUMBER);

%% Print demodulated array

%demodulatedBitArrayPSK
%demodulatedBitArrayQPSK

%% Calculate BER

BER_PSK = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArrayPSK);
BER_QPSK = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArrayQPSK);

%% Print BER

%BER_PSK
%BER_QPSK

end
