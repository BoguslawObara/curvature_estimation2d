%% clear
clc; clear all; close all;

%% path
addpath('./lib/');

%% load image
im = imread('./im/wave.tif');

%% contour
[row, col] = find(im,1);
c = bwtraceboundary(im, [row, col], 'N');
[k,cc] = curvature_estimation2d(c);

%% tlot
figure; curvature_estimation_plot2d(c,k.^-1,cc);

%% mean and variance
km = mean(k); kv = var(k);
disp(['Cuvature: ' sprintf('%f %f', [km kv])]);