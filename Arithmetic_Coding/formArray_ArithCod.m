function arr = formArray_ArithCod(probs,down,up)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
arr=[];
for i=1:length(probs)+1
    range=up-down;
    if i==1
        sym_start =vpa(down);
    end
    if i>1
        sym_start=vpa(arr(end)+probs(i-1)*range);
    end

    if i==length(probs)+1 %just to store the up boundary..
        sym_start = vpa(up);
    end
    arr=[arr sym_start];
end
end