## Sample Letter Adjacency Analysis ####
#Just a fun project created by @ShaneReader, attribution appreciated if you use it =]


source("letter_adjacency.R")
#load the script with the function
#it'll check for and if necessary install tidyverse & stringr


sample <- read.delim("data/Word Frequencies.txt", sep = "\n")
#From the Max Planck Institute for Psycholinguistics, words with spoken frequency greater than or equal to 25
#it's delimited with "\n"

sample_adjacency <- letter_adjacency(sample)
#save the results into your preferred variable


#take a peak
print(sample_adjacency)
plot(sample_adjacency)


if (!require("circlize")) install.packages("circlize")
#circlize package created by Zuguang Gu, it's awesome!

chordDiagram(sample_adjacency)
#default

#some properties
chordDiagram(sample_adjacency,
             transparency = .4,
             grid.col = rep(hcl.colors(8, "Dark 3"), length.out = 26))

