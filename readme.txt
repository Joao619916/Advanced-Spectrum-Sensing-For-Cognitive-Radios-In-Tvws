SPECTRUM SENSING AND MONITORING USING SDR

AUTHORS
- João Victor Fernandes Borges (Undergraduate Student in Electronic and Telecommunications Engineering, UFU)
- Prof. Dr. André Antônio dos Anjos

CODE DESCRIPTIONS

This repository contains MATLAB scripts developed to perform practical spectrum sensing, energy detection, and performance evaluation using Software-Defined Radios (SDR). Below is the detailed explanation of each script:

1. Spectral_Monitoring_UFU_Patos.m
This is the main Graphical User Interface (GUI) script, built using MATLAB GUIDE. It controls the real-time monitoring of UHF channels. 
- Functionality: It connects to the SDR (USRP N210/B210) and runs a continuous loop scanning a specified range of UHF channels. 
- Processing: For each channel, it calculates the energy of the received signal and compares it against a user-defined threshold to determine channel occupation. 
- Output: It updates two real-time bar graphs in the interface: one showing the binary channel occupation (Occupied/Free) and another displaying the raw energy level of each channel. (Note: This script requires its associated .fig file to run properly).

2. x00_ROC_Lab_Measurements.m
This is the core script for system performance evaluation and theoretical validation of the energy detector.
- Functionality: It conducts comprehensive Monte Carlo events to gather empirical data under two main hypotheses: H0 (Transmitter OFF - noise only) and H1 (Transmitter ON - signal + noise). 
- Processing: It calculates the decision variables (T_ED) for both scenarios and uses them to compute the empirical Probability of Detection (P_D) and Probability of False Alarm (P_FA). It then runs theoretical simulations for AWGN and Rayleigh fading channels to validate the practical SDR measurements.
- Output: It plots the comparative ROC (Receiver Operating Characteristic) curves, generates histograms for the decision variables, and automatically exports the results into .dat files for further plotting and analysis.

3. fcn_calc_range_limiar.m
This function is designed to calculate a specific range of thresholds and evaluate the system's detection probabilities.
- Functionality: It monitors a specific predefined RF channel over a set number of Monte Carlo events.
- Processing: It prompts the user to manually turn the transmitter OFF (H0) and ON (H1) while monitoring the Signal-to-Noise Ratio (SNR) to ensure it hits the target level. It establishes the maximum and minimum boundaries of the received energy.
- Output: It generates an array of linearly spaced thresholds between the H0 minimum and H1 maximum, calculates P_D and P_FA for each threshold, and plots the resulting basic ROC curve.

4. usrp_n210_receiver_data.m
This script focuses on the reception of OFDM signals and spectrum visualization.
- Functionality: It configures the USRP receiver object and a Spectrum Analyzer object.
- Processing: It loops through a defined number of events, sweeping between a minimum and maximum channel. During the loop, it captures raw IQ data, feeds it to the spectrum analyzer for real-time visualization, and calculates the normalized energy decision variable (T_ED).
- Output: It returns arrays containing the decision variables for the overall events, as well as split arrays for H0 and H1 states, plotting their respective histograms at the end.