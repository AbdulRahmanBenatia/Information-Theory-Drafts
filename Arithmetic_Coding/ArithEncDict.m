function src_code = ArithEncDict(syms_probs_dict,desired_seq)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Inputs: 
%       -syms_probs_dict: A dictionary with keys = symbols, 
%                                           values =their probabilities
%       - desired_seq: the sequence to encode
symbols=keys(syms_probs_dict);
probs=values(syms_probs_dict);
src_code = ArithmeticCoding(symbols,probs,desired_seq);
end