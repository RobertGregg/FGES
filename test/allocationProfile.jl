using Revise
using FGES
using Random, Statistics



Random.seed!(314)
#Generate a dataset
numFeatures = 10
numObservations = 100
data = zeros(numObservations, numFeatures)

#number of previous features to use in caluclating the next feature
n=5

for i in 1:numFeatures
    if i ≤ n
        data[:,i] = randn(numObservations)
    else
        data[:,i] = sum(rand()*data[:,i-j] for j∈1:n) + randn(numObservations)
        #Stop the data from exploding
        data[:,i] ./= mean(data[:,i])
    end
end

g = fges(data)
