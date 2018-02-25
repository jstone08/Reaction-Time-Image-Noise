Reaction Time vs. Image Noise
Jordan Stone, 4/30/15

This program has three components. The scripts must be run in this order; 
'imageprocessing.m', 'experiment1.m', and 'dataprocessing.m'. The names of the 
scripts are fairly self explanatory but the first script will create all of the
variables needed to run the experiment, this includes mainly image matrices and 
noise producing fraction tools. The experiment script will run the experiment by 
communicating to the user and asking them to do certain tasks. When this project is
delivered for grading, the 'experiment1.m' script will be set up so the grader 
can run an example and he or she will have to option to compare his or her
results with the previously accumulated data if they wish. The 'dataProcessing.m'
contains the data analysis  of the experiment and a comparison of the grader's
data to the experiment participants. The data processing report will contain 
descriptive statistics about the data and graphically represent the data. 

To run an example:

- Open the zip file with all of the necessary components for the project.
 
- Run 'imageprocessing.m' and dismiss the figure at the end of the script.
  This is a representation for the interest of the grader and participants 
  to understand the various levels of image noise. 

- Make sure the workspace has NOT been cleared and run 'experiment1.m'.

- The command window will give instructions along with simple GUI elements.
 
- The script will automatically save the grader's data. The script will ask 
  the grader if they want to add their data to the analysis, and will 
  instruct them how to do so if he or she would like.

- Again without clearing the workspace, run 'dataProcessing.m'.
