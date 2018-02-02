#Comments
tidyverse
library(tidyverse)
#Command enter to enter code from top to console
#Load packages every time using library(tidyverse)
#In terminal, copy data
cp ~/Documents/MICB425_materials/Saanich.metadata.txt ~/Documents/MICB425_portfolio
#Only for materials repo
git reset --hard origin/master

#Load data (don't forget command enter)
read.table(file="Saanich.metadata copy.txt")
#Save data as object in environment
metadata <- read.table(file="Saanich.metadata copy.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")
read.table(file="Saanich.OTU copy.txt")
otu <- read.table(file="Saanich.OTU copy.txt", header=TRUE, row.names=1, sep="\t", na.strings="NAN")
