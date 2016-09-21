### Comparaisons de moyennes
#__________________________________________________


## COMPARER DEUX MOYENNES____________

#Test de t

t.test(tmoy~cond,data=Data)

#verification des premisses
shapiro.test(tmoy) #normal de peu

#non-parametriqe (Mann-Whitney-Wilcoxon)
wilcox.test(tmoy~cond,data=Data) #plus conservateur, 
  # et pas besoin de tenir compte des premisses

#graph
plot(tmoy~cond)

#exemple avec seulement la population A
pop1<-c(tmoy[1:24]) #on cree un vecteur de tmoy avec la popA uniquement
condpop1<-c(cond[1:24]) # meme chose avec cond

tmoycoup<-pop1
condcoup<-condpop1

t.test(tmoycoup~condcoup) #pas necessaire de mettre data=
  # ou wilcox.test (preferable)



## COMPARER PLUS DE DEUX MOYENNES___________

#Anova
mod1<-aov(tmoy~pass,data=Data)
anova(mod1)

#Tukey Post-hoc
TukeyHSD(mod1)

#verification des premisses 
#Assumption 1: Heteroskedasticity (equal variance amongst groups)
plot(fitted(mod1),residuals(mod1)) 
#Assumption 2: Residuals Normality
res<-residuals(type="pearson", mod1)
st.res<-res/sd(res)
qqnorm(st.res,pch=16,main="")
qqline(st.res,col="red",lwd=2) 


#AUTRE EXEMPLE
mod2<-aov(tmoy~pop,data=Data)
anova(mod2)
 
#Assumption 1: Heteroskedasticity (equal variance amongst groups)
plot(fitted(mod2),residuals(mod2)) 
#Assumption 2: Residuals Normality
res<-residuals(type="pearson", mod2)
st.res<-res/sd(res)
qqnorm(st.res,pch=16,main="")
qqline(st.res,col="red",lwd=2) 

mod2b<-aov(log(tmoy)~pop,data=Data)
anova(mod2b)
#^2,1/,log,sqrt, rank, etc.

#Assumption 1: Heteroskedasticity (equal variance amongst groups)
plot(fitted(mod2b),residuals(mod2b)) 
#Assumption 2: Residuals Normality
res<-residuals(type="pearson", mod2b)
st.res<-res/sd(res)
qqnorm(st.res,pch=16,main="")
qqline(st.res,col="red",lwd=2) 
  #Toujours pas capable de recontrer la seconde premisse

#Kruskal-Wallis
kruskal.test(tmoy~pop,data=Data)

#graph
plot(tmoy~pop) #confirmation visuelle


## ANOVAS A PLUSIEURS FACTEURS!
  # ou Modèles linéaires à plusieurs facteurs 
  # Équivalent non-paramétrique = Modèles généralisés linéaires ou modèles à permutations (pas couverts aujourd'hui)

mod3<-aov(tmoy~cond*pass,data=Data)
anova(mod3)
extractAIC(mod3) #Plus c'est bas, mieux c'est.
TukeyHSD(mod3)

#Assumption 1: Heteroskedasticity (equal variance amongst groups)
plot(fitted(mod3),residuals(mod3)) 
#Assumption 2: Residuals Normality
res<-residuals(type="pearson", mod3)
st.res<-res/sd(res)
qqnorm(st.res,pch=16,main="")
qqline(st.res,col="red",lwd=2) 

#Load package
library(ggplot2) #graphs

#Graphs complexes
graph3<-ggplot(data=Data, aes(pass, tmoy))+
  
  #Ajouter les box plots  
  geom_boxplot(outlier.shape=NA,aes(fill=cond))+
  
  #Enlève le fond gris
  theme_bw()

#Affiche le graph
graph3

  #ET AVEC LES POPS?
  #Sépare 3T3 et CNH
  facet_grid(.~pop)+


