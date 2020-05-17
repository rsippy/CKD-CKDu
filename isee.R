setwd("C:/Users/remachines/Desktop/Machala/CKDu/Data")

d9<-readRDS("d9.RData")

#maps
library(maptools)
library(raster)
library(rgdal)
library(maps)

#ecu provinces
ecu1<-readRDS("C:/Users/remachines/Desktop/Machala/CKDu/Data/Spatial/gadm36_ECU_1_sp.rds")
ecu1<-spTransform(ecu1,"+proj=longlat +ellps=WGS84 +datum=WGS84")

#add
ecu2<- merge(ecu1,d9,by="NAME_1")

library(RColorBrewer)

#one by one
#spplot(ecu2,"ra0",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2010")
#spplot(ecu2,"ra1",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2011")
#spplot(ecu2,"ra2",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2012")
#spplot(ecu2,"ra3",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2013")
#spplot(ecu2,"ra4",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2014")
#spplot(ecu2,"ra5",cuts=6,col="transparent",
#       col.regions=(brewer.pal(7,"YlOrRd")),main="N18 Rate in 2015")

#all together now
spplot(ecu2,c("ra0","ra1","ra2","ra3","ra4","ra5"),
       cuts=8,col="transparent",as.table=TRUE,key.space="right",
       col.regions=(brewer.pal(9,"YlOrRd")),
       names.attr = c("2010","2011","2012","2013","2014","2015"),
       main="N18 Rate")

#no galapagos
ecu3<-ecu2[-9,]
spplot(ecu3,c("ra0","ra1","ra2","ra3","ra4","ra5"),
       cuts=8,col="transparent",as.table=TRUE,key.space="right",
       col.regions=(brewer.pal(9,"YlOrRd")),
       names.attr = c("2010","2011","2012","2013","2014","2015"),
       main="N18 Rate")

saveRDS(ecu3,"ecu3.RData")

#no galapagos 14 15 only
ecu3<-readRDS("ecu3.RData")

#################################plot of CKD rates
spplot(ecu3,c("ra1","ra4","ra3","ra5"),
       cuts=8,col="transparent",as.table=TRUE,key.space="right",
       col.regions=(brewer.pal(9,"YlOrRd")),
       names.attr = c("2011","2014","2013","2015"),
       main="N18 Rate")

#employed people
emps<-read.csv("empleos.csv",header=TRUE,stringsAsFactors =FALSE)
emps2<-emps[77:342,]
emps3<-emps2[emps2$Desagregación.2=="Empleo",]
emps3$year<-c(2010,2010,2011,2011,2012,2012,2013,2013,2014,2014,
              2014,2014,2015,2015)
emps4<-emps3[,9:35]
emps4[,1:26]<-sapply(emps4[,1:26],as.numeric)
emps5<-aggregate(emps4[,1:26],list(year=emps4$year),sum,na.rm=TRUE)
emps6<-data.frame(t(emps5))
colnames(emps6)<-emps6[1,]
emps6$prov<-rownames(emps6)
emps6$NAME_1<-c("year",ecu3@data$NAME_1[c(1:4,6,5,7:15,17,18,22,23,9,21,16,
                            20,19)],"Zona","Amazonas")
emps7<-emps6[c(2:20,22:25),5:8]
colnames(emps7)[1:2]<-c("a2014","a2015")

ecu4<- merge(ecu3,emps7,by="NAME_1")

#total province popn
pops<-read.csv("pobla.csv",header=TRUE,stringsAsFactors =FALSE)
colnames(pops)<-c("lb","tot10","tot11","tot12","tot13","tot14","tot15")

ecu5<- merge(ecu4,pops,by="lb")

ecu5$agp4<-ecu5$X2014/ecu5$tot14
ecu5$agp5<-ecu5$X2015/ecu5$tot15

ecu5$agp4w<-ecu5$a2014/ecu5$X2014
ecu5$agp5w<-ecu5$a2015/ecu5$X2015

#oops actual ag population
e12<-read.csv("C:/Users/remachines/Desktop/Machala/CKDu/Data/Surveys/ESPAC/ESPAC2012.csv",header=TRUE,stringsAsFactors =FALSE)
e13<-read.csv("C:/Users/remachines/Desktop/Machala/CKDu/Data/Surveys/ESPAC/ESPAC2013.csv",header=TRUE,stringsAsFactors =FALSE)
e14<-read.csv("C:/Users/remachines/Desktop/Machala/CKDu/Data/Surveys/ESPAC/ESPAC2014.csv",header=TRUE,stringsAsFactors =FALSE)
e15<-read.csv("C:/Users/remachines/Desktop/Machala/CKDu/Data/Surveys/ESPAC/ESPAC2015.csv",header=TRUE,stringsAsFactors =FALSE)

ag1215<-cbind(e12[,1:2],e13[,2],e14[,2],e15[,2])
colnames(ag1215)<-c("NAME_1","aw12","aw13","aw14","aw15")
ag1215[c(2,11,15,16,22),1]<-c("Bolivar","Santo Domingo de los Tsachilas",
                           "Los Rios","Manabi","Sucumbios")
ecu6<-merge(ecu5,ag1215,"NAME_1")

ecu6$agp2t<-ecu6$aw12/ecu6$tot12
ecu6$agp3t<-ecu6$aw13/ecu6$tot13
ecu6$agp4t<-ecu6$aw14/ecu6$tot14
ecu6$agp5t<-ecu6$aw15/ecu6$tot15

ecu6$agp4w<-ecu6$aw14/ecu6$a2014
ecu6$agp5w<-ecu6$aw15/ecu6$a2015

###############################################plot of ag popn proportion
spplot(ecu6,c("agp2t","agp3t","agp4t","agp5t"),
       cuts=8,col="transparent",as.table=TRUE,key.space="right",
       col.regions=(brewer.pal(9,"YlGnBu")),
       names.attr = c("2012","2013","2014","2015"),
       main="Proportion of Population in Agriculture")

#neighbors & weights
library(spdep)

ecu50<-ecu5
ecu50<-readRDS("ecu50.RData")
continuity.nb <- poly2nb(ecu50)
continuity.listw <- nb2listw(continuity.nb)

#morans I
moran.test(ecu50$ra4, continuity.listw)#p-value = 0.8076
moran.test(ecu50$ra5, continuity.listw)#p-value = 0.9529

#2015 normality?
#plot(density(ecu50@data$ra5))
#plot(density(log(ecu50@data$ra5)))
#qqnorm(ecu50@data$ra5)
#qqnorm(log(ecu50@data$ra5))

#regression
#my.model <- lm(ra5~ar5, data = ecu50)
#my.modell <- lm(log(ra5)~ar5, data = ecu50)

#lm.LMtests(my.model, continuity.listw, test = "all")
#lm.LMtests(my.modell, continuity.listw, test = "all")

#lm.morantest(my.model,continuity.listw)#p=0.8477
#moran.mc(resid(my.model),continuity.listw,999)
#p=0.984 no resid. sp str

#2014 normality?
#plot(density(ecu50@data$ra4))
#qqnorm(ecu50@data$ra4)

#regression
#my.model4 <- lm(ra4~ar4, data = ecu50)

#lm.LMtests(my.model4, continuity.listw, test = "all")

#	Lagrange multiplier diagnostics for spatial dependence
#data:  
#model: lm(formula = ra4 ~ ar4, data = ecu50)
#weights: continuity.listw

#lm.morantest(my.model4,continuity.listw)#p=0.656
#moran.mc(resid(my.model4),continuity.listw,999)
#p=0.678 no resid. sp str

#create variable of proportion
ecu50$pa4<-ecu50$ra4/100000
ecu50$pa5<-ecu50$ra5/100000


#logistic regression
#pa4, po4
lg4 <- glm(pa4~ar4,data = ecu50,family="binomial",weights=po4)

#spatial autocorrelation?
lm.LMtests(lg4, continuity.listw, test = "all")
moran.mc(resid(lg4),continuity.listw,999)#p=0.826

lg5 <- glm(pa5~ar5,data = ecu50,family="binomial",weights=po5)

lm.LMtests(lg5, continuity.listw, test = "all")
moran.mc(resid(lg5),continuity.listw,999)#0.82

resnb4 <- sapply(continuity.nb, function(x) mean(lg4$residuals[x]))
cor(lg4$residuals, resnb4)
## [1] -0.2814495
plot(lg4$residuals, resnb4, xlab='Residuals', ylab='Mean adjacent residuals')

resnb5 <- sapply(continuity.nb, function(x) mean(lg5$residuals[x]))
cor(lg5$residuals, resnb5)
## [1] -0.6212524
plot(lg5$residuals, resnb5, xlab='Residuals', ylab='Mean adjacent residuals')

#temperature in model
lg42 <- glm(pa4~agp4+t4,data = ecu50,family="binomial",weights=po4)

#spatial autocorrelation?
lm.LMtests(lg42, continuity.listw, test = "all")
moran.mc(resid(lg42),continuity.listw,999)#p=0.741

lg52 <- glm(pa5~agp5+t5,data = ecu50,family="binomial",weights=po5)

#spatial autocorrelation?
lm.LMtests(lg52, continuity.listw, test = "all")
moran.mc(resid(lg52),continuity.listw,999)#p=0.924

#########################################################
#X2010-X2015: working age adults (20-49)
#po0-po5 and tot10-tot15: total population
#no0.y-no5.y: CKD cases, ages ??
#a2014-a2015: employed
#
#
######################################################
fix<-ecu6@data
f12<-fix[1:23,c(1,62,50,58,35,41)]
f13<-fix[1:23,c(1,63,51,59,36,42)]
f14<-fix[1:23,c(1,64,52,60,37,43)]
f15<-fix[1:23,c(1,65,53,61,38,44)]
colnames(f12)<-c("prov","ag","po","ap","wp","ckd")
colnames(f13)<-c("prov","ag","po","ap","wp","ckd")
colnames(f14)<-c("prov","ag","po","ap","wp","ckd")
colnames(f15)<-c("prov","ag","po","ap","wp","ckd")
#ag prop, popn, agwork, workpopn, ckd

fix2<-rbind(f12,f13,f14,f15)
fix2$year<-c(rep("2012",23),rep("2013",23),rep("2014",23),rep("2015",23))
fix2$t<-c(ecu50@data$t2,ecu50@data$t3,ecu50@data$t4,ecu50@data$t5)
fix2$tx<-c(ecu50@data$t2x,ecu50@data$t3x,ecu50@data$t4x,ecu50@data$t5x)
fix2$pos<-fix2$po/100000

saveRDS(fix2,"fix2.RData")
fix2<-readRDS("fix2.RData")

#add some variables
fix2$wps<-fix2$wp/100000
fix2$rt<-fix2$ckd/fix2$wp
fix2$logwp<-log(fix2$wp)
elev<-cont.elev@data[,c(4,11)]
colnames(elev)<-c("prov","elev")
fix3<-merge(fix2,elev,"prov")
fix3$logwps<-log(fix3$wps)

saveRDS(fix3,"fix3.RData")
fix3<-readRDS("fix3.RData")

library(ggplot2)

#################mixed models
library(lme4)
plm<-glmer(ckd~ag+t+tx+(1|year),data=fix2,family="poisson",weights=pos)

#scaled population wts
plm2<-glmer(ckd~ag+t+tx+(1|year)+(1|prov),data=fix2,family="poisson",weights=pos)
#aic 5129 bic 5144

#scaled young popn wts
plm3<-glmer(ckd~ag+t+tx+(1|year)+(1|prov),data=fix2,family="poisson",weights=wps)
#aic 2225 bic 2240
summary(plm3)

#log young popn wts
plm4<-glmer(ckd~ag+t+tx+(1|year)+(1|prov)+offset(logwp),data=fix3,family="poisson")
#aic 709 bic 724
summary(plm4)

#log young popn wts with scaled elev
fix3$els<-fix3$elev/1000
plm5<-glmer(ckd~ag+t+tx+els+(1|year)+(1|prov)+offset(logwp),data=fix3,family="poisson")
#aic 711 bic 728 worse fit
summary(plm5)

fix3$ags<-fix3$ag*10
fix3$ts<-fix3$t/5
fix3$txs<-fix3$tx/5
ld<-read.csv("land.csv",header=TRUE)
ld2<-c(unlist(c(c(ld[1,2:5]),c(ld[2,2:5]),c(ld[3,2:5]),c(ld[4,2:5]),
            c(ld[6,2:5]),c(ld[5,2:5]),
              c(ld[7,2:5]),c(ld[8,2:5]),c(ld[9,2:5]),c(ld[10,2:5]),
            c(ld[11,2:5]),c(ld[12,2:5]),
                c(ld[13,2:5]),c(ld[14,2:5]),c(ld[15,2:5]),c(ld[21,2:5]),
            c(ld[16,2:5]),c(ld[17,2:5]),
                  c(ld[23,2:5]),c(ld[22,2:5]),c(ld[20,2:5]),c(ld[18,2:5]),
            c(ld[19,2:5]))))
fix4<-cbind(fix3,ld2)
fix4$tl<-rep(ld$tl,each=4)
fix4$lp<-fix4$ld2/fix4$tl
fix4$lps<-fix4$lp*10

#log young popn wts scaled ts and ag
plm5<-glmer(ckd~ags+ts+txs+(1|year)+(1|prov)+offset(logwp),data=fix3,family="poisson")
#aic 709 bic 724
summary(plm5)

#offset: per 100000 people
plm6<-glmer(ckd~ags+ts+txs+(1|year)+(1|prov)+offset(logwps),data=fix3,
            family="poisson")
#aic 709 bic 724
summary(plm6)

#cultivated land
plm7<-glmer(ckd~ags+ts+txs+els+lp+(1|year)+(1|prov)+offset(logwps),data=fix4,
            family="poisson")
#aic 710 bic 724
summary(plm7)

#Generalized linear mixed model fit by maximum likelihood (Laplace
#                                                          Approximation) [glmerMod]
#Family: poisson  ( log )
#Formula: ckd ~ ag + t + tx + (1 | year) + (1 | prov) + offset(logwp)
#Data: fix3
#
#AIC      BIC   logLik deviance df.resid 
#709.6    724.7   -348.8    697.6       86 
#
#Scaled residuals: 
#    Min      1Q  Median      3Q     Max 
#-3.1514 -0.9601 -0.0180  0.6996  2.7511 
#
#Random effects:
#    Groups Name        Variance Std.Dev.
#prov   (Intercept) 0.07741  0.2782  
#year   (Intercept) 0.03211  0.1792  
#Number of obs: 92, groups:  prov, 23; year, 4
#
#Fixed effects:
#    Estimate Std. Error z value Pr(>|z|)    
#(Intercept) -8.454678   0.432704 -19.539   <2e-16 ***
#    ag          -0.910876   0.393634  -2.314   0.0207 *  
#    t           -0.028696   0.016453  -1.744   0.0811 .  
#    tx           0.013670   0.009699   1.409   0.1587    
#---
#    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
#Correlation of Fixed Effects:
#    (Intr) ag     t     
#ag -0.373              
#t  -0.634  0.341       
#tx -0.361 -0.124 -0.442
#
confint(plm5)#rough estimate

#2.5 %      97.5 %
#    .sig01       0.196963927  0.406276226
#.sig02       0.097105507  0.448741316
#(Intercept) -9.314596552 -7.585892342
#ag          -1.679590276 -0.130675433
#t           -0.062796961  0.003566481
#tx          -0.005274406  0.032957613
plot(plm4)

#ts
fix3$res<-resid(plm5)
acf(fix3$res[1:4])
acf(fix3$res[5:8])
acf(fix3$res[9:12])
acf(fix3$res[13:17])
acf(fix3$res[18:21])
acf(fix3$res[22:25])
acf(fix3$res[26:29])
acf(fix3$res[30:33])
acf(fix3$res[34:38])
acf(fix3$res[39:42])
acf(fix3$res[43:46])
acf(fix3$res[47:50])
acf(fix3$res[51:54])
acf(fix3$res[55:58])
acf(fix3$res[59:62])

#residuals plots
ggplot(data.frame(eta=predict(plm4,type="link"),
                  pearson=residuals(plm4,type="pearson")),
       aes(x=eta,y=pearson)) +
    geom_point() +
    theme_bw()

ggplot(data.frame(x1=fix3$ag,pearson=residuals(plm4,type="pearson")),
       aes(x=x1,y=pearson)) +
    geom_point() +
    theme_bw()

ggplot(data.frame(x2=fix3$t,pearson=residuals(plm4,type="pearson")),
       aes(x=x2,y=pearson)) +
    geom_point() +
    theme_bw()

ggplot(data.frame(x3=fix3$tx,pearson=residuals(plm4,type="pearson")),
       aes(x=x3,y=pearson)) +
    geom_point() +
    theme_bw()

#independence of group means
means <- aggregate(fix3[,c("ag","t","tx")],by=list(fix3$prov,fix3$year),FUN=mean)
lmcoefs <- summary(lm(ckd~ag+t+tx+prov+year,data=fix3, weights=wps))$coefficients[,"Estimate"]
means$effects <- c(0,lmcoefs[substr(names(lmcoefs),1,4) == "prov"])
means$effects <- means$effects - mean(means$effects)

cor(means[,c("ag","t","tx","effects")])#moderate correlation of variables with group mean

ggplot(means, aes(x=ag,y=effects)) +
    geom_point() +
    theme_bw()

ggplot(means, aes(x=t,y=effects)) +
    geom_point() +
    theme_bw()

ggplot(means, aes(x=tx,y=effects)) +
    geom_point() +
    theme_bw()

#this may bias the extimate of the fixed effects
fixef(plm4)
lmcoefs[1:4]

#spatial residuals
ecu6@data$r2<-resid(plm6)[seq(1,89,4)]
ecu6@data$r3<-resid(plm6)[seq(2,90,4)]
ecu6@data$r4<-resid(plm6)[seq(3,91,4)]
ecu6@data$r5<-resid(plm6)[seq(4,92,4)]

spplot(ecu6,c("r2","r3","r4","r5"),
       cuts=8,col="transparent",as.table=TRUE,key.space="right",
       col.regions=(brewer.pal(9,"YlOrRd")),
       names.attr = c("2012","2013","2014","2015"))

#morans I
moran.test(ecu6$r2, continuity.listw)#p-value = 0.8362
moran.test(ecu6$r3, continuity.listw)#p-value = 0.2756
moran.test(ecu6$r4, continuity.listw)#p-value = 0.4398
moran.test(ecu6$r5, continuity.listw)#p-value = 0.8805

resnb <- sapply(continuity.nb, function(x) mean(resid(plm4)[x]))
cor(resid(plm4)[1:23], resnb)

#######confidence intervals with bootstrapping from IDRE
sampler <- function(dat, clustervar, replace = TRUE, reps = 1) {
    cid <- unique(dat[, clustervar[1]])
    ncid <- length(cid)
    recid <- sample(cid, size = ncid * reps, replace = TRUE)
    if (replace) {
        rid <- lapply(seq_along(recid), function(i) {
            cbind(NewID = i, RowID = sample(which(dat[, clustervar] == recid[i]),
                                            size = length(which(dat[, clustervar] == recid[i])), replace = TRUE))
        })
    } else {
        rid <- lapply(seq_along(recid), function(i) {
            cbind(NewID = i, RowID = which(dat[, clustervar] == recid[i]))
        })
    }
    dat <- as.data.frame(do.call(rbind, rid))
    dat$Replicate <- factor(cut(dat$NewID, breaks = c(1, ncid * 1:reps), include.lowest = TRUE,
                                labels = FALSE))
    dat$NewID <- factor(dat$NewID)
    return(dat)
}

#random sample of data
set.seed(1984)
tmp <- sampler(fix3, c("prov","year"), reps = 1000)
bigdata <- cbind(tmp, fix3[tmp$RowID, ])

library(parallel)
library(boot)
library(compiler)
f <- fixef(plm6)
r <- getME(plm6, "theta")
se <- sqrt(diag(vcov(plm6)))

cl <- makeCluster(4)
clusterExport(cl, c("bigdata", "f", "r"))
clusterEvalQ(cl, require(lme4))

myboot <- function(i) {
    object <- try(glmer(ckd~ags+ts+txs+(1|year)+(1|prov)+offset(logwps),
                        family="poisson", data = bigdata, subset = Replicate == i,
                        nAGQ = 1, start = list(fixef = f, theta = r)), silent = TRUE)
    if (class(object) == "try-error")
        return(object)
    c(fixef(object), getME(object, "theta"))
}

start <- proc.time()
res <- parLapplyLB(cl, X = levels(bigdata$Replicate), fun = myboot)
end <- proc.time()

# shut down the cluster
stopCluster(cl)

#find the runs that successfully fit a model
success <- sapply(res, is.numeric)
mean(success)#mean should be nonzero

bigres <- do.call(cbind, res[success])

# calculate 2.5th and 97.5th percentiles for 95% CI
(ci <- t(apply(bigres, 1, quantile, probs = c(0.025, 0.975))))

#have a look
finaltable <- cbind(Est = c(f, r), SE = c(se, NA,NA), BootMean = rowMeans(bigres),
                    ci)
# round and print
round(finaltable, 3)
round(exp(finaltable),2)

############################################make and visualize predictions
tmpdat <- fix3[, c("ckd", "ag", "t", "tx", "prov",
                  "year","logwp")]

jvalues <- with(fix3, seq(from = min(ag), to = max(ag), length.out = 100))

# calculate predicted probabilities and store in a list
biprobs <- lapply(unique(fix3$prov), function(stage) {
    tmpdat$prov[] <- stage
    lapply(jvalues, function(j) {
        tmpdat$ag <- j
        predict(plm4, newdata = tmpdat, type = "response")
    })
})

# get means and quartiles for all jvalues for each province
plotdat2 <- lapply(biprobs, function(X) {
    temp <- t(sapply(X, function(x) {
        c(M=mean(x), quantile(x, c(.25, .75)))
    }))
    temp <- as.data.frame(cbind(temp, jvalues))
#    colnames(temp) <- c("PredictedProbability", "Lower", "Upper", "AG")
    return(temp)
})

# collapse to one data frame
plotdat2 <- do.call(rbind, plotdat2)

# add province
plotdat2$prov <- factor(rep(unique(fix3$prov), each = length(jvalues)))

# show first few rows
head(plotdat2)

ggplot(plotdat2, aes(x = AG, y = PredictedProbability)) +
    geom_ribbon(aes(ymin = Lower, ymax = Upper, fill = prov), alpha = .15) +
    geom_line(aes(colour = prov), size = 2) +
    ylim(c(0, 60)) + facet_wrap(~  prov)






#2015
#SAR aic 129
mo.sar<-spautolm(rw5~er5,data=ecu40,listw=continuity.listw)
mo.sar<-spautolm(log(rw5)~er5,data=ecu40,listw=continuity.listw)
#38

#SAR popn wts aic 127
mp2.sar<-spautolm(rw5~er5,data=ecu40,listw=continuity.listw,
                  weights=X2015)
mp15.sar<-spautolm(log(rw5)~er5,data=ecu40,listw=continuity.listw,
                   weights=X2015)
#37

ecu40$sares<-resid(mo.sar)
ecu40$sarwes<-resid(mp2.sar)
spplot(ecu40,"sares",cuts=6,col="transparent",
       col.regions=(brewer.pal(7,"YlGnBu")))
spplot(ecu40,"sarwes",cuts=6,col="transparent",
       col.regions=(brewer.pal(7,"YlGnBu")))

moran.mc(resid(mp2.sar),continuity.listw,999)#p=0.636 no resid. sp str

#2014
#SAR
mo.sar<-spautolm(rw4~er4,data=ecu50,listw=continuity.listw)
#125.2

#SAR popn wts aic 127
mp14.sar<-spautolm(rw4~er4,data=ecu50,listw=continuity.listw,
                   weights=X2014)
#124.6
moran.mc(resid(mp14.sar),continuity.listw,999)#p=0.563 no resid. sp str

#2013 log
#SAR
mo.sar13<-spautolm(log(rw3)~er3,data=ecu50,listw=continuity.listw)
#45

#SAR popn wts
mp13.sar<-spautolm(log(rw3)~er3,data=ecu50,listw=continuity.listw,
                   weights=X2013)
#39
moran.mc(resid(mp13.sar),continuity.listw,999)#p=0.511 no resid. sp str

#2012
#SAR
mo.sar12<-spautolm(rw2~er2,data=ecu50,listw=continuity.listw)
#106.52

#SAR popn wt
mp12.sar<-spautolm(rw2~er2,data=ecu50,listw=continuity.listw,
                   weights=X2012)
#106.55
moran.mc(resid(mp14.sar),continuity.listw,999)#p=0.563 no resid. sp str

######################################comparison
library(ISwR)

data(eba1977)
cancer.data = eba1977

