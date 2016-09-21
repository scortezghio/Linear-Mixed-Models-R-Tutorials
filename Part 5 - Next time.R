###NEXT TIME
#_______________________________________________


#LINEAR MIXED MODELS______________________ (nmle)

library(nlme) #fit linear mixed models
library(multcomp) #tukey tests for mixed effects models
library(nlmeU) #check statistical power

mixmod<-lme(tmoy ~ cond*pass, random=~1|pop,data= Data) 
anova(mixmod)

summary(mixmod)

#Assumption 1: Heteroskedasticity (equal variance amongst groups)
plot(fitted(mixmod),residuals(mixmod)) 
#Assumption 2: Residuals Normality
res<-residuals(type="pearson", mixmod)
st.res<-res/sd(res)
qqnorm(st.res,pch=16,main="")
qqline(st.res,col="red",lwd=2) 


#Tukey
tukey1 <- glht(mixmod, linfct = mcp(cond="Tukey",interaction_average=TRUE), test=adjusted(type="bonferroni"))
summary(tukey1)

tukey2 <- glht(mixmod, linfct = mcp(pass="Tukey",interaction_average=TRUE), test=adjusted(type="bonferroni"))
summary(tukey2)

#Measure Statistical Power
Pwr((mixmod))

__________________

***https://github.com/scortezghio/Linear-Models-R-Tutorials***
__________________



#Mesures rep
#LMPERM______________ (lmPerm) 
#GLMM________________ (GlmmADMB) 
#PCA_________________ (FactoMineR)
