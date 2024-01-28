function corresponding_sequence = reverseArithCod(src_code,num_symbols,symbols,probs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Inputs:
%       - src_code: the code to be decoded             (ARRAY of CHARS)
%       - num_symbols: the number of symbols           (numeric value)
%       - symbols: all symbols                         (Array of Chars)
%       - probs: corresponding probabilities           (Array of nums)

% Output:
%       - corresponding_sequence: the decoded sequence (Array of Chars)

% First let's get the code in  decimal
dec_code=0;
for i=1:length(src_code)
    dec_code= dec_code + vpa((2^(-1*i)) * str2num(src_code(i)));
end
down=0; up=1;
ranges_arr=formArray_ArithCod(probs,down,up);


corresponding_sequence=[];
for i=1:num_symbols  %after this, total range of array is the range of seq
%     Locate the decimal value in array ranges (get its location)...
    logc1 = logical(ranges_arr<= dec_code);
    logc2 = logical(ranges_arr> dec_code);
    lower_ind=find(logc1==1, 1, 'last');
    upper_ind=find(logc2==1, 1, 'first');
    down=ranges_arr(lower_ind);
    up=ranges_arr(upper_ind);
    
    corresponding_sequence=[corresponding_sequence symbols(lower_ind)];
    ranges_arr = formArray_ArithCod(probs,down,up);
end

% dec_code;


end