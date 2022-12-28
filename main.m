clear; clc;
%load dataset

ds = load('ex1data1.txt');

%split x/y



x = ds(:,1); % Examples
y = ds(:,2);
n=1;
m=length(y);
format long;
b1 = x\y;  %intercept
    
    %plot lineer regression 
    % Top plot
yCalc1 = b1*x;
ax1 = nexttile;
scatter(ax1,x,y,'o');
hold on
plot(ax1,x,yCalc1);
title(ax1,'Linear Regression Relation Between Profit & Truck')
ax1.FontSize = 14;
ax1.XColor = 'red';
ylabel('profit of a food truck');
xlabel('population of a city');
grid on



%normalise
[x,maxs,mins]=normalize(x);


%add column with ones - help hyphothesizs
xo=[ones(m,1),x];

%gradient descent
repeat=1500;
lrate=0.01;
thetas=zeros(2,1);
[best,costs] = gradientDescent(repeat,lrate,thetas,xo,y,m);


% plot 𝑱(𝜽) vs iteration


ax2 = nexttile;
scatter(ax2,costs,1:repeat)
title(ax2,' 𝑱(𝜽) vs iteration')
grid(ax2,'on')
ylabel('Iteration');
xlabel('J(𝜽)');


%prediction of a given value


p=[7];
pn=(p-maxs')./(maxs'-mins');
pn = [1;pn];
r=(pn')*(best);


