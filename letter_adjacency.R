## Letter Adjacency Function ####
#Developed by Shane Reader (@shanereader), feel free to share and chop it up but please consider attribution

letter_adjacency <- function(corpus) { #gets argument corpus, meaning body of text

## Check for and install Tidyverse, Stringr ####
  
  if (!require("tidyverse")) install.packages("tidyverse")
  if (!require("stringr")) install.packages("stringr")
  #tidyverse for data management and pipes, stringr for the corpus

## Turn corpus into vector ####
  
  vector <- strsplit( #split the strings
    gsub("[^[:alnum:]]", #remove everything except alphabumeric characters
                          " ", #replace anything removed with spaces
                          gsub("\\d", #remove numbers
                               " ", #replace removed numbers with spaces
                               corpus),
                          ignore.case=T),
                     " +")[[1]] #add them as elements in a vector
  
  vector <- toupper(vector) #make it all capitals

  
## Decompose vector to letter pairs ####
  
  #initialize our loop variables
  i <- 1
  j <- 1
  k <- 1
  result <- 0
  
  while(i<=length(vector)) { #cycle through each item in the vector
    while(j < nchar(vector[i])) { #cycle through each character in the word
      result[k] <- substr(vector[i],j,j+1) #append the two characters to result
      j <- j+1
      k <- k+1
    }
    j <- 1
    i <- i+1
  }

## Turn letter pairs into table ####
  
  #turn column x into the first letter (substr 1,1) of each pair and y into the second
  df <- tibble(x = substr(result,1,1), y = substr(result,2,2)) %>%
    table()
}
