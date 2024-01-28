function [codes_arr,Lavg_ofArr] = Shannon_Fano_Code_arrays(symobls_arr,probs_arr);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Sorting probs and symbols desc...
sorted_probs= sort(probs_arr,'descend');
sorted_symbols=symbols_arr(sorted_probs);

% Algorithm:
rem_sorted_probs=sorted_probs;
important_counter=0;
% for i=1:length(sorted_probs)
%     start=1;
%     important_counter=important_counter+1;
%     if(sum(rem_sorted_probs(start:i))< 0.5*sum(rem_sorted_probs))
%         continue;
%     end
% %     now, we have here the 1st element after (or at) 50%
% %     check it's nearest or the previous one...
%     this_diff=(abs(0.5*sum(rem_sorted_probs))-sum(rem_sorted_probs(start:i)));
%     prev_diff=(abs(0.5*sum(rem_sorted_probs))-sum(rem_sorted_probs(start:i-1)));
%     this_or_prev=0;
%     if min(this_diff,prev_diff)==this_diff
%         this_or_prev=i
%     else
%         this_or_prev=i-1;
%     end
%     arr_1=rem_sorted_probs(start:this_or_prev);
%     arr_2=rem_sorted_probs(this_or_prev:end);


codes_arr=zeros(length(symobls_arr)); 

for i=1:length(sorted_probs)
     if(sum(sorted_probs(start:i))< 0.5*sum(sorted_probs))
         continue;
     end
    this_diff=(abs(0.5*sum(sorted_probs))-sum(sorted_probs(start:i)));
    prev_diff=(abs(0.5*sum(sorted_probs))-sum(sorted_probs(start:i-1)));
    if min(this_diff,prev_diff)==this_diff
        this_or_prev=i;
    else
        this_or_prev=i-1;
    end
    arr_1=sorted_probs(start:this_or_prev);
    arr_2=sorted_probs(this_or_prev:end);

    codes_arr(start:i)=string(zeros(1,i-start+1));
    codes_arr(i+1:end)=string(zeros(1,length(codes_arr)-i+1));

end


[a1,a2,is_len1_1,is_len2_1]=split_probs_array_50_50(sorted_probs);
% we will now store codes in the SORTED order...
codes_arr=[codes_arr string(zeros(1,length(a1)))];
codes_arr=[codes_arr string(zeros(1,length(a2)))];

% now split do it recursively for arr1 and arr2
a_counter=0;
while(~is_len1_1)
    a_counter=a_counter+1;
    if a_counter==1
        some_arr=split_probs_array_50_50(a1);
    end
%   split the left one:
    some_arr=split_probs_array_50_50(some_arr(1));
    is_len1_1=some_arr(3);
    
end



end