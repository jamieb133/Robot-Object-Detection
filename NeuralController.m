%
% Simple neural controller
%
% Author: Jamie Brown
%
% Created: 18/02/19
%
% Changes
%               
%
%
%

function [LeftVoltage, RightVoltage] = NeuralController(LeftS, RightS)

    %----------------------------------------------%
    %Set up weights and thresholds
    T1 = 0;
    T2 = 0;
    w1 = -1.4;  %left input to left motor
    w2 = 1.2;   %left input to right motor
    w3 = 1.25;  %right input to left motor
    w4 = -1;    %right input to right motor
    %----------------------------------------------%

    %----------------------------------------------%
    LeftNeuVal = (LeftS*w1) + (RightS*w3);  %calculate left neuron value before biasing
    if (LeftNeuVal > T1)                    %apply threshold bias
        LeftVoltage = 10;
    else
        LeftVoltage = 0;
    end

    RightNeuVal = (LeftS*w2) + (RightS*w4);  % calculate right neuron value before biasing
    if (RightNeuVal > T2)
        RightVoltage = 10;
    else
        RightVoltage = 0;
    end
    %----------------------------------------------%
