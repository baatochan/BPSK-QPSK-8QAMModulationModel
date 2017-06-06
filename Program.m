clear;

%% Settings //required for every next part

BIT_NUMBER = 1000; %ilosc bitow do wygenerowania
WAWE_FREQUENCY = 1000; %[Hz] czestotliwosc fali nosnej
sigmaU=0.005; %odchylenie standardowe U
sigmaOmega=0.001; %odchylenie standardowe Omegi

%% Generting Random Signal (bit sequence) //required for every next part

bitArray = RandomBitsGenerator(BIT_NUMBER);

%% Modulation //uncomment function below if you want to use it

%Modulate(WAWE_FREQUENCY, BIT_NUMBER, bitArray);

%% Transmission through channels //uncomment function below if you want to use it

%TransmitSignal (WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);

%% Generate 3D plot which shows how BER is changing depending on sigmaU and sigmaOmega //uncomment function below if you want to use it

% Settings
RESOLUTION = 20;
maxSigmaU=0.5;      %max wartosc odchylen standarowych
maxSigmaOmega=0.5; %max wartosc 

% Generating

%Generate3DPlotOfBER ( BIT_NUMBER, WAWE_FREQUENCY, RESOLUTION, maxSigmaU, maxSigmaOmega);

%% Transmission through 8-QAM Channel

TransmitSignalUsingQAM (WAWE_FREQUENCY, BIT_NUMBER, bitArray, sigmaU, sigmaOmega);
