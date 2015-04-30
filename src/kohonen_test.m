%% Kohonen Test Phase Function
function test_results = kohonen_test(testdata,weights)

% Get number of test vectors (number of subjects)
[test_vectors_number, ~] = size(testdata);

% Get number of clusters
[clusters_number, ~] = size(weights);

% Create a temp vector that is going to use save euclidean distances
clusters_vector = zeros(clusters_number,1);
% Create a temp vector to save test results
test_results = zeros(test_vectors_number,1);

% 2 nested loop to build the assign every input vector for a cluster
% 1st loop is in range of number of input vectors, it assign the input
% vector to a cluster according to the minimum euclidean distance
% 2nd loop is in range of number of weight vectors, it calculates the
% euclidean distance between the input vector and weight vector
for j=1:test_vectors_number
    test_vector = testdata(j,:)';
    for k=1:clusters_number
        weight_vector = weights(k,:)';
        clusters_vector(k) = norm(test_vector-weight_vector);
    end
    [~, min_index] = min(clusters_vector);
    test_results(j) = min_index;
end

end