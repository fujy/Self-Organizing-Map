clc;
clear all;

%% Training Phase with real training data
disp('====================');
disp('start training phase with real test data');

% Number of Iterations
iterations=100;

% Learning Rate
alpha=0.6;

% Load the training data
control = load('control.txt');
patient = load('patient.txt');

realtraindata = [patient; control];

% Number of clusters
real_clusters_number = 2;

% Call for training function to calculate the weights
weights=kohonen_train(realtraindata,alpha,real_clusters_number,iterations);

disp('end training');

%% Labeling Phase with real training data
disp('====================');
disp('start labeling phase');

% with real training data with only 
% first input vector of both control and patient data

control_class=kohonen_test(control(1,:),weights);
patien_class=kohonen_test(patient(1,:),weights);

disp('control class is');
disp(control_class);
disp('patient class is');
disp(patien_class);

disp('end labeling');

%% Testing Phase with given test data
disp('====================');
disp('start testing phase with real test data');

% Load Testing data
testdata=load('test_three.txt');

% Call testing function to calculate test results
test_results=kohonen_test(testdata,weights);

% Assign the correct cluster name to each cluster number
for i=1:length(test_results)
    if test_results(i) == control_class
        test_results_string{i}='Control';
    else
        test_results_string{i}='Patient';
    end
end

disp('Testing results');
disp(test_results_string);

disp('end testing');
disp('====================');



