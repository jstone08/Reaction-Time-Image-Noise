%% Jordan Stone, Lab Section LB, 4/15/15 - 5/6/15
%This code processes the images in the zip file and creates matrices
%in order for Matlab to correctly manipulate the images and integrate them
%into the experimental part of the program.

clear %clears graders worspace for running full program.
clc % clears command window, this will be important for following the 
% instructional prompts within the program

%Initializing stock X-ray images for experiment, all were taken from safe
%re-use safe medical images stocks.

handRay = imread('Hand.jpg');
footRay = imread('foot.jpeg');
legRay = imread('leg.jpg');
forearmRay = imread('forearm.jpg');
foot2Ray = imread('foot2.jpg');

%% Noise Generation Motivation
%The reason for simulating noise in X-ray images is because the magnitude
%of the x-ray is inversly proportional to the amount of noise in the image.
%When the magnitude of x-rays are increased, and the noise decreased, 
%the potential harm to the patient is also increased. Therefore there is 
%a good reason to find out the threshold at which people can analyze x-rays
%becuase it can lower the potential helth risk of x-rays.

%% Noise Generation
% J = imnoise(handTest,'speckle',v);
% The imnoise command creates multiplicative noise to the image, using the
% equation J = I+n*I, where n is uniformly distributed random noise 
% with mean 0 and variance v(fraction). 

v = 0.01; %image noise variance fraction

handNoise1 = imnoise(handRay,'speckle',v);
%footNoise1 = imnoise(footRay,'speckle',v);
%legNoise1 = imnoise(legRay,'speckle',v);
%forearmNoise1 = imnoise(forearmRay,'speckle',v);
foot2Noise1 = imnoise(foot2Ray,'speckle',v);

v=0.04; %image noise variance fraction

handNoise2 = imnoise(handRay,'speckle',v);
%footNoise2 = imnoise(footRay,'speckle',v);
%legNoise2 = imnoise(legRay,'speckle',v);
%forearmNoise2 = imnoise(forearmRay,'speckle',v);
%foot2Noise2 = imnoise(foot2Ray,'speckle',v);

v=0.1; %image noise variance fraction

handNoise3 = imnoise(handRay,'speckle',v);
%footNoise3 = imnoise(footRay,'speckle',v);
%legNoise3 = imnoise(legRay,'speckle',v);
forearmNoise3 = imnoise(forearmRay,'speckle',v);
foot2Noise3 = imnoise(foot2Ray,'speckle',v);

v=0.16; %image noise variance fraction

handNoise4 = imnoise(handRay,'speckle',v);
%footNoise4 = imnoise(footRay,'speckle',v);
%legNoise4 = imnoise(legRay,'speckle',v);
%forearmNoise4 = imnoise(forearmRay,'speckle',v);
%foot2Noise4 = imnoise(foot2Ray,'speckle',v);

%Some of the noise generation commands have been commented out in this case
%because the this experiment only uses certain images with certain noise
%levels. The long term plan  for this program would to create many
%experiments testing many degrees of image noise. However, this was not 
%possible in the scope and time of this final project, but the building 
%blocks are here.

uiwait(msgbox('After dismissing window, a sampling of various degrees of image noise will be shown.','Image Processing','modal'));
% informs user that image will be displayed, gets user to interact with
% program--> hence 'modal' command. 

figure
subplot(2,2,1) %creates subplot to compare noise levels
imagesc(handNoise1) %imagesc will "plot" the converted image matrix
colormap gray %corrects color of image
axis equal %makes sure image size is to scale and not distorted
%does this by calcualting size of image matrix before plotting and adjusts
%the plotting window to fit the original image in the correct ratio
title('Image Noise with Variance = 0.01')
%this is the variance fraction, which controls simulated noise intensity
% as the variance fractions approaches 1, the noise increases linearly

subplot(2,2,2)
imagesc(handNoise2)
colormap gray
axis equal
title('Image Noise with Variance = 0.04')

subplot(2,2,3)
imagesc(handNoise3)
colormap gray
axis equal
title('Image Noise with Variance = 0.1')
xlabel('*Image noise being tested in Experiment*')

subplot(2,2,4)
imagesc(handNoise4)
colormap gray
axis equal
title('Image Noise with Variance = 0.16')
disp('The following subplot represents varying levels of image noise in a sample x-ray image')
pause(2)
disp('In the reaction time experiment, only moderate levels of image noise will be tested.')

pause(6)

uiwait(msgbox('Please CLOSE the subplot "Image Noise" window and without clearing the workspace, load the "experiment1.m" file.','Image Processing','modal'));
% instructs the user to close the subplot before continuing and to load the
% next part of the project. 
