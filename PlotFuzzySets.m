%
% Plots all fuzzy membership functions
%
% Author: Jamie Brown
% File: run_model.m
%
% Created: 25/02/19
%
% Changes
%               
%
%
%
%----------------------------------------------%

HeadingController = readfis('HeadingsToTurnCmd');
MotorController = readfis('TurnCommand');

HeadingInputs = {'Heading Angle', 'Reference Angle to Waypoint'};
HeadingOutput = 'Heading Command';
MotorInputs = {'Heading Command', 'Radius from Waypoint', 'Wall Angle', 'Distance from Wall', 'Distance from Wall (filtered)'};
MotorOutputs = {'Motor Gain', 'Right Motor Gain', 'Filter Cutoff Frequency'};
graphTitle = ' (Membership Functions)';

fileType = 'svg';

%inputs to heading controller
for i = 1:2
    figure(i);
    plotmf(HeadingController, 'input', i);
    headingInputTitle = strcat(HeadingInputs(i), graphTitle);
    title(headingInputTitle);

    ioNum = string(i);
    fileName = strcat('./report/figures/HeadingControlInput', ioNum);
    saveas(figure(i), fileName, fileType);
end;

%output from heading controller
figure(3);
plotmf(HeadingController, 'output', 1);
headingOutputTitle = strcat(HeadingOutput, graphTitle);
title(headingOutputTitle);
saveas(figure(3), './report/figures/HeadingControlOutput1', fileType);

%inputs to motor controller
for i = 1:5
    figure(i+3);
    plotmf(MotorController, 'input', i);
    motorInputTitle = strcat(MotorInputs(i), graphTitle);
    title(motorInputTitle);

    ioNum = string(i);
    fileName = strcat('./report/figures/MotorControlInput', ioNum);
    saveas(figure(i+3), fileName, fileType);

end;

%outputs from motor controller
for i = 1:3
    figure(i+9);
    plotmf(MotorController, 'output', i);
    motorOutputTitle = strcat(MotorOutputs(i), graphTitle);
    title(motorOutputTitle);

    ioNum = string(i);
    fileName = strcat('./report/figures/MotorControlOutput', ioNum);
    saveas(figure(i+9), fileName, fileType);
end;

 


