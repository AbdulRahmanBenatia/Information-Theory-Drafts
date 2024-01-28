function [coedes_SF_dict,L_avg] = Shannon_Fano_Code_dict(symobls_probabilities_dict)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Inputs:
%    - symobls_probabilities_dict: a dictionary of symobls as keys,
%      their probabilities as their values.
% Outputs:
%    - codes_SF: a DICT of the corresponding Shannon-Fano Codes 
%      for each symbol
%    - L_avg: a number that represents the average length of this code

symobls_arr= keys(symobls_probabilities_dict);
probs_arr= valurs(symobls_probabilities_dict);

[codes_arr,Lavg_ofArr] = Shannon_Fano_Code_arrays(symobls_arr,probs_arr);

coedes_SF_dict = dictionary(symbols_arr,codes_arr);
L_avg=Lavg_ofArr;
end