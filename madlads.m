clear
clc
load('D6ClimateData.mat')

%Constants
KT_TO_KG = 1000000;
M_TO_USD = 1000000;

%Calculations
n = 0;
index = 1;
xSet = [];
ySet = [];
year = input("Enter year: ");
while n ~= 7628
    if YEAR(index) == year
        x = GDP(index) * M_TO_USD / POPULATION(index);
        y = CARBON_DIOXIDE(index) * KT_TO_KG / POPULATION(index);
        xSet = [xSet; x];
        ySet = [ySet; y];
    end
    n = n + 1;
    index = index + 1;
end

%Graph
loglog(xSet, ySet, '*');
title("Scatter Plot of GDP's relationship to CO2");
xlabel("GDP per capita (USD/person)");
ylabel("CO2 emission per capita (kg emission/person)");

logx = log(xSet);
logy = log(ySet);
Const = polyfit(logx, logy, 1);
hold on;
    plot(xSet, exp(polyval(Const, logx)));
hold off;