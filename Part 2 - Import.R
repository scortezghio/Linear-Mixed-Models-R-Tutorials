###Importer des données dans R
#_________________________________________________

# Clean environement
rm(list=ls())

#File Import & Format Data
IData<-read.table("R.txt",header=T) #expliquer la petite flèche

pop<-IData$pop
cond<-IData$cond
pass<-IData$pass

tmoy<-IData$tmoy
dpj<-IData$dpj

Data<-data.frame(pop,cond,pass,tmoy,dpj) #order not important
Data

#Diviser le Dataframe
divided<-split(Data,pop)
divided[[1]]





# MAIS QUEL TEST STATISTIQUE JE PRENDS!?
Retour à PPT!