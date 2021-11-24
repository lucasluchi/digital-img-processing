clear all
close all
clc
pkg load signal
pkg load image

# read original image
img = imread("img/original.jpg");

# apply downscalling method 1
img = step_one(img, 2);

# create edited image
imwrite(img, "img/edited.jpg");



