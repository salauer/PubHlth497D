## if() runs a code only if the logical expression within the function is TRUE
value <- TRUE

if(value){
    x <- paste("some message")
    print(x)
}

value <- FALSE

## nothing should happen here
if(value){
    x <- paste("some message")
    print(x)
}

## if()...else, runs one code if the if() logical expression is TRUE and another if it's FALSE

value <- 10 # play with different values here

if(value>=10){
    x <- paste(value, "is greater than or equal to 10")
    print(x)
} else {
    x <- paste(value, "is less than 10")
}

## ifelse() can perform a logical function on a vector of values and return a vector of values based on each element of the vector

values <- c(1,5,15,3,29)
ifelse(values>=10,
       paste(values,"is greater than 10"), # what should be output if logical is TRUE
       paste(values,"is less than 10")) # what should be output if logical is FALSE

## you can even use two vectors and compare them!
team1 <- sample(1:10,5,T)
team2 <- sample(1:10,5,T)
ifelse(team1>=team2,
       "Team 1 wins!",
       "Team 2 wins!")

## this is especially useful for creating new columns in a data frame!
data(cars)
head(cars)

cars$new_col <- ifelse(cars$speed>cars$dist,
                       "Speed is greater than stopping distance",
                       "Stopping distance is greater than speed")
head(cars)

## for() loops are also a very useful structure. They can be used to try out a variety of numbers in the same code
## it takes the form of: for(name_of_element in vector_of_elements)
for(i in 1:5){# i is the name of the element in the below code, 1:5 is a vector of elements to plug into i
    print(i)
}

character_vector <- sample(letters,10)
for(some_letter in character_vector){#some_letter is the name of the element, character_vector is the vector of elements
    print(some_letter)
}

## we often use this to index a part of a vector
## first we'll show how to do something that we did with ifelse()
values <- c(1,5,15,3,29)
for(i in 1:length(values)){ # using length() we ensure that it cycles through all elements of the vector
    if(values[i]>=10){ # values[i] references the ith element of values
        print(paste(values[i],"is greater than 10"))
    } else{
        print(paste(values[i],"is less than 10"))
    }
}

## this is especially useful for creating columns in data frames that are difficult to make otherwise. I.e. referencing other rows
## here we'll make a column for cumulative dist in cars

cars$cum_dist <- NA # creates a column of NAs
head(cars)

for(i in 1:nrow(cars)){ # will cycle through all of the rows of cars
    if(i==1){ # when i is 1, just use the value in the first row
        cars$cum_dist[i] <- cars$dist[i] # cars$cum_dist[i] refers to the ith element of the column cum_dist in dataframe cars
    } else{ # when i is greater than 1, add the value in the current column to the value in the row before it
        cars$cum_dist[i] <- cars$dist[i] + cars$cum_dist[i-1] # cars$cum_dist[i-1] refers to the element in the previous row of cum_dist
    }
}
head(cars)
## success!
