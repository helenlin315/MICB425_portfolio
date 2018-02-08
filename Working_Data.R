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

#DAY2
library(tidyverse)
#Always rerun every time we open R
#Pipes - cmd+shift+m (takes output from one function and feeds it to 1st argument)
data %>% function
function(data)
  
#Looking at oxygen in water samples, name it oxygen = 
oxygen = metadata %>% 
  select(O2_uM) 


#select all variables (in columns) that contain "O2" or "oxygen", | means or
metadata %>% 
  select(matches("O2|oxygen"))


#Filter means selecting for rows (samples) where oxygen = 0
metadata %>% 
  filter(O2_uM == 0)

# Selecting rows where O2 concentration is 0 and from there which depths 
#(which depths have no oxygen)
metadata %>% 
  filter(O2_uM == 0) %>% 
  select(Depth_m)

# Exercise 2: Using dplyr, find at what depth(s) methane (CH4) is above 100 nM while temperature is below 10 °C. Print out a table showing only the depth, methane, and temperature data.
metadata %>% 
  select(CH4_nM, Temperature_C, Depth_m) %>% 
  filter(CH4_nM > 100, Temperature_C < 10)
#Teacher answer

metadata %>% 
  select(matches("CH4|methane|nM"))
  
metadata %>% 
  select(matches("temp"))
#Never put units into the data cells for when you apply functions to it
#Varialbes are CH4_nM and Temperature_C

metadata %>% 
  filter(CH4_nM >100) %>% 
  filter(Temperature_C < 10) %>% 
  select(Depth_m, CH4_nM, Temperature_C)
#Or
metadata %>% 
  filter(CH4_nM > 100 & Temperature_C < 10) %>% 
  select(Depth_m, CH4_nM, Temperature_C)

#Mutate, create new variables, adding mathematical functions
#Mutate itself keeps all of the data in addition to the new variable
metadata %>% 
  mutate(N2O_uM = N2O_nM/1000)

library(tidyverse)
metadata %>% 
  mutate(N2O_uM = N2O_nM/1000)

#If we want to keep our newly calculated variable, we use transmute

metadata %>% 
  transmute(N2O_nM = N2O_nM/1000)

#Can easily use nitrous oxide in uM variable in calculations, if we pipe mutated data frame into another function

metadata %>% 
  mutate(N2O_uM = N2O_nM/1000) %>% 
  ggplot() + geom_point(aes(x=Depth_m, y=N2O_uM))

#Exercise 3
#Find which variables are in nM

metadata %>% 
  select(matches("nM")) %>% 
  head()

#Calculate uM variables

metadata %>% 
  mutate(N2O_uM = N2O_nM/1000, 
         Std_N2O_uM = Std_N2O_nM/1000,
         CH4_uM = CH4_nM/1000,
         Std_CH4_uM = Std_CH4_nM/1000) %>% 
  select(N2O_nM, N2O_uM,
         Std_N2O_nM, Std_N2O_uM,
         CH4_nM, CH4_uM,
         Std_CH4_nM ,Std_CH4_uM)
