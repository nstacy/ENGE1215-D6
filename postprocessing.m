clear
clc
load('D6ClimateData.mat')

%Constants
KT_TO_KG = 1000000;
M_TO_USD = 1000000;

%Calculations
n = 0;
index = 1;
maxGDP = 0;
GDPC = "";
maxCO2 = 0;
CO2C = "";
year = input("Enter year: ");
while n ~= 7627
    if YEAR(index) == year
        if GDP(index) * M_TO_USD / POPULATION(index) > maxGDP
            maxGDP = GDP(index) * M_TO_USD / POPULATION(index);
            GDPC = COUNTRY_TEXT(index);
        end
        if CARBON_DIOXIDE(index) * KT_TO_KG / POPULATION(index) > maxCO2
            maxCO2 = CARBON_DIOXIDE(index) * KT_TO_KG / POPULATION(index);
            CO2C = COUNTRY_TEXT(index);
        end
    end
    n = n + 1;
    index = index + 1;
end

disp("The max GDP per capita came from " + GDPC + " and had: $" + maxGDP);
disp("The max CO2 emission per capita came from " + CO2C + " and had " + maxCO2 + " kilograms");