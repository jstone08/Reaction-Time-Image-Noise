%% Jordan Stone, Lab Section LB, 4/15/15 - 5/6/15
% This code processes the data gathered from the experiemntal part of the 
% project and performs an analyis of the data. 
clear
clc
cd ExperimentData 
%% Data Loading
%Each file is loaded individually and two variables are constructed using
%indexing and cell array indexing. A vector cell array will contain the
%gender information for all of the data and a matrix will contain all of
%the reaction time data for each specific image from each participant. 
load 1.mat
gender{1} = participant.gender;
RTmat(1,:) = participant.userData;

load 2.mat
gender{2} = participant.gender;
RTmat(2,:) = participant.userData;

load 3.mat
gender{3} = participant.gender;
RTmat(3,:) = participant.userData;

load 4.mat
gender{4} = participant.gender;
RTmat(4,:) = participant.userData;

load 5.mat
gender{5} = participant.gender;
RTmat(5,:) = participant.userData;

load 6.mat
gender{6} = participant.gender;
RTmat(6,:) = participant.userData;

load 7.mat
gender{7} = participant.gender;
RTmat(7,:) = participant.userData;

load 8.mat
gender{8} = participant.gender;
RTmat(8,:) = participant.userData;

load 9.mat
gender{9} = participant.gender;
RTmat(9,:) = participant.userData;

load 10.mat
gender{10} = participant.gender;
RTmat(10,:) = participant.userData;

load 11.mat
gender{11} = participant.gender;
RTmat(11,:) = participant.userData;

load 12.mat
gender{12} = participant.gender;
RTmat(12,:) = participant.userData;

load 13.mat
gender{13} = participant.gender;
RTmat(13,:) = participant.userData;

load 14.mat
gender{14} = participant.gender;
RTmat(14,:) = participant.userData;

load 15.mat
gender{15} = participant.gender;
RTmat(15,:) = participant.userData;

load 16.mat
gender{16} = participant.gender;
RTmat(16,:) = participant.userData;

load 17.mat
gender{17} = participant.gender;
RTmat(17,:) = participant.userData;


load 18.mat
gender{18} = participant.gender;
RTmat(18,:) = participant.userData;

load 19.mat
gender{19} = participant.gender;
RTmat(19,:) = participant.userData;

load 20.mat
gender{20} = participant.gender;
RTmat(20,:) = participant.userData;
%% Grading Example: Data Addition 
% As the grader, you have the option to add your data to the analysis, the
% program should seemelssly accomidate this change if desired. 
% simply remove the commenting operator '%' from the following three lines
% of code.

%load 21.mat
%gender{21} = participant.gender;
%RTmat(21,:) = participant.userData;

%% Gender Array

% strcmp for gender field of participant struct
femArray = strcmp(gender,'female'); 
malArray = strcmp(gender,'male');

%% Descriptive Statisctics of Data
pause(2)
disp('The average reaction times of the images will now be calculated and displayed from the data.')
pause(3)
% specific image means
img1FemaleAverage = mean(RTmat(femArray,1));
img1MaleAverage = mean(RTmat(malArray,1));
img1Average = mean(RTmat(:,1));
%image 1 mean reaction times male/female
img2FemaleAverage = mean(RTmat(femArray,2));
img2MaleAverage = mean(RTmat(malArray,2));
img2Average = mean(RTmat(:,2));
%image 2 mean reaction times male/female
img3FemaleAverage = mean(RTmat(femArray,3));
img3MaleAverage = mean(RTmat(malArray,3));
img3Average = mean(RTmat(:,3));
%image 3 mean reaction times male/female
img4FemaleAverage = mean(RTmat(femArray,4));
img4MaleAverage = mean(RTmat(malArray,4));
img4Average = mean(RTmat(:,4));
%image 4 mean reaction times male/female
img5FemaleAverage = mean(RTmat(femArray,5));
img5MaleAverage = mean(RTmat(malArray,5));
img5Average = mean(RTmat(:,5));
%image 5 mean reaction times male/female
img6FemaleAverage = mean(RTmat(femArray,6));
img6MaleAverage = mean(RTmat(malArray,6));
img6Average = mean(RTmat(:,6));
%image 6 mean reaction times male/female
%% Displays of Avg Reaction Times
fprintf('The average reaction time for the first image was %0.3f seconds.\n',img1Average)
fprintf('The average male reaction time for the first image was %0.3f seconds.\nThe average female reaction time for the first image was %0.3f seconds.\n\n',img1MaleAverage,img1FemaleAverage)
pause(7)
fprintf('The average reaction time for the second image was %0.3f seconds.\n',img2Average)
fprintf('The average male reaction time for the second image was %0.3f seconds.\nThe average female reaction time for the second image was %0.3f seconds.\n\n',img2MaleAverage,img2FemaleAverage)
pause(7)
fprintf('The average reaction time for the thrid image was %0.3f seconds.\n',img3Average)
fprintf('The average male reaction time for the third image was %0.3f seconds.\nThe average female reaction time for the third image was %0.3f seconds.\n\n',img3MaleAverage,img3FemaleAverage)
pause(3)
fprintf('Press any key to continue to the results from the images with simulated noise.\n\n')
pause


fprintf('The average reaction time for the fourth image was %0.3f seconds.\n',img4Average)
fprintf('The average male reaction time for the fourth image was %0.3f seconds.\nThe average female reaction time for the fourth image was %0.3f seconds.\n\n',img4MaleAverage,img4FemaleAverage)
pause(7)
fprintf('The average reaction time for the fifth image was %0.3f seconds.\n',img5Average)
fprintf('The average male reaction time for the fifth image was %0.3f seconds.\nThe average female reaction time for the fifth image was %0.3f seconds.\n\n',img5MaleAverage,img5FemaleAverage)
pause(7)
fprintf('The average reaction time for the sixth image was %0.3f seconds.\n',img6Average)
fprintf('The average male reaction time for the sixth image was %0.3f seconds.\nThe average female reaction time for the sixth image was %0.3f seconds.\n\n',img6MaleAverage,img6FemaleAverage)
pause(7)
disp('Press any key to continue and clear the command window.')
pause
clc
%% Analysis of RT's in Command Window

pause(2)
disp('Note: analysis was made with program running particiapnts 1-20, excluding grader example.')
pause(5)
clc
pause(2)
disp('Interestingly enough, for the x-ray images that did not contain noise,')
pause(2)
disp('males were able to locate the target location in the iamge marginally')
pause(2)
fprintf('faster than females.\n\n') %creates return for asthetics 

pause(3)
disp('However, once noise was introduced into the x-ray images, females')
pause(2)
disp('responded much faster. The average female reaction times for images')
pause(2)
disp('with noise was significantly lower.')
pause(8)
clc
%% Boxplots
pause(1)
disp('Press the space bar to generate a boxplot for the images.')
pause

subplot(2,3,1)
boxplot(RTmat(:,1),gender)
title('Reaction Time Image 1')
ylabel('seconds')

subplot(2,3,2)
boxplot(RTmat(:,2),gender)
title('Reaction Time Image 2')
ylabel('seconds')

subplot(2,3,3)
boxplot(RTmat(:,3),gender)
title('Reaction Time Image 3')
ylabel('seconds')

subplot(2,3,4)
boxplot(RTmat(:,4),gender)
title('Reaction Time Image 4: Added Noise')
ylabel('seconds')

subplot(2,3,5)
boxplot(RTmat(:,5),gender)
title('Reaction Time Image 5: Added Noise')
ylabel('seconds')

subplot(2,3,6)
boxplot(RTmat(:,6),gender)
title('Reaction Time Image 6: Added Noise')
ylabel('seconds')

uiwait(msgbox('Drag the figure box on the lower right corner to expand the image. Close window to continue.','Reaction Time vs. Image Noise: Results','modal'));
 
cd ..
cd ExperimentResults

hgsave('RT_Boxplots') 


disp('Press the sapcebar to generate histograms for the discrepancy between genders.')
pause
clc


%% Histograms

subplot(3,2,1)
histogram(RTmat(femArray,[1:3]))
title('Female Reaction Times w/o Noise')
xlabel('seconds')
ylabel('reactions')

subplot(3,2,2)
histogram(RTmat(malArray,[1:3]))
title('Male Reaction Times w/o Noise')
xlabel('seconds')
ylabel('reactions')

subplot(3,2,3)
histogram(RTmat(femArray,[4:6]))
title('Female Reaction Times with Noise')
xlabel('seconds')
ylabel('reactions')

subplot(3,2,4)
histogram(RTmat(malArray,[4:6]))
title('Male Reaction Times with Noise')
xlabel('seconds')
ylabel('reactions')

subplot(3,2,5)
histogram(RTmat(femArray,[1:6]))
title('Female Reaction Times Aggregate')
xlabel('seconds')
ylabel('reactions')

subplot(3,2,6)
histogram(RTmat(malArray,[1:6]))
title('Male Reaction Times Aggregate')
xlabel('seconds')
ylabel('reactions')

hgsave('RT__Gender_Specific_Histograms') %saves gender histograms to results file

disp('Press the spacebar to generate histograms for the discrepancy between Noise.')
pause
clc
%% Histograms Version 2
%focuses on 

subplot(1,2,2)
histogram(RTmat(:,[4:6]))
title('Reaction Times with Noise') 
xlabel('seconds')
ylabel('reactions')

subplot(1,2,1)
histogram(RTmat(:,[1:3]))
title('Reaction Times without Noise')
xlabel('seconds')
ylabel('reactions')


hgsave('RT_Histograms') %saves noise histograms to results file
%% Average Reaction Time Vectors
%Creating average RT seperated by gender vectors to be saved in results file
AvgVecFemale(1) = img1FemaleAverage;
AvgVecMale(1) = img1MaleAverage;
AvgVec(1) = img1Average;
%image 1 mean reaction times male/female

AvgVecFemale(2) = img2FemaleAverage;
AvgVecMale(2) = img2MaleAverage;
AvgVec(2) = img2Average;
%image 2 mean reaction times male/female

AvgVecFemale(3) = img3FemaleAverage;
AvgVecMale(3) = img3MaleAverage;
AvgVec(3) = img3Average;
%image 3 mean reaction times male/female

AvgVecFemale(4) = img4FemaleAverage;
AvgVecMale(4) = img4MaleAverage;
AvgVec(4) = img4Average;
%image 4 mean reaction times male/female

AvgVecFemale(5) = img5FemaleAverage;
AvgVecMale(5) = img5MaleAverage;
AvgVec(5) = img5Average;
%image 5 mean reaction times male/female

AvgVecFemale(6) = img6FemaleAverage;
AvgVecMale(6) = img6MaleAverage;
AvgVec(6) = img6Average;
%image 6 mean reaction times male/female

save('Male_Reaction_Times','AvgVecMale') %saves data to results file
save('Female_Reaction_Times','AvgVecFemale') %saves data to results file
save('Reaction_Times','AvgVec')%saves data to results file

disp('Thank you for your participation.')
pause(2)
disp('End of Program.') %end


