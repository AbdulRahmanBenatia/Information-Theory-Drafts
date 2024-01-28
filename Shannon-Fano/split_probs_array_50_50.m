function [arr_1,arr_2,is_a1_of_len1,is_a2_of_len1] = split_probs_array_50_50(array)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% Outputs::
%           - arr_1: 1st (left) array after splitting
%           - arr_2: 2nd (right) array after splitting
%           - is_a1_of_len1, is_a2_of_len1: true if each is of length=1
array=sort(array,'descend');
for i=1:length(array)
    start=1;
%     important_counter=important_counter+1;
    if(sum(array(start:i))< 0.5*sum(array))
        summmm=sum(array(start:i))
        continue;
    end
%     now, we have here the 1st element after (or at) 50%
%     check it's nearest or the previous one...
    smth="HERE"
    i
    this_diff=(abs(0.5*sum(array))-sum(array(start:i)));
    prev_diff=(abs(0.5*sum(array))-sum(array(start:i-1)));
    this_or_prev=0;
    if min(this_diff,prev_diff)==this_diff
        this_or_prev=i;
    else
        this_or_prev=i-1;
    end


    arr_1=array(start:this_or_prev);
    arr_2=array(this_or_prev+1:end);
    break;
%     split done and APPENDED a bit
end

% if this bool is true, no further splitting is needed...
if(length(arr_1)==1)
    is_a1_of_len1=true;
else
    is_a1_of_len1=false;
end
if(length(arr_2)==1)
    is_a2_of_len1=true;
else
    is_a2_of_len1=false;
end

arr_1
arr_2

end