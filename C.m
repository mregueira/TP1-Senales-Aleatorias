function [ y ] = C( A,ta,tb )

y = mean(A(ta,:).*A(tb,:)) - mean(A(ta,:)).*mean(A(tb,:));

end

