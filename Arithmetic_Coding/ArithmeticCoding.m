function src_code = ArithmeticCoding(symbols,probs,desired_sequence)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% NOTE::: symbols and probs MUST be in the corresponding orders...
% For higher floating precision, vpa() could be used, but it sometimes adds
% extra digits than inputted, ummmm will consider it later...
% Validation:
if length(symbols)~= length(probs)
    disp('Number of symbols DOES NOT EQUAL Number of probabilities! ');
    return;
end
if sum(probs) ~= 1
    the_sum = sum(probs) %This is so stupid that it sometimes show one!!
    disp('Probabilities not Valid! Sum MUST equal 1');
%     return;
end
if the_sum ==1.0000
    disp("IDK why i'm saying so,");
end

down=0;
up=1;
% my_arr=zeros(1,2*length(symbols)); %each symbol has start and end
ranges_arr=[];
% sym_end=1;  %just anything

% for i=1:length(symbols)
%     range=up-down;
%     if i==1
%         sym_end =down+probs(i);
%     end
% 
%     if i>1
%         sym_start=my_arr(end);
%         sym_end= my_arr(end)+ probs(i)*range;
%     end
%     
% 
%     my_arr=[my_arr sym_start sym_end];
% end

% Note that from the previous loop, we get two vals for each symbol, start
% and end, where half the array is redundant, as start(i)=end(i-1)..
% So we can just keep one value per symbol..


ranges_arr=formArray_ArithCod(probs,down,up);

% my_arr;

% Now we have just initialized it...

for i=1:length(desired_sequence)
    this_symbol_ind= find(symbols==desired_sequence(i));
    down=ranges_arr(this_symbol_ind);
    up=ranges_arr(this_symbol_ind+1);
    ranges_arr=formArray_ArithCod(probs,down,up);
end

% Now consider start and end of ranges_arr, which are the range of the seq...
% now choose one of the ranges [0,0.5] or [0.5,1], and keep dividing till 
% the best accuracy we can get where our two values lie in...

range_start=ranges_arr(1);
range_end=ranges_arr(end);
coding_arr=[0,0.5,1];
go_on=1;
src_code=[];
while go_on
    if range_start<=coding_arr(2) && range_end<=coding_arr(2) && range_start>=coding_arr(1) && range_end>=coding_arr(1)
%         extend down range
        src_code=[src_code '0'];
        coding_arr=[coding_arr(1) vpa((coding_arr(1)+coding_arr(2))/2) coding_arr(2)];
    elseif range_start<=coding_arr(end) && range_end<=coding_arr(end) && range_start>=coding_arr(2) && range_end>=coding_arr(2)
        src_code=[src_code '1'];
        coding_arr=[coding_arr(2) vpa((coding_arr(2)+coding_arr(end))/2) coding_arr(end)];
    else
        go_on=0;
    end 

end

% coding_arr;
% range_start;
% range_end;
end