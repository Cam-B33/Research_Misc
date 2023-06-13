# Research_Misc
Various code I wrote during my role as a molecular ecologist


## Sim_Binary_PCR_Amp.R
Function to simulate the binary amplification of qPCR technical replicates for a given sample when only amplification frequency or sum of amplifications are given. Useful when conducting occupancy modelling for qPCR environmental DNA data as many programs require the amplification status of each individual technical replicate.

## ROC_Detection_Threshold_V1.R
This script establishes a detection threshold using qPCR data from targeted environmental DNA studies, using the Receiver Operating Characteristic (ROC) curve method described in Serrao et al. (2018). The user inputs two .csv files: env_samples.csv, which contains the Cq values from the PCRs for each of the environmental samples, and nc_samples.csv, which contains the Cq values for each of the PCRs from the field and lab negative controls. The script then plots the ROC curve and calculates Youden's J statistic (Youden. 1950) for each threshold.

Serrao, N.R., Reid, S.M. & Wilson, C.C. Establishing detection thresholds for environmental DNA using receiver operator characteristic (ROC) curves. *Conservation Genet Resour* **10**, 555–562 (2018). https://doi.org/10.1007/s12686-017-0817-y

Youden WJ (1950) Index for rating diagnostic tests. Cancer 3:32–35

## extraction_qubit.py
When extracting DNA from a tissue or filter sample, it is common practice to quantify the amount of double-stranded (ds) DNA present by "Qubiting" the final extraction elution. However, this process can be expensive and time-consuming, particularly when dealing with a large number of samples. To reduce the time and cost of using the Qubit, this script allows the user to use it as a qualitative tool to assess the effectiveness of the DNA extraction.
In this case, there are 100 DNA extractions in a batch, but I want to avoid Qubiting every sample due to its cost and time requirements. Instead, I want to determine the number of samples I need to Qubit (r) out of the 100 total samples, such that there is a 99% probability (1-X) that at least 90 (n) of the DNA extractions have useable concentrations of dsDNA. Use may change r, n and X values as necessary. 
