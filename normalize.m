function [x,maxs,mins] = normalize (x)
    
    x=(x-max(x))./(max(x)/min(x));
    maxs=max(x);
    mins=min(x);
end