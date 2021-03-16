function [matrixOutput] = two_rows(matrixInput)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
B = size(matrixInput);
C = length(B);
if B(1)==2 && C==2
    matrixOutput = matrixInput;
else
    disp('Массив должен быть двумерным и иметь две строки');
    matrixOutput = matrixInput*0;
end

