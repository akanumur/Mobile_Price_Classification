# Mobile_Price_Classification
Bulid a Random Forest model to classify mobile price range


### Data Source: https://www.kaggle.com/iabhishekofficial/mobile-price-classification

# Random Forest
Random forest is a way of averaging multiple decision trees, trained on different parts of the same training set, with the goal of overcoming over-fitting problem of an individual decision tree. In other words, random forest is an ensemble learning method for classification and regression that operates by constructing a lot of decision trees based on training data set and outputting the class that is the mode of the classes output by individual trees.

## What are ensemble methods:
Ensemble methods is a machine learning technique that combines several base models in order to produce one optimal predictive model.

## Terminology related to Random Forest :

1. Bagging (Bootstrap Aggregating):
Generates n new training data sets. Each new training data set picks a sample of observations with replacement (bootstrap sample) from original data set. By sampling with replacement, some observations may be repeated in each new training data set. The n models are fitted using the above n bootstrap samples and combined by averaging the output (for regression) or voting (for classification). In random forest, approximately 2-3rd of the total training data (63.2%) is used for growing each tree. And the remaining 1-3rd of the cases (36.8%) are left out and not used in the construction of each tree. They will be used for calculating the OOB error.

2. Out-of-Bag Error (Misclassification Rate):
Out-of-Bag is equivalent to validation or test data. In random forests, there is no need for a separate test set to validate the results. It is estimated internally, during the run, as follows: As the forest is built on training data, each tree is tested on approximately 1-3rd of the samples (36.8%) that were not used in building that tree (similar to validation data set). This is the out of bag error estimate- an internal error estimate of a random forest as it is being constructed.

3. Bootstrap Sample:
It is a random with replacement sampling method. Example: Suppose we have a bowl of 100 unique numbers from 0 to 99. We want to select a random sample of numbers from the bowl. If we put the number back in the bowl, it may be selected more than once. In this process, we are sampling randomly with replacement.

## Fine-tuning the Random Forest

Two parameters are important in the random forest algorithm:

**Number of trees used in the forest (ntree) and

**Number of random variables used in each tree (mtry).

- Find the optimal ntree:
First we set the mtry to the default value (sqrt of total number of all predictors) and search for the optimal ntree value. To find the number of trees that correspond to a stable classifier, we build random forest with different ntree values (100, 200, 300, …, 1000). We build 10 RF classifiers for each ntree value, record the OOB error rate and see the number of trees where the OOB error rate stabilizes and reaches the minimum value.

- Find the optimal mtry:
Apply a similar procedure such that random forest is run 10 times. The optimal number of predictors selected for split is selected for which the OOB error rate stabilizes and reach minimum.

We can experiment with including the (square root of total number of all predictors), (half of this square root value), and (twice of the square root value). Then we check which mtry returns the best results. In this procedure, for 1000 predictors the number of predictors to select for each node would be 16, 32, and 64 predictors.

Gini Importance is used to find **Feature Importance 

# Example for Random Forest :

Bob has started his own mobile company. He wants to give tough fight to big companies like Apple,Samsung etc.

He does not know how to estimate price of mobiles his company creates. In this competitive mobile phone market you cannot simply assume things. To solve this problem he collects sales data of mobile phones of various companies.

Bob wants to find out some relation between features of a mobile phone(eg:- RAM,Internal Memory etc) and its selling price. But he is not so good at Machine Learning. So he needs your help to solve this problem.

In this problem we do not have to predict actual price but a price range indicating how high the price is
