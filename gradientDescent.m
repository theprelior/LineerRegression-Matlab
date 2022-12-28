function [thetas,costs] = gradientDescent(repeat,lrate,thetas,xo,y,m)
    costs = zeros(repeat,1);
    for r = 1:repeat
        hc=xo*thetas - y;
        tempintercept=sum(hc.*xo);
        thetas = thetas - (lrate * (1/m)) * tempintercept';
        costs(r)=cost(thetas,xo,y);
    end
end