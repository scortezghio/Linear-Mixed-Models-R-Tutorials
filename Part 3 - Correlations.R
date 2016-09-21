###Correlations
#________________________________________________

#Pearson (proportional/linear relationship ; real values)
cor.test(tmoy,dpj,method="pearson")

#Spearman (Monotonic relationship ; ranks)
cor.test(tmoy,dpj,method="spearman")

plot(tmoy,dpj)

#Param vs Non Param
shapiro.test(tmoy) #si en bas de 0.05 = pas distribué normalement
hist(tmoy)



#Couper des colones
croppedtmoy<-c(tmoy[1:36])
croppeddpj<-c(tmoy[1:36])

cor.test(croppedtmoy,croppeddpj,method="pearson")

plot(croppedtmoy,croppeddpj)



#Transition vers les comparaisons de moyenne
cor.test(pop,tmoy) #erreur
plot(pop,tmoy)

