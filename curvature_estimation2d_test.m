%% clear
clc; clear all; close all;

%% path
addpath('./lib/');
addpath('../curve_segmentation2d/lib/');

%% load image
im = imread('./im/wave.tif');

%% contour
[row, col] = find(im,1);
c = bwtraceboundary(im, [row, col], 'N');
[r,k,cc] = curvature_estimation2d(c);

%% tlot
figure; curvature_estimation_plot2d(c,r,cc);

%% mean and variance
km = mean(k); kv = var(k);
disp(['Cuvature: ' sprintf('%f %f', [km kv])]);