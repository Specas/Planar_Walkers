%Function that plots the ground

%INPUTS:
%ax: Axis of the figure to plot on
%right_offset: height of the ground on the right edge of the figure

%OUTPUT:
%ax: Axis after drawing

function ax = plotGround(ax)

global params

hold on;
plot(ax, [params.xlim(1), params.xlim(2)], [params.left_height, params.right_height], 'g');
