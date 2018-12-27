---
title: "Internet eta adinaren arteko erlazioa"
author: "Norberto Asensio"
date: "29/11/2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

##Zeregina

Adina eta internet-en erabilera erlazionatuta daude? 

##Sartu datoak taula batean

Datoak gaiaren aurkezpenean topa ditzazkezu. Nik taulari "data.int.adina" deituko diot, baina erabili nahi duzun izena:

```{r cars}
dat.int.adina <- data.frame(internet_ez=c(50,168,323,254), 
internet_bai=c(224,383,274,21),
row.names=c("18-25","26-45","46-65",">65"))
```

##Jarri figura batean

```{r}
barplot(t(as.matrix(dat.int.adina)), beside=TRUE,
        ylab="pertsona kopurua",col=c("white","blue"))
legend("topright",legend =c("ez internauta","internauta"),
       bty = "n",horiz=TRUE,
       fill=c("white","blue"))
```

##Pearson-en Chi Karratuaren froga

Egin testa eta gorde "chi.test.inter" izeneko objetu baten gero hobeto miatzeko ezberdintasunak non dauden.

```{r}
(chi.test.inter<-chisq.test(dat.int.adina))
```

##Oinarrizko interpretazioa

Internauta izatea ala ez eta adina elkar erlazionatuta daude zeren Chi karratu frogak ikusitako maiztasunak ez direla zoriz gertatzen esaguratsuki adierazten du (Chi Karratua = 390.63, df = 3, p < 0.05). 

Honekin nahikoa litzateke bi aldairen artean erlazio bat dagoela adierazteko modu estatistiko batean, baina joan gaitezen apur bat sakonago nahi baduzu.

##hondakin estandarizatu zuzenduak

Hondakin estandarizatu zuzenduek behatutako eta itxarondako maiztasunen arteko esaguratsutasuna adierazten dute kasu bakoitzarentzat (8 kasurentzat alegia).

```{r}
chi.test.inter$stdres
```

Hondakin hauek grafikoki ikusteko

```{r}
library(corrplot)
corrplot(chi.test.inter$stdres, is.cor = FALSE)
```

Zirkuluen tamaina hondakinen magnitudea erakusten dute, urdina izanez gero espero baino maiztasun handiago, gorria izanez gero espero baino maiztasun txikiago.

##Interpretazioa

Kasu guztiak estatistikoki esanguratsuak dira, gogoratu >1.96 (espero baino handiagoa) edo >-1.97 (espero baino txikiagoa) balioek jartzen dutela muga esanguratsutasun estatistikoa adierazteko. Lehengo adin tarteak (gazteenak) eta azkenengo adin kategoriak (zaharrenak) balio handienak dauzkate. Azkenengo interpretazio holan berridatzi dezakegu (aurreko interpretazioa, esan bezala, nahikoa da, baina orain informazio gehiago emango dezakegu). Hortaz honela idatziko genuke:

Adin tarte jakin batekoa izatearen eta internet-en erabileraren arteko erlazioa estatistikoki esanguratsua da (χ2=390,632; ag = 3; p < 0.05), hau da aurrekoa errepikatzea beste modu batean. Bi adin tarte txikienetan zoriz itxaroten dena baino internauta proportzio handiagoa aurkitu da (p < 0.05). Aldiz, bi adin tarte handienetan zoriz itxaroten dena baino internauta proportzio baxuagoa dago (p < 0.05).





