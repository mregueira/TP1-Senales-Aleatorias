function [ y ] = R( A,ta,tb )

y = mean(A(ta,:).*A(tb,:));

end
