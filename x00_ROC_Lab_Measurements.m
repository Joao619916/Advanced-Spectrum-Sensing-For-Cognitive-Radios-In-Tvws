clear all;
close all;
clc;

%% Code for system performance evaluation using software-defined radio
%% Update date: 05/05/2026
%% Authors: João Victor Fernandes Borges and André Antônio dos Anjos
%% Version used for measurement evaluation and theoretical validations

%% USRP configured parameters
% Initial channel center frequency in Hz
CenterFrequency = 473.142857e6;
% Channel center frequency offset in Hz
LocalOscillatorOffset = 0;
% USRP base clock
MasterClockRate = 100e6;
% Captured data type 
TransportDataType = 'int8';
% Decimation/interpolation factor
DecimationRxInterpolationTxFactor = 16;
% Number of samples per burst
SamplesPerFrame  = 2^15;
% Enable burst mode
EnableBurstMode  = 1;
% Number of bursts
NumFramesInBurst = 1;
% Initial gain
Gain = 0;

% Derived parameters
SampleRate = MasterClockRate/DecimationRxInterpolationTxFactor;
FrameDuration = SamplesPerFrame/SampleRate;

%% Creating object to receive data via USRP N210
rx = comm.SDRuReceiver('Platform','N200/N210/USRP2', ...
                'IPAddress', '192.168.10.3', ...
                'CenterFrequency',CenterFrequency, ...
                'LocalOscillatorOffset',LocalOscillatorOffset, ...
                'Gain', Gain,...
               'MasterClockRate',MasterClockRate, ...
               'DecimationFactor',DecimationRxInterpolationTxFactor, ...
               'TransportDataType',TransportDataType, ...
               'SamplesPerFrame',SamplesPerFrame, ...
               'EnableBurstMode',EnableBurstMode, ...
               'NumFramesInBurst',NumFramesInBurst, ...
               'OutputDataType','single');
               
% Creates spectrum analyzer object, in case it is necessary to visualize the spectrum          
specAn = dsp.SpectrumAnalyzer('SampleRate',SampleRate,'SpectralAverages',20);

%% Parameters for sensing evaluation
% RF channel to be evaluated 14 to 51
Channel = 37;
% Reception AGC gain 30 dB standard 
Gain = 30;
% Samples captured by the CR
Nsamples = 100;
% Signal-to-noise ratio considered for the curve evaluation
SNRdB = -5;
% Monte Carlo events for simulation
Eventos = 1500;
% Points between minimum and maximum thresholds
Npontos = 100;

% Initializes variables that will store T
T_ED_H0 = zeros(1,Eventos);
T_ED_H1 = zeros(1,Eventos);
T_ED_H0_full = zeros(1,Eventos);

%% Start of performance evaluation under Hypothesis H_0 (Tx off)
display('Calculating ROC curve');
uiwait(msgbox('Turn off the Transmitter','Warning','warn','modal'));

% Sets configured gain for performance evaluation
rx.Gain = Gain;

% Sets channel frequency
rx.CenterFrequency = 473.142857e6+(Channel-14)*6e6; 

for i=1:Eventos
    % Captures samples
    [data, ~, overrun]  = step(rx);  
    
    % Calculates decision variable T_ED with N_samples under hypothesis H0
    T_ED_H0(i) = sum(abs(data(1:Nsamples)).^2);
    
    % Calculates energy variable with all samples captured in the burst (More stable variance)
    T_ED_H0_full(i) = sum(abs(data).^2);
    pause(0.01)   
i
end

% Plots histogram of the decision variable T|H_0
figure(1); 
hist(T_ED_H0,linspace(min(T_ED_H0),max(T_ED_H0),100))

% Calculates the mean variance of the noise
Mean_power_of_noise = mean(T_ED_H0_full)/2^15

% Target signal-to-noise ratio in simulation
SNR_target = SNRdB;
SNR = 1000;

uiwait(msgbox('Turn on the transmitter and adjust to the configured SNR','Warning','warn','modal'));

while (abs(SNR - SNR_target) > 0.05)
    % Just captures samples and monitors SNR to see if it is within the target
    [data, ~, ~]  = step(rx);
    pause(0.01)
    SNR = 10*log10((sum(abs(data).^2)/32768)/Mean_power_of_noise-1);
    fprintf('Target SNR:%f dB // Current SNR:%f dB\n',SNR_target, SNR)
end

fprintf('Reception system with SNR = %f',SNR);

%% Start of performance evaluation under Hypothesis H_1 (Tx on)
for i=1:Eventos
    % Captures samples
    [data, ~, overrun]  = step(rx);
    
    % Calculates decision variable 
    pause(0.01)
    T_ED_H1(i) = sum(abs(data(1:Nsamples)).^2);
    
    % Calculates instantaneous SNR
    SNR = 10*log10((sum(abs(data).^2)/32768)/Mean_power_of_noise-1);
    fprintf('Current SNR:%f dB\n', SNR)
    rxOut = complex(data);
    
    % To see spectrum, just uncomment the line below
    %specAn(rxOut)
i
end

% Plots histogram of T_ED|H_1
figure(2); hist(T_ED_H1,linspace(min(T_ED_H1),max(T_ED_H1),100))

% Threshold definition for ROC curve evaluation
limiar = linspace((min(T_ED_H0)),(max(T_ED_H1)),Npontos);

%% Calculating detection and false alarm probabilities for a given SNR
Pfa = zeros(1,length(limiar));
Pd = zeros(1,length(limiar));

for i = 1 : length(limiar)
    Pfa(i) = sum(T_ED_H0>limiar(i))/length(T_ED_H0);
    Pd(i) = sum(T_ED_H1>limiar(i))/length(T_ED_H1);       
end

%% Plots performance graph
figure(3)
hold on;
plot(Pfa,Pd,'--ro','linewidth',2);%
xlabel('P_{FA}');
ylabel('P_{D}');
%legend('SNR = -10dB');
hold on;
grid on;
axis([0 1 0 1]);

% Shows SNR
SNRonSimulation = 10*log10(mean(T_ED_H1)/mean(T_ED_H0)-1)

% Stores vector for ROCs
Vec_ROC_pd_pfa = [Pfa' Pd'];

 %% Generating final histograms
[amp_H0 x_axes_H0]=hist(T_ED_H0,linspace(min(T_ED_H0),max(T_ED_H1),100));
[amp_H1 x_axes_H1]=hist(T_ED_H1,linspace(min(T_ED_H0),max(T_ED_H1),100));

figure(5)
bar(x_axes_H0,amp_H0,'b');
hold on;
bar(x_axes_H1,amp_H1,'r');
xlabel('Variable T');
ylabel('PDF');
legend('Histogram H0', 'Histogram H1');

%% Saving files
Pd_Pfa_Limiar =[Pd', Pfa',limiar'];
Histograma = [x_axes_H0' amp_H0' x_axes_H1' amp_H1']
scenario = strcat('Gain_',num2str(Gain),'_Nsamples_',num2str(Nsamples),'_SNR_db_',num2str(SNRdB),'_Eventos_',num2str(Eventos),'SNRonSimulation',num2str(SNRonSimulation))

dlmwrite(strcat(scenario,'_Pd_Pfa_Limiar.dat'),Pd_Pfa_Limiar,'delimiter',' ')
dlmwrite(strcat(scenario,'_Histograma.dat'),Histograma,'delimiter',' ')

%% Simulations for comparison with practice
%% Spectral sensing simulation Energy detection with simulation/theory validation

% Validated theoretical expressions of Pd and Pfa through generation of sim and theo ROCs
% Number of collected samples
N = Nsamples;
% Mean SNR in dB
SNRdB = SNRdB; % Implemented
% Standard deviation of Noise
sig_w = 1;
% "Standard deviation" of Signal sig_s.^2 = signal power
sig_s = 0; % Implemented indirectly by the SNR
% Number of Monte Carlo events
Me =100000;
% Number of ROC points
Npts = Npontos;
% 0- AWGN, 1 Rayleigh
Channel = 0;
% Conversion from SNRdB to linear
SNR =10.^(SNRdB/10);

%% Monte Carlo loop
for i = 1:Me
   if i<=Me/2
        n = sig_w*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        y = n;
        T_H0(i) = sum(abs(y).^2);
   else
        % AWGN noise with standard deviation with unit standard deviation
        n = sig_w*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        
        % Transmission signal with the configured power
        x = sqrt(SNR)*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        
        % Random complex gain of the unit power Rayleigh channel
        if Channel == 1
            h = 1/sqrt(2)*(randn(1,1) +1i*randn(1,1));
        else
            h = 1;
        end
        
        % Received signal
        y = h*x+n;
        T_H1(i-Me/2) = sum(abs(y).^2);
   end 
     
end

%% ROC Generation
limiar = linspace(min(T_H0), max(T_H1),Npts);

% Calculating detection and false alarm probabilities for a given SNR
Pfa = zeros(1,length(limiar));
Pd = zeros(1,length(limiar));

for i = 1 : length(limiar)
    Pfa(i) = sum(T_H0>limiar(i))/length(T_H0);
    Pd(i) = sum(T_H1>limiar(i))/length(T_H1);
end

% Stores simulated AWGN vector
Vec_ROC_pd_pfa = [Vec_ROC_pd_pfa Pfa' Pd'];
SNRonSimulation = 10*log10(mean(T_H1)/mean(T_H0)-1)

% Plots simulated ROC
figure(3);
hold on;
plot(Pfa,Pd,'gs','linewidth',2);

Pfa_teo = qfunc((limiar - N)/sqrt(N));

if Channel == 0
    Pd_teo = qfunc((limiar - N*(SNR + 1))/sqrt(N*(SNR + 1).^2));
    plot(Pfa_teo,Pd_teo,'--g','linewidth',2)
else
    % Using fr_Rayleigh IT WORKED % When you want the theoretical one just do it like this for the others
    p00 = 1;
    fr_Rayleigh = @(p,r) 1/p(1)*2*(r/p(1)) .*exp(-(r/p(1)).^2);
    dr = 0.001;
    r = 0:dr:10;
    Unit_energy = sum(fr_Rayleigh(p00,r))*dr
    Thre = limiar;
    for i = 1: length(Thre)
        f = @(r) fr_Rayleigh(p00,r).*qfunc((Thre(i) - N*(r.^2*SNR + 1))./sqrt(N*(r.^2*SNR + 1).^2));
        Pd_teo(i) = integral(f,0,inf);
        % Unit_area(i)=sum(1/snrlin(i)*exp(-snr_inst/snrlin(i))*deltasnr)
    end    
    plot(Pfa_teo,Pd_teo,'b','linewidth',2)
end

Vec_ROC_pd_pfa = [Vec_ROC_pd_pfa Pfa_teo' Pd_teo'];

% 0- AWGN, 1 Rayleigh
Channel = 1;
% Conversion from SNRdB to linear
SNR =10.^(SNRdB/10);

%% Monte Carlo loop
for i = 1:Me
   if i<=Me/2
        n = sig_w*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        y = n;
        T_H0(i) = sum(abs(y).^2);
   else
        % AWGN noise with standard deviation with unit standard deviation
        n = sig_w*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        
        % Transmission signal with the configured power
        x = sqrt(SNR)*1/sqrt(2)*(randn(1,N) +1i*randn(1,N));
        
        % Random complex gain of the unit power Rayleigh channel
        if Channel == 1
            h = 1/sqrt(2)*(randn(1,1) +1i*randn(1,1));
        else
            h = 1;
        end
        
        % Received signal
        y = h*x+n;
        T_H1(i-Me/2) = sum(abs(y).^2);
   end 
     
end

%% ROC Generation
limiar = linspace(min(T_H0), max(T_H1),Npts);

% Calculating detection and false alarm probabilities for a given SNR
Pfa = zeros(1,length(limiar));
Pd = zeros(1,length(limiar));

for i = 1 : length(limiar)
    Pfa(i) = sum(T_H0>limiar(i))/length(T_H0);
    Pd(i) = sum(T_H1>limiar(i))/length(T_H1);
end

Vec_ROC_pd_pfa = [Vec_ROC_pd_pfa Pfa' Pd'];
SNRonSimulation = 10*log10(mean(T_H1)/mean(T_H0)-1)

% Plots simulated ROC
figure(3);
hold on;
plot(Pfa,Pd,'bd','linewidth',2)

Pfa_teo = qfunc((limiar - N)/sqrt(N));

if Channel == 0
    Pd_teo = qfunc((limiar - N*(SNR + 1))/sqrt(N*(SNR + 1).^2));
    plot(Pfa_teo,Pd_teo,'k')
else
    % Using fr_Rayleigh IT WORKED % When you want the theoretical one just do it like this for the others
    p00 = 1;
    fr_Rayleigh = @(p,r) 1/p(1)*2*(r/p(1)) .*exp(-(r/p(1)).^2);
    dr = 0.001;
    r = 0:dr:10;
    Unit_energy = sum(fr_Rayleigh(p00,r))*dr
    Thre = limiar;
    for i = 1: length(Thre)
        f = @(r) fr_Rayleigh(p00,r).*qfunc((Thre(i) - N*(r.^2*SNR + 1))./sqrt(N*(r.^2*SNR + 1).^2));
        Pd_teo(i) = integral(f,0,inf);
        % Unit_area(i)=sum(1/snrlin(i)*exp(-snr_inst/snrlin(i))*deltasnr)
    end    
    plot(Pfa_teo,Pd_teo,'--b','linewidth',2) 
end

legend('SDR Measurement','AWGN Simulated','AWGN Theoretical','Rayleigh Simulated', 'Rayleigh Theoretical')

%% Saving curves to file
Vec_ROC_pd_pfa = [Vec_ROC_pd_pfa Pfa_teo' Pd_teo'];

% Saves .dats and final figure
dlmwrite(strcat(scenario,'_ROC_Medida_Sim_Teo.dat'),Vec_ROC_pd_pfa,'delimiter',' ')
savefig(strcat(scenario,'_Grafico.fig'))