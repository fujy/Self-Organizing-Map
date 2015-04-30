clc;
clear all;

%% Training Phase with simple training data
clc;
disp('====================');
disp('start training phase with simple test data');

% Number of Iterations
iterations=100;

% Learning Rate
alpha=0.6;

% Simple training data
simpletraindata=[1 1 0 0
    0 0 0 1
    1 0 0 0
    0 0 1 1];

% Number of clusters
simple_clusters_number = 2;

% Call for training function to calculate the weights
weights=kohonen_train(simpletraindata,alpha,simple_clusters_number,iterations);

disp(weights);
disp('end training');
disp('====================');

%% Testing Phase with simple test data
disp('====================');
disp('start testing phase with simple test data');

% Simple Testing data
testdata=[0 0 0 0.9
    0 0 0.8 0.9
    0.7 0 0 0
    0.7 0.9 0 0];

% Call testing function to calculate test results
test_results=kohonen_test(testdata,weights);

disp(test_results);

disp('end training');
disp('====================');