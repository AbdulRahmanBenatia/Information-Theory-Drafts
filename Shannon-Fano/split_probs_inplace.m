function [array_out,n_s] = split_probs_inplace(array,array_of_ns)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Inputs:
%       - array: the one to be splitted;
%       - array_of_ns: how many elemnts in each in order NOt 7 nor bin...
%       (i.e. elements before first 7 or before the code of the row)
% array=sort(array,2,'descend'); %to sort each row
left_code=0;
right_code=0;
n_s=[];
array_out=[];
num_cols = length(array);
num_rows= height(array)
for j=1:height(array)
    jthrow = array(j,1:array_of_ns(j));
    for i=1:length(jthrow)
        start=1;
        
    %     important_counter=important_counter+1;
        if(sum(jthrow(start:i))< 0.5*sum(jthrow))
            summmm=sum(jthrow(start:i))
            continue;
        end
    %     now, we have here the 1st element after (or at) 50%
    %     check it's nearest or the previous one...
        smth="HERE"
        i
        this_diff=(abs(0.5*sum(jthrow(start:array_of_ns(j))))-sum(jthrow(start:i)));
        prev_diff=(abs(0.5*sum(jthrow(start:array_of_ns(j))))-sum(jthrow(start:i-1)));
        this_or_prev=0;
        if min(this_diff,prev_diff)==this_diff
            this_or_prev=i;
        else
            this_or_prev=i-1;
        end
        this_or_prev
        left=jthrow(start:this_or_prev)
        n_left=length(left);
        right=jthrow(this_or_prev+1:array_of_ns(j))
        n_right=length(right);
        n_s=[n_s n_left n_right]
        if length(left)<length(right)
            left
            left=[left 7*ones(1,length(right)-length(left))];
            
        elseif length(right)<length(left)
            right
            right=[right 7*ones(1,length(left)-length(right))]; %%7 is just 
            % anything different than our possible values <1, to concat,
            % and will be removed later...
        end

        left= [left 7*ones(1,length(array)-length(left))];
        right=[right 7*ones(1,length(array)-length(right))];

        if(j==1)
            array_out=[left];
        else
            array_out=[array_out; [left]];
        end

        array_out=[array_out;[right]];
        break;
    %     split done, and the op is a matrix with 1st row is left, 2nd is
    %     right, last column is the CODE till now, 0left, 1right
    end
end

array_out;

end