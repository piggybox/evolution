# Markowitz Portfolio Optimization Model:
# Seperation-based optimal portfolio
#
# Aurthor: Sky(Hao) Yin
# Reference: AMPL examples from Robert Vanderbei from Princeton
#            OPIM 913 lecture notes from Wharton
# Last modified: Sep. 1, 2005

set A; # set of equities

set T := {1..22}; # set of periods

param RFR > 0 default 0.05; # risk-free rate

param H{T,A}; # historical data matrix

param AMean{j in A} # arithmetic return
    := (sum{i in T} H[i,j]) / card(T); 

param GMean{j in A} # geometric return
    := (product{i in T} H[i,j])^(1 / card{T});  

param Rtilde{i in T, j in A} # abosolute deviation +/-
    := H[i,j] - AMean[j];

#param ROR{j in A} # ROR for each asset, 
#    :=(H[e,j] - H[b,j]) / H[b,j];

var x{A} >=0; # weight for the given asset

#var mu >=0; 

#-------------------
#param Cov{j in A, k in A} # Covariance matrix
#    := sum {i in T} (Rtilde[i,j] * Rtilde[i,k]) / card(T);

#param Corr{j in A, k in A} # Correlation matrix
#    := Cov[j,k] / sqrt(Cov[j,j] * Cov[k,k]);

#var weighted_sd{j in A, k in A} # Weighted SD matrix
#    := x[j] * x[k] * Cov[j,k]; # error here, dunno why...
#--------------------

#maximize linear_compromise: # linear compromise between return and risk
#	sum{j in A} mean[j] * x[j]
#	- mu * 
#	(sum{i in T} (sum{j in A} Rtilde[i,j] * x[j])^2 / card(T));

maximize Sortino_ratio: # Sortino ratio based optimal portfolio
    ((sum{j in A} GMean[j] * x[j]) # portfolio geometric return
     - (RFR + 1))  / # - risk-free rate
    (sqrt(sum{i in T} (sum{j in A: Rtilde[i,j] <0 } # / downside SD
    Rtilde[i,j] * x[j])^2 / card{T})); 	

subject to Sum_weights: # sum of weights = 1
    sum{j in A} x[j] = 1; # 100% investment 

subject to weight_ceiling:
	x{A} < .15;

#subject to RFR_constraint: # weighted ROR > RFR
#    sum{j in A} x[j] * ROR[j] >= (RFR/100);

#subject to SD_constratint: # SD <= ROR # doesnt' work, dunno why...
#    (sqrt(sum{i in T} (sum{j in A} Rtilde[i,j] * x[j])^2 / card(T)) 
#	/ (sum{j in A} mean[j] * x[j])) <= ((sum{j in A} ROR[j] * x[j]) 
#    + (((1 + RFR / 100)^card{T} - 1) * (1 - sum{j in A} x[j])));	

#-----------------------------------------------------------

data;

set A := 1 2 3 4 5 6 7 8 ;   

param H: 1 2 3 4 5 6 7 8 :=
1  1.075  0.942  0.852  0.815  0.698  1.023  0.851  1.677 
2  1.084  1.020  0.735  0.716  0.662  1.002  0.768  1.722 
3  1.061  1.056  1.371  1.385  1.318  1.123  1.354  0.760 
4  1.052  1.175  1.236  1.266  1.280  1.156  1.025  0.960 
5  1.055  1.002  0.926  0.974  1.093  1.030  1.181  1.200 
6  1.077  0.982  1.064  1.093  1.146  1.012  1.326  1.295 
7  1.109  0.978  1.184  1.256  1.307  1.023  1.048  2.212 
8  1.127  0.947  1.323  1.337  1.367  1.031  1.226  1.296 
9  1.156  1.003  0.949  0.963  0.990  1.073  0.977  0.688 
10  1.117  1.465  1.215  1.187  1.213  1.311  0.981  1.084 
11  1.092  0.985  1.224  1.235  1.217  1.080  1.237  0.872 
12  1.103  1.159  1.061  1.030  0.903  1.150  1.074  0.825 
13  1.080  1.366  1.316  1.326  1.333  1.213  1.562  1.006 
14  1.063  1.309  1.186  1.161  1.086  1.156  1.694  1.216 
15  1.061  0.925  1.052  1.023  0.959  1.023  1.246  1.244 
16  1.071  1.086  1.165  1.179  1.165  1.076  1.283  0.861 
17  1.087  1.212  1.316  1.292  1.204  1.142  1.105  0.977 
18  1.080  1.054  0.968  0.938  0.830  1.083  0.766  0.922 
19  1.057  1.193  1.304  1.342  1.594  1.161  1.121  0.958 
20  1.036  1.079  1.076  1.090  1.174  1.076  0.878  0.926 
21  1.031  1.217  1.100  1.113  1.162  1.110  1.326  1.146 
22  1.045  0.889  1.012  0.999  0.968  0.965  1.078  0.990 
;

#-----------------------------------------------------------
#repeat {
solve;

printf: "-------------------------------------------------------------------\n";
printf: "        Asset     Return%		 CGR%		Downside SD%";
printf: "\n";
printf {j in A}: "%10s \t   %10.7f \t\t %10.7f \t %10.7f \n", 
    j, AMean[j] * 100 - 100, GMean[j] * 100 -100, 
    100 * sqrt(sum{i in T: Rtilde[i,j] <0 } Rtilde[i,j]^2 / card{T});

printf: "\n"; # non-zero weights
printf: "-------------------------------------------------------------------\n";

printf: "Optimal Portfolio:                 Asset   Weight %";
printf: "\n";
printf {j in A: x[j] > 0.001}: "%40s   %5.7f \n", j, x[j] * 100;
#printf: "%40s   %5.7f \n", "Cash", 100 * (1 - sum{j in A} x[j]);
printf: "-------------------------------------------------------------------\n";

printf: "\nReturn = %5.5f%, CGR = %5.5f%, Downside SD = %7.5f% , RFR = %5.5f%",
    100 * sum{j in A} AMean[j]*x[j] - 100, # mean of portfolio rate of return
    100 * sum{j in A} GMean[j]*x[j] - 100,
    #100 * ((sum{j in A} ROR[j] * x[j])
    #+ (((1 + RFR / 100)^card{T} - 1) * (1 - sum{j in A} x[j]))),
    100 * sqrt(sum{i in T} (sum{j in A: Rtilde[i,j] <0 } 
	Rtilde[i,j] * x[j])^2 / card{T}) , # portfolio SD
    RFR * 100; # risk-free rate	
printf: "\n";
printf: "-------------------------------------------------------------------\n";
#} until 
# End of model
