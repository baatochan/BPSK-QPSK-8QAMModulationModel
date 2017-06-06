function TransmitSignalUsingQAM (WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega)
%% Modulate and send through channel

[carrierWawe5, timeAxis5, x5, y5] = Channel8QAM(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);

%% Show modulated signal

figure(7)
plot (timeAxis5,carrierWawe5,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

%% Get colors for phasor plot

color8QAM = getColorsForQAM (BIT_NUMBER, bitArray);

%% Show phasor plot

figure(8)
scatter(x5,y5,10,color8QAM, 'filled');
axis([-1 1 -1 1]);

%% Demodulate signal

demodulatedBitArray8QAM = demodulator8QAM (x5, y5, BIT_NUMBER);

%% Print demodulated array

demodulatedBitArray8QAM

%% Calculate BER

BER_8QAM = calculateBER (BIT_NUMBER, bitArray, demodulatedBitArray8QAM);

%% Print BER

BER_8QAM

end