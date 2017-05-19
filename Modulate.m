function Modulate (WAWE_FREQUENCY, BIT_NUMBER, bitArray)
%% BPSK Modulation

[carrierWawe2, timeAxis2] = BPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);

%% QPSK Modulation

[carrierWawe, timeAxis] = QPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);

%% Show plot

figure(1)
subplot(2,1,1);
plot (timeAxis,carrierWawe,'b')
xlabel ('czas[s]');
ylabel ('sygnal');
subplot(2,1,2);
plot (timeAxis2,carrierWawe2,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

end
