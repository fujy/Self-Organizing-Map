%% Kohonen Training Phase Function
function weights = kohonen_train(traindata,alpha,clusters_number,iterations)

% Get the number of input vectors and length of every one
[input_vectors_number, input_vector_length] = size(traindata);

% Create random weights matrix of size(clusters_number,input_vector_length)
weights = rand(clusters_number,input_vector_length);

% Create a temp vector that is going to use save euclidean distances
clusters_vector = zeros(clusters_number,1);

% 3 nested loop to build the weights matrix
% 1st loop is in range of number of iterations, it decrease the alpha every
% iteration
% 2nd loop is in range of number of input vectors, it calculates weight
% according to the minimum euclidean distance
% 3rd loop is in range of number of weight vectors, it calculates the
% euclidean distance
for i=1:iterations
    for j=1:input_vectors_number
        input_vector = traindata(j,:)';
        for k=1:clusters_number
            weight_vector = weights(k,:)';
            clusters_vector(k) = norm(input_vector-weight_vector);
        end
        [~, min_index] = min(clusters_vector);
        delta = input_vector - weights(min_index,:)';
        weights(min_index,:) = weights(min_index,:) + alpha*delta';
    end
    alpha = alpha / 2;
end

end