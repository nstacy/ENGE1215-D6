clear
clc
load('D6ClimateData.mat')
n = 0;
index = 1;
KT_TO_KG = 1000000;
M_TO_USD = 1000000;
xSet = [];
ySet = [];
while n ~= 7628
    if YEAR(index) == 2010
        x = GDP(index) * M_TO_USD / POPULATION(index);
        y = CARBON_DIOXIDE(index) * KT_TO_KG / POPULATION(index);
        xSet=[xSet;x];
        ySet=[ySet;y];
        plot(xSet, ySet, '*');
%         disp("$" + x + ", " + y + " kg CO2 emission");
    end
    n = n + 1;
    index = index + 1;
end
xlabel("GDP per capita");
ylabel("CO2 Emission Per Capita");