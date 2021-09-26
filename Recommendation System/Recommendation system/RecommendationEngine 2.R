
#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
install.packages("caTools")
install.packages("plyr")
library(plyr)
library(recommenderlab)
library(Matrix)
library(caTools)
#movie rating data
movie_rate_data <- read.csv('/Volumes/Data/Course Content/DS content/Recommendation Engine/Movie.csv')
#metadata about the variable
#movie_rate_data<-Movie
str(movie_rate_data)
#rating distribution
hist(movie_rate_data$rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
movie_rate_data_matrix <- as(movie_rate_data, 'realRatingMatrix')
movie_rate_data_matrix@data

#User Based Collaborative Filtering

movie_recomm_model2 <- Recommender(movie_rate_data_matrix, method="UBCF")

#Predictions for all users 
recommended_items2 <- predict(movie_recomm_model2, movie_rate_data_matrix[c(10:35),], n=5)
d<-as(recommended_items2, "list")
d

library (plyr)
df <- ldply (d, data.frame)

write.csv(df,"RE_Movies.csv")



########################


###########################


















#Popularity based 

movie_recomm_model1 <- Recommender(movie_rate_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(movie_recomm_model1, movie_rate_data_matrix, n=5)

as(recommended_items1, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering


