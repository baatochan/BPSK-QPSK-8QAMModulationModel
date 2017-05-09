clear;

%zmienne manipuluj?ce program
BIT_NUMBER = 1000; %ilosc bitow do wygenerowania
WAWE_FREQUENCY = 1000; %[Hz] czestotliwosc fali nosnej
sigmaU=0.1;                            %odchylenie standardowe U
sigmaOmega=0.1;                        %odchylenie standardowe Omegi

bitArray = RandomBitsGenerator(BIT_NUMBER)

[carrierWawe3, timeAxis3, numberOfSamplesInSymbol3, x3, y3] = ChannelQPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);
[carrierWawe4, timeAxis4, numberOfSamplesInSymbol4, x4, y4] = ChannelPSK(WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);


for i=1:BIT_NUMBER
    if bitArray(i) == 0
        colorPSK(i)=1;
    end
    if bitArray(i) == 1
        colorPSK(i)=2;
    end
end

for i = 1:(BIT_NUMBER/2)
        if bitArray(2*i) == 0
                if bitArray((2*i)-1) == 0
                    colorQPSK(i) = 1;
                end 
                if bitArray((2*i)-1) == 1
                    colorQPSK(i) = 2;
                end
        end
        if bitArray(2*i) == 1
                if bitArray((2*i)-1) == 0
                    colorQPSK(i) = 3;
                end 
                if bitArray((2*i)-1) == 1
                    colorQPSK(i) = 4;
                end
        end
end


figure(3)
scatter(x3,y3,[],colorQPSK,'filled');
axis([-1 1 -1 1]);
figure(4)
scatter(x4,y4,[],colorPSK,'filled');
axis([-1 1 -1 1]);