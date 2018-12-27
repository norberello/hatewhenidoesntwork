###krimen kopuru ta temperatura Chicagon...

##gorde fitxategi hau karpeta batean
#sartu datoak
#working directory menu > session > setworking directory >tosourcefilelocation
setwd("~/Documents/R scripts and data/crimen ta temp")
data.chicago<-read.csv("crimen eta temperatura.csv",head=TRUE)

##check the first lines
head(data.chicago)

##hemendik atera dira datoak
##http://crime.static-eric.com/#top


###The assumptions of the Pearson product moment correlation can be easily overlooked. The assumptions are as follows: level of measurement, related pairs, absence of outliers, normality of variables, linearity, and homoscedasticity.

##korrelazioa
##sakabatze diagrama
plot(data.chicago$Temp,data.chicago$Krimen,ylab="delitu kopurua",
     xlab="tenperatura",cex=1,pch=19,main=)

##datoak ikusita linealtasuna orokorrean dago, baina ba dira 3 muturretako puntuazioak
##oulier, linealtasun hori apur apurtzen dutenak

##ikus dezagun normaltasuna
shapiro.test(data.chicago$Krimen)
shapiro.test(data.chicago$Temp)

cor.test(data.chicago$Temp,data.chicago$Krimen,method="spearman")


###regressioa
###let's remove the last three points outlayers
data.berriak<-data.chicago[-c(45,46,47), ]
plot(data.berriak$Temp,data.berriak$Krimen)


tenp.eredua<-lm(Krimen~Temp,data=data.berriak)
anova(tenp.eredua)
summary(tenp.eredua)
abline(tenp.eredua)

#behaketen askatasunaren aurretikoa
library("lmtest")
dwtest(tenp.eredua)

#normaltasunaren aurretikoa
library("car")
qqPlot(tenp.eredua, main="QQ Plot")

#homozedastizitatearen aurretikoaren froga
ncvTest(tenp.eredua)



