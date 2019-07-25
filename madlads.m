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
        loglog(xSet, ySet, '*');
    end
    n = n + 1;
    index = index + 1;
end
xlabel("GDP per capita");
ylabel("CO2 Emission Per Capita");