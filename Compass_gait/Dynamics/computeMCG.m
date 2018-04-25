%Computing the M, C and G matrices

%INPUT: State vector
%OUTPUT:
%1. M, C and G Matrices of the Manipulator equations

function [M, C, G] = computeMCG(x)

global params

%Unrolling
q1 = x(1);
q2 = x(2);
q1d = x(3);
q2d = x(4);

%M matrix
M = zeros(2, 2);
M(1, 1) = (params.M + params.m)*params.l^2 + params.m*params.l^2/4;
M(1, 2) = -params.m*(params.l^2/2)*cos(q1 - q2);
M(2, 1) = -params.m*(params.l^2/2)*cos(q1 - q2);
M(2, 2) = params.m*(params.l^2)/4;

%C matrix
C = zeros(2, 2);
C(1, 2) = -params.m*(params.l^2/2)*sin(q1 - q2)*q2d;
C(2, 1) = params.m*(params.l^2/2)*sin(q1 - q2)*q1d;

%G matrix
G = zeros(2, 1);
G(1, 1) = -(params.M*params.l + params.m*params.l/2 + params.m*params.l)*params.g*sin(q1);
G(2, 1) = params.m*(params.l/2)*params.g*sin(q2);











