%%MAIN PROGRAM CLASS

clear;

%zmienne manipuluj?ce program
BIT_NUMBER = 4; %ilosc bitow do wygenerowania
WAWE_FREQUENCY = 1000; %[Hz] czestotliwosc fali nosnej
sigmaU=0.01;                            %odchylenie standardowe U
sigmaOmega=0.05;                        %odchylenie standardowe Omegi

bitArray = RandomBitsGenerator(BIT_NUMBER)

[carrierWawe, timeAxis] = QPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);
[carrierWawe2, timeAxis2] = BPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);
[carrierWawe3, timeAxis3] = ChannelQPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);
[carrierWawe4, timeAxis4, numberOfSamplesInSymbol] = ChannelPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);

subplot(2,1,1);
plot (timeAxis,carrierWawe,'b')
xlabel ('czas[s]');
ylabel ('sygnal');
subplot(2,1,2);
plot (timeAxis2,carrierWawe2,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

figure(2)
subplot(2,1,1);
plot (timeAxis3,carrierWawe3,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

subplot(2,1,2);
plot (timeAxis4,carrierWawe4,'b')
xlabel ('czas[s]');
ylabel ('sygnal');

%scatterplot(carrierWawe4,BIT_NUMBER)

scatterplot(carrierWawe3,numberOfSamplesInSymbol,0,'b')