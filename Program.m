%%MAIN PROGRAM CLASS

clear;

%zmienne manipuluj?ce program
BIT_NUMBER = 10; %ilosc bitow do wygenerowania
WAWE_FREQUENCY = 1000; %[Hz] czestotliwosc fali nosnej


bitArray = RandomBitsGenerator(BIT_NUMBER);

[carrierWawe, timeAxis] = QPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);
[carrierWawe2, timeAxis2] = BPSKModulator(WAWE_FREQUENCY, BIT_NUMBER, bitArray);

subplot(2,1,1);
plot (timeAxis,carrierWawe,'b')
xlabel ('czas[s]');
ylabel ('sygnal');
subplot(2,1,2);
plot (timeAxis2,carrierWawe2,'b')
xlabel ('czas[s]');
ylabel ('sygnal');
