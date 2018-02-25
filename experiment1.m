%% Jordan Stone, Lab Section LB, 4/16/15 - 5/6/15
%This section of the project is the experiemtnal section. In this experiment
%one will perform tasks where they will have to click on specific parts of 
%images. The elapsed time it takes for the participant to complete each task will 
%be recorded. Twenty participants have performed this experiment prior to 
%submission. The data analysis of the experiment will be viewed after 
%this in the 'dataProcessing.m' script.

%% Note to Grader  
% This experimental portion of the program was commented so that a person
% who was not familiar with MATLAB syntax would have a general
% understanding of how the program works. 

%% Introduction to MATLAB and Command Window

%During this section of the program, the program will communicate with the
%user via mesage boxes, the command window, and an interactive question box.

%Make sure to run 'imageprocessing.m' before this section of the project. 
clc
uiwait(msgbox(' The experiment will being shortly, but before, let us familiarize ourselves with reaction times. Close window to continue.','Reaction Time vs. Image Noise','modal'));
participant.gender = questdlg('Please select your gender','Gender','male','female','male');
%button = questdlg('qstring','title','str1','str2',default)'
%using a cell array in a strucutre to aide with future data analysis

uiwait(msgbox('Please direct your attention to the COMMAND WINDOW. The program will communiate with you through the command window. Close this window to continue and then click on the command window to interact with it.','Experiment Instructions','modal'));
%Making sure user will pay attention to the command winow.

pause(2)
disp('We will start with a test to warm up.')
pause(3)
disp('When prompted, hit the space bar to test your reaction speed.')
pause(3)
disp('The message will look just like this, "Hit the spacebar!", get ready.')
pause(3)
disp('Lets clear the command window to make it easier.')
pause(4)
clc
pause(2+rand(1,1)+rand(1,1))
disp('Hit the spacebar!')

tic %timer start
pause 
RT = toc; %timer end
fprintf('Your reaction time was %0.2f seconds\n', RT)
%small if statement that will respond to the user based on their warm up
%reaciton time
if RT < 0.5
    disp('NICE JOB!')
elseif RT <0.9
    disp('Eh, thats a little slow')
else
    disp('Its just a warm up!')
end

pause(3)
clc
%preparing user for the experiment to beign

disp('The experiment will happen very quickly with little instructions from')
pause(2.5) %command instruction lines added in seccesion at speed to emulate human reading reading speed
disp('the command window. You will be given one prompt per image giving')
pause(2.5)
disp('the target location for the preceeding image. The timer will start after the image is shown')
pause(2.5)
disp('and will end when (all of) the target location(s) on the image have been clicked.')
pause(2.5)
disp('You will be notified if you have made an incorrect selection through the command window.')
pause(2.5)
disp('The experiment may contain graphic images of bone fractures or dislocations.')
pause(2.5)
disp('Press any key to clear the command window and recieve the location prompt for the first image')
pause(2.5)
disp('of the experiement.')
pause
clc
pause(2)
%% image 1
disp('Locate the end-joint(bone) of the pointer-finger on the following x-ray.')
pause(3)

imagesc(handRay)%produces image of hand x-ray with no simulated noise
colormap gray% corrects color
axis equal %corrects size
tic %starts timer
guessCords = ginput(1); %asks user to select a point on the current figure

% the follwing values represent the threshold values
% of the acceptable image areas, determined experimentally

% xBL = 437.7515,325.3098
% xBR = 502.5368,313.5307
% xUR = 484.8681,219.2975
% xUL = 437.7515,236.9663

% while loops will ensure the user is clicking on the correct area on the
% x-ray, one loop for x-vals, one loop for y-vals (look at indexing of guess
% cords)
while guessCords(1) < 439 || guessCords(1) > 503
    disp('incorrect location, guess again')
    guessCords=ginput(1); 
end

while guessCords(2) < 220 || guessCords(2) > 326
    disp('incorrect location, guess again')
    guessCords=ginput(1);
end
participant.userData(1) = toc; %toc ends the timer, outputs time in seconds
%saving reaction time with in 'participant' data structure
disp('Good Job.')
pause(1.5)
disp('Press any key to clear the command window and recieve the location prompt for the next image.')
pause
clc
pause(1)
%% image 2

disp('Locate the end-joint(bone) of the largest digit.')
pause(3)


imagesc(footRay) %foot x-ray with no noise simulation
colormap gray 
axis equal
tic %starts timer
guessCords = ginput(1);
% the follwing values represent the threshold values
% of the acceptable image areas determined graphically

% xBL = 136.4143, 54.9470
% xBR = 155.2515, 60.0186
% xUR = 135.6897, 39.7323
% xUL = 152.3535 ,39.007

while guessCords(1) < 134 || guessCords(1) > 156
    disp('incorrect location, guess again')
    guessCords=ginput(1)
end

while guessCords(2) < 38 || guessCords(2) > 60
    disp('incorrect location, guess again')
    guessCords=ginput(1)
end
participant.userData(2) = toc; %adding RT to data-struct
disp('Good job.')
pause(4)

disp('Press any key to clear the command window and recieve the location prompt for the next image.')
pause
clc

%% image 3
pause(1)
disp('Locate ALL three fractures in the following X-ray.')
pause(3)

imagesc(legRay)
colormap gray
axis equal
tic %timer start
guessCords1 = ginput(1);%initial guess

% Norm calcualtions for each fracture in the image are embedded in each 
% 'guess'-while loop. Each fracture's (x,y) coordinates were experimentally 
% determined. The norms will be calcualted within each loop after eahc
% guess. If one of the norms does not meet its threshold minimum value then
% the guess will be prompted to be repeated by the user and the nroms will
% be recalculated until one of the norms is minimized. Only after one of
% the guesses is complete will the user be aloowed to make the second guess
% for the second fracture, and the same logic holds for the third guess.
% The timer stops on the third guess. 


%Norm calcualtions
isGuess1Done = 0;
while isGuess1Done ~= 1
    
frac1 = [260 230];
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

frac2 = [215 272];
frac2Norm = sqrt((frac2(1)-guessCords1(1))^2+(frac2(2)-guessCords1(2))^2);

frac3 = [253 42];
frac3Norm = sqrt((frac3(1)-guessCords1(1))^2+(frac3(2)-guessCords1(2))^2);

if frac1Norm < 15 || frac2Norm < 15 || frac3Norm < 20
    disp('Correct, select the next fracture')
    isGuess1Done = 1;
else
    disp('Incorrect, guess again')
    guessCords1 = ginput(1);
end
end

guessCords2 = ginput(1);

isGuess2Done = 0;
while isGuess2Done ~= 1

frac1 = [260 230];
frac1Norm = sqrt((frac1(1)-guessCords2(1))^2+(frac1(2)-guessCords2(2))^2);

frac2 = [215 272];
frac2Norm = sqrt((frac2(1)-guessCords2(1))^2+(frac2(2)-guessCords2(2))^2);

frac3 = [253 42];
frac3Norm = sqrt((frac3(1)-guessCords2(1))^2+(frac3(2)-guessCords2(2))^2);

    
if frac1Norm < 15 || frac2Norm < 15 || frac3Norm < 20
    disp('Correct, select the next fracture')
    isGuess2Done = 1;
else
    disp('Incorrect, guess again')
    guessCords2 = ginput(1)
end
end

guessCords3 = ginput(1);


isGuess3Done = 0;
while isGuess3Done ~= 1

frac1 = [260 230];
frac1Norm = sqrt((frac1(1)-guessCords3(1))^2+(frac1(2)-guessCords3(2))^2);

frac2 = [215 272];
frac2Norm = sqrt((frac2(1)-guessCords3(1))^2+(frac2(2)-guessCords3(2))^2);

frac3 = [253 42];
frac3Norm = sqrt((frac3(1)-guessCords3(1))^2+(frac3(2)-guessCords3(2))^2);    
    
if frac1Norm < 15 || frac2Norm < 15 || frac3Norm < 20
    disp('Correct, select the next fracture')
    isGuess3Done = 1;
else
    disp('Incorrect, guess again')
    guessCords3 = ginput(1);
end
end

participant.userData(3) = toc; %timer end
%% image 4 - Noise
disp('Now we will introduce noise into the images.')
pause(2)
disp('Press any key to clear the command window and recieve the prompt for the next image.')
pause 
clc
disp('Locate the gap between the ring-finger and the knuckle.')
pause(4)

tic %timer start
imagesc(handNoise3) %introducing noise, with variance of 1/10('moderate noise')
colormap gray
axis equal
guessCords1 = ginput(1);


isGuess1Done = 0; % resetting isGuess1Done = 0
while isGuess1Done ~= 1
 %Norm calcualtions
frac1 = [820 790]; %redefining frac1 coodinates for image 4
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

if frac1Norm < 30 %threshold for guess increases with total image size
    disp('Correct, select the next fracture')
    isGuess1Done = 1;
else
    disp('Incorrect, guess again')
    guessCords1 = ginput(1);
end
end
participant.userData(4) = toc;

disp('Good job.')
pause(4)
%% image 5
disp('Press any key to clear the command window and recieve the prompt for the next image.')
pause
clc
pause(1)
disp('Locate the fracture in the fore-arm.') %location prompt
pause(3)

tic %timer start 
imagesc(forearmNoise3) %introducing noise, with variance of 1/10
colormap gray
axis equal
guessCords1 = ginput(1);


isGuess1Done = 0; % resetting isGuess1Done = 0
while isGuess1Done ~= 1
 %Norm calcualtions
frac1 = [1730 1880]; %redefining frac1 coodinates for image 4
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

if frac1Norm < 80 %threshold for guess increased because image size increased
    disp('Correct, select the next fracture')
    isGuess1Done = 1;
else
    disp('Incorrect, guess again')
    guessCords1 = ginput(1);
end
end
participant.userData(5) = toc;

disp('Good job.')
pause(4)
disp('Press any key to clear the command window and recieve the location prompt for the next image.')
pause
clc
%% image 6
pause(2)
disp('Locate ALL three fractures in the following X-ray.')
pause(3)

imagesc(foot2Noise1) %this variance was a lower caliber because the image itself already contained some noise
colormap gray
axis equal
tic %timer start
guessCords1 = ginput(1);%initial guess

% see description in image 3, same logic used

%Norm calcualtions
isGuess1Done = 0;
while isGuess1Done ~= 1
    
frac1 = [292 248];
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

frac2 = [-333 809];
frac2Norm = sqrt((frac2(1)-guessCords1(1))^2+(frac2(2)-guessCords1(2))^2);

frac3 = [369 439];
frac3Norm = sqrt((frac3(1)-guessCords1(1))^2+(frac3(2)-guessCords1(2))^2);

if frac1Norm < 30 || frac2Norm < 30 || frac3Norm < 30
    disp('Correct, select the next fracture')
    isGuess1Done = 1;
else
    disp('Incorrect, guess again')
    guessCords1 = ginput(1);
end
end

guessCords2 = ginput(1);

isGuess2Done = 0;
while isGuess2Done ~= 1
 
frac1 = [292 248];
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

frac2 = [-333 809];
frac2Norm = sqrt((frac2(1)-guessCords1(1))^2+(frac2(2)-guessCords1(2))^2);

frac3 = [369 439];
frac3Norm = sqrt((frac3(1)-guessCords1(1))^2+(frac3(2)-guessCords1(2))^2);

    
if frac1Norm < 30 || frac2Norm < 30 || frac3Norm < 30
    disp('Correct, select the next fracture')
    isGuess2Done = 1;
else
    disp('Incorrect, guess again')
    guessCords2 = ginput(1);
end
end

guessCords3 = ginput(1);


isGuess3Done = 0;
while isGuess3Done ~= 1
    
frac1 = [292 248];
frac1Norm = sqrt((frac1(1)-guessCords1(1))^2+(frac1(2)-guessCords1(2))^2);

frac2 = [-333 809];
frac2Norm = sqrt((frac2(1)-guessCords1(1))^2+(frac2(2)-guessCords1(2))^2);

frac3 = [369 439];
frac3Norm = sqrt((frac3(1)-guessCords1(1))^2+(frac3(2)-guessCords1(2))^2);    
    
if frac1Norm < 30 || frac2Norm < 30 || frac3Norm < 30
    disp('Correct, select the next fracture')
    isGuess3Done = 1;
else
    disp('Incorrect, guess again')
    guessCords3 = ginput(1);
end
end

participant.userData(6) = toc; %timer end
disp('Experiment complete.')
pause(1)
%% End --> data save
clc
disp('This is the end of the experiment.')
pause(2)

%total participants:20+1
uiwait(msgbox('Your participant number is 21.  Close window to continue.','Reaction Time vs. Image Noise','modal'));
%prompting experimenter
partNum = inputdlg('enter your participant number given by experimenter');
save(partNum{1},'participant')

clc
disp('if you would like to add your data to the analysis portion, please drag "21.mat" into "ExperimentData".')
pause(4)
uiwait(msgbox('Please run the script called "dataprocessing.m" after closing this window.','Reaction Time vs. Image Noise','modal'));
