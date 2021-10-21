# use R as a calculator (ctrl+ enter run the current line or highlighted code)
1 +2 

9-6

15/3

2*8

5*6 -1

5*(6-1)

# writing example (words, number of days, words per day)


words <- 10000 

number_of_days <- 9 
words_per_day <- words/number_of_days

# what happens if the deadline is moved so that I get 3 more days?
number_of_days <- 12 
words_per_day <- words/number_of_days

# vectors (cumulative sum of words over time)

days <- c(1,2, 3, 4, 5,6 ,7, 8,9, 10, 11, 12)

days <-c(1:12)

words_per_day * days

# functions (mean of a vector, sum of a vector) (book example)

books <- c(2,1,0,4)

mean(books)

sum(books)

# missing values

books <- c(2, 1, NA, 4)
mean(books)
mean(books, na.rm = TRUE)
