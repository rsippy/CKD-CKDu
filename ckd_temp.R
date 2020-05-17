setwd("C:/Users/remachines/Desktop/Machala/CKDu/Data")

al2014<-readRDS("al2014.RData")
al2015<-readRDS("al2015.RData")
al2012<-readRDS("al2012.RData")
al2013<-readRDS("al2013.RData")

#raster to province polygons
ecu1ng<-ecu1[-9,]

extract<-raster::extract #tell R that when I call extract, I'm talking about the raster function

#get mean elevation of provinces
ele<-myfiles[[1]]#cleanclim file
z1 <- aggregate(ele, fact=20, fun=mean, expand=TRUE)
cont.elev <- extract(z1, ecu1ng, fun=mean, sp=TRUE) 

plot(cont.elev)

# extract OC shapefile from the larger county dataset
ec_01<-ecu1ng[ecu1ng$CC_1 == "01",]
ec_02<-ecu1ng[ecu1ng$CC_1 == "02",]
ec_03<-ecu1ng[ecu1ng$CC_1 == "03",]
ec_04<-ecu1ng[ecu1ng$CC_1 == "04",]
ec_05<-ecu1ng[ecu1ng$CC_1 == "05",]
ec_06<-ecu1ng[ecu1ng$CC_1 == "06",]
ec_07<-ecu1ng[ecu1ng$CC_1 == "07",]
ec_08<-ecu1ng[ecu1ng$CC_1 == "08",]
ec_10<-ecu1ng[ecu1ng$CC_1 == "10",]
ec_11<-ecu1ng[ecu1ng$CC_1 == "11",]
ec_12<-ecu1ng[ecu1ng$CC_1 == "12",]
ec_13<-ecu1ng[ecu1ng$CC_1 == "13",]
ec_14<-ecu1ng[ecu1ng$CC_1 == "14",]
ec_15<-ecu1ng[ecu1ng$CC_1 == "15",]
ec_16<-ecu1ng[ecu1ng$CC_1 == "16",]
ec_17<-ecu1ng[ecu1ng$CC_1 == "17",]
ec_18<-ecu1ng[ecu1ng$CC_1 == "18",]
ec_19<-ecu1ng[ecu1ng$CC_1 == "19",]
ec_09<-ecu1ng[ecu1ng$CC_1 == "09",]
ec_21<-ecu1ng[ecu1ng$CC_1 == "21",]
ec_22<-ecu1ng[ecu1ng$CC_1 == "22",]
ec_23<-ecu1ng[ecu1ng$CC_1 == "23",]
ec_24<-ecu1ng[ecu1ng$CC_1 == "24",]

# extract all pixels values for this county
ec_01a <- extract(al2014,ec_01,na.rm=T,df=T)  # may take a second
ec_02a <- extract(al2014,ec_02,na.rm=T,df=T)  # may take a second
ec_03a <- extract(al2014,ec_03,na.rm=T,df=T)  # may take a second
ec_04a <- extract(al2014,ec_04,na.rm=T,df=T)  # may take a second
ec_05a <- extract(al2014,ec_05,na.rm=T,df=T)  # may take a second
ec_06a <- extract(al2014,ec_06,na.rm=T,df=T)  # may take a second
ec_07a <- extract(al2014,ec_07,na.rm=T,df=T)  # may take a second
ec_08a <- extract(al2014,ec_08,na.rm=T,df=T)  # may take a second
ec_10a <- extract(al2014,ec_10,na.rm=T,df=T)  # may take a second
ec_11a <- extract(al2014,ec_11,na.rm=T,df=T)  # may take a second
ec_12a <- extract(al2014,ec_12,na.rm=T,df=T)  # may take a second
ec_13a <- extract(al2014,ec_13,na.rm=T,df=T)  # may take a second
ec_14a <- extract(al2014,ec_14,na.rm=T,df=T)  # may take a second
ec_15a <- extract(al2014,ec_15,na.rm=T,df=T)  # may take a second
ec_16a <- extract(al2014,ec_16,na.rm=T,df=T)  # may take a second
ec_17a <- extract(al2014,ec_17,na.rm=T,df=T)  # may take a second
ec_18a <- extract(al2014,ec_18,na.rm=T,df=T)  # may take a second
ec_19a <- extract(al2014,ec_19,na.rm=T,df=T)  # may take a second
ec_09a <- extract(al2014,ec_09,na.rm=T,df=T)  # may take a second
ec_21a <- extract(al2014,ec_21,na.rm=T,df=T)  # may take a second
ec_22a <- extract(al2014,ec_22,na.rm=T,df=T)  # may take a second
ec_23a <- extract(al2014,ec_23,na.rm=T,df=T)  # may take a second
ec_24a <- extract(al2014,ec_24,na.rm=T,df=T)  # may take a second

ec_01c <- extract(al2015,ec_01,na.rm=T,df=T)  # may take a second
ec_02c <- extract(al2015,ec_02,na.rm=T,df=T)  # may take a second
ec_03c <- extract(al2015,ec_03,na.rm=T,df=T)  # may take a second
ec_04c <- extract(al2015,ec_04,na.rm=T,df=T)  # may take a second
ec_05c <- extract(al2015,ec_05,na.rm=T,df=T)  # may take a second
ec_06c <- extract(al2015,ec_06,na.rm=T,df=T)  # may take a second
ec_07c <- extract(al2015,ec_07,na.rm=T,df=T)  # may take a second
ec_08c <- extract(al2015,ec_08,na.rm=T,df=T)  # may take a second
ec_10c <- extract(al2015,ec_10,na.rm=T,df=T)  # may take a second
ec_11c <- extract(al2015,ec_11,na.rm=T,df=T)  # may take a second
ec_12c <- extract(al2015,ec_12,na.rm=T,df=T)  # may take a second
ec_13c <- extract(al2015,ec_13,na.rm=T,df=T)  # may take a second
ec_14c <- extract(al2015,ec_14,na.rm=T,df=T)  # may take a second
ec_15c <- extract(al2015,ec_15,na.rm=T,df=T)  # may take a second
ec_16c <- extract(al2015,ec_16,na.rm=T,df=T)  # may take a second
ec_17c <- extract(al2015,ec_17,na.rm=T,df=T)  # may take a second
ec_18c <- extract(al2015,ec_18,na.rm=T,df=T)  # may take a second
ec_19c <- extract(al2015,ec_19,na.rm=T,df=T)  # may take a second
ec_09c <- extract(al2015,ec_09,na.rm=T,df=T)  # may take a second
ec_21c <- extract(al2015,ec_21,na.rm=T,df=T)  # may take a second
ec_22c <- extract(al2015,ec_22,na.rm=T,df=T)  # may take a second
ec_23c <- extract(al2015,ec_23,na.rm=T,df=T)  # may take a second
ec_24c <- extract(al2015,ec_24,na.rm=T,df=T)  # may take a second

ec_01d <- extract(al2012,ec_01,na.rm=T,df=T)  # may take a second
ec_02d <- extract(al2012,ec_02,na.rm=T,df=T)  # may take a second
ec_03d <- extract(al2012,ec_03,na.rm=T,df=T)  # may take a second
ec_04d <- extract(al2012,ec_04,na.rm=T,df=T)  # may take a second
ec_05d <- extract(al2012,ec_05,na.rm=T,df=T)  # may take a second
ec_06d <- extract(al2012,ec_06,na.rm=T,df=T)  # may take a second
ec_07d <- extract(al2012,ec_07,na.rm=T,df=T)  # may take a second
ec_08d <- extract(al2012,ec_08,na.rm=T,df=T)  # may take a second
ec_10d <- extract(al2012,ec_10,na.rm=T,df=T)  # may take a second
ec_11d <- extract(al2012,ec_11,na.rm=T,df=T)  # may take a second
ec_12d <- extract(al2012,ec_12,na.rm=T,df=T)  # may take a second
ec_13d <- extract(al2012,ec_13,na.rm=T,df=T)  # may take a second
ec_14d <- extract(al2012,ec_14,na.rm=T,df=T)  # may take a second
ec_15d <- extract(al2012,ec_15,na.rm=T,df=T)  # may take a second
ec_16d <- extract(al2012,ec_16,na.rm=T,df=T)  # may take a second
ec_17d <- extract(al2012,ec_17,na.rm=T,df=T)  # may take a second
ec_18d <- extract(al2012,ec_18,na.rm=T,df=T)  # may take a second
ec_19d <- extract(al2012,ec_19,na.rm=T,df=T)  # may take a second
ec_09d <- extract(al2012,ec_09,na.rm=T,df=T)  # may take a second
ec_21d <- extract(al2012,ec_21,na.rm=T,df=T)  # may take a second
ec_22d <- extract(al2012,ec_22,na.rm=T,df=T)  # may take a second
ec_23d <- extract(al2012,ec_23,na.rm=T,df=T)  # may take a second
ec_24d <- extract(al2012,ec_24,na.rm=T,df=T)  # may take a second

ec_01e <- extract(al2013,ec_01,na.rm=T,df=T)  # may take a second
ec_02e <- extract(al2013,ec_02,na.rm=T,df=T)  # may take a second
ec_03e <- extract(al2013,ec_03,na.rm=T,df=T)  # may take a second
ec_04e <- extract(al2013,ec_04,na.rm=T,df=T)  # may take a second
ec_05e <- extract(al2013,ec_05,na.rm=T,df=T)  # may take a second
ec_06e <- extract(al2013,ec_06,na.rm=T,df=T)  # may take a second
ec_07e <- extract(al2013,ec_07,na.rm=T,df=T)  # may take a second
ec_08e <- extract(al2013,ec_08,na.rm=T,df=T)  # may take a second
ec_10e <- extract(al2013,ec_10,na.rm=T,df=T)  # may take a second
ec_11e <- extract(al2013,ec_11,na.rm=T,df=T)  # may take a second
ec_12e <- extract(al2013,ec_12,na.rm=T,df=T)  # may take a second
ec_13e <- extract(al2013,ec_13,na.rm=T,df=T)  # may take a second
ec_14e <- extract(al2013,ec_14,na.rm=T,df=T)  # may take a second
ec_15e <- extract(al2013,ec_15,na.rm=T,df=T)  # may take a second
ec_16e <- extract(al2013,ec_16,na.rm=T,df=T)  # may take a second
ec_17e <- extract(al2013,ec_17,na.rm=T,df=T)  # may take a second
ec_18e <- extract(al2013,ec_18,na.rm=T,df=T)  # may take a second
ec_19e <- extract(al2013,ec_19,na.rm=T,df=T)  # may take a second
ec_09e <- extract(al2013,ec_09,na.rm=T,df=T)  # may take a second
ec_21e <- extract(al2013,ec_21,na.rm=T,df=T)  # may take a second
ec_22e <- extract(al2013,ec_22,na.rm=T,df=T)  # may take a second
ec_23e <- extract(al2013,ec_23,na.rm=T,df=T)  # may take a second
ec_24e <- extract(al2013,ec_24,na.rm=T,df=T)  # may take a second

ec_01b<-max(ec_01a$layer,na.rm=T)
ec_02b<-max(ec_02a$layer,na.rm=T)
ec_03b<-max(ec_03a$layer,na.rm=T)
ec_04b<-max(ec_04a$layer,na.rm=T)
ec_05b<-max(ec_05a$layer,na.rm=T)
ec_06b<-max(ec_06a$layer,na.rm=T)
ec_07b<-max(ec_07a$layer,na.rm=T)
ec_08b<-max(ec_08a$layer,na.rm=T)
ec_09b<-max(ec_09a$layer,na.rm=T)
ec_10b<-max(ec_10a$layer,na.rm=T)
ec_11b<-max(ec_11a$layer,na.rm=T)
ec_12b<-max(ec_12a$layer,na.rm=T)
ec_13b<-max(ec_13a$layer,na.rm=T)
ec_14b<-max(ec_14a$layer,na.rm=T)
ec_15b<-max(ec_15a$layer,na.rm=T)
ec_16b<-max(ec_16a$layer,na.rm=T)
ec_17b<-max(ec_17a$layer,na.rm=T)
ec_18b<-max(ec_18a$layer,na.rm=T)
ec_19b<-max(ec_19a$layer,na.rm=T)
ec_21b<-max(ec_21a$layer,na.rm=T)
ec_22b<-max(ec_22a$layer,na.rm=T)
ec_23b<-max(ec_23a$layer,na.rm=T)
ec_24b<-max(ec_24a$layer,na.rm=T)

ec_01g<-max(ec_01c$layer,na.rm=T)
ec_02g<-max(ec_02c$layer,na.rm=T)
ec_03g<-max(ec_03c$layer,na.rm=T)
ec_04g<-max(ec_04c$layer,na.rm=T)
ec_05g<-max(ec_05c$layer,na.rm=T)
ec_06g<-max(ec_06c$layer,na.rm=T)
ec_07g<-max(ec_07c$layer,na.rm=T)
ec_08g<-max(ec_08c$layer,na.rm=T)
ec_09g<-max(ec_09c$layer,na.rm=T)
ec_10g<-max(ec_10c$layer,na.rm=T)
ec_11g<-max(ec_11c$layer,na.rm=T)
ec_12g<-max(ec_12c$layer,na.rm=T)
ec_13g<-max(ec_13c$layer,na.rm=T)
ec_14g<-max(ec_14c$layer,na.rm=T)
ec_15g<-max(ec_15c$layer,na.rm=T)
ec_16g<-max(ec_16c$layer,na.rm=T)
ec_17g<-max(ec_17c$layer,na.rm=T)
ec_18g<-max(ec_18c$layer,na.rm=T)
ec_19g<-max(ec_19c$layer,na.rm=T)
ec_21g<-max(ec_21c$layer,na.rm=T)
ec_22g<-max(ec_22c$layer,na.rm=T)
ec_23g<-max(ec_23c$layer,na.rm=T)
ec_24g<-max(ec_24c$layer,na.rm=T)

ec_01h<-max(ec_01d$layer,na.rm=T)
ec_02h<-max(ec_02d$layer,na.rm=T)
ec_03h<-max(ec_03d$layer,na.rm=T)
ec_04h<-max(ec_04d$layer,na.rm=T)
ec_05h<-max(ec_05d$layer,na.rm=T)
ec_06h<-max(ec_06d$layer,na.rm=T)
ec_07h<-max(ec_07d$layer,na.rm=T)
ec_08h<-max(ec_08d$layer,na.rm=T)
ec_09h<-max(ec_09d$layer,na.rm=T)
ec_10h<-max(ec_10d$layer,na.rm=T)
ec_11h<-max(ec_11d$layer,na.rm=T)
ec_12h<-max(ec_12d$layer,na.rm=T)
ec_13h<-max(ec_13d$layer,na.rm=T)
ec_14h<-max(ec_14d$layer,na.rm=T)
ec_15h<-max(ec_15d$layer,na.rm=T)
ec_16h<-max(ec_16d$layer,na.rm=T)
ec_17h<-max(ec_17d$layer,na.rm=T)
ec_18h<-max(ec_18d$layer,na.rm=T)
ec_19h<-max(ec_19d$layer,na.rm=T)
ec_21h<-max(ec_21d$layer,na.rm=T)
ec_22h<-max(ec_22d$layer,na.rm=T)
ec_23h<-max(ec_23d$layer,na.rm=T)
ec_24h<-max(ec_24d$layer,na.rm=T)

ec_01f<-max(ec_01e$layer,na.rm=T)
ec_02f<-max(ec_02e$layer,na.rm=T)
ec_03f<-max(ec_03e$layer,na.rm=T)
ec_04f<-max(ec_04e$layer,na.rm=T)
ec_05f<-max(ec_05e$layer,na.rm=T)
ec_06f<-max(ec_06e$layer,na.rm=T)
ec_07f<-max(ec_07e$layer,na.rm=T)
ec_08f<-max(ec_08e$layer,na.rm=T)
ec_09f<-max(ec_09e$layer,na.rm=T)
ec_10f<-max(ec_10e$layer,na.rm=T)
ec_11f<-max(ec_11e$layer,na.rm=T)
ec_12f<-max(ec_12e$layer,na.rm=T)
ec_13f<-max(ec_13e$layer,na.rm=T)
ec_14f<-max(ec_14e$layer,na.rm=T)
ec_15f<-max(ec_15e$layer,na.rm=T)
ec_16f<-max(ec_16e$layer,na.rm=T)
ec_17f<-max(ec_17e$layer,na.rm=T)
ec_18f<-max(ec_18e$layer,na.rm=T)
ec_19f<-max(ec_19e$layer,na.rm=T)
ec_21f<-max(ec_21e$layer,na.rm=T)
ec_22f<-max(ec_22e$layer,na.rm=T)
ec_23f<-max(ec_23e$layer,na.rm=T)
ec_24f<-max(ec_24e$layer,na.rm=T)

#12: d,h
#13: e,f
#14: a,b
#15: c,g

ec_01bx<-max(ec_01a$layer,na.rm=T)
ec_02bx<-max(ec_02a$layer,na.rm=T)
ec_03bx<-max(ec_03a$layer,na.rm=T)
ec_04bx<-max(ec_04a$layer,na.rm=T)
ec_05bx<-max(ec_05a$layer,na.rm=T)
ec_06bx<-max(ec_06a$layer,na.rm=T)
ec_07bx<-max(ec_07a$layer,na.rm=T)
ec_08bx<-max(ec_08a$layer,na.rm=T)
ec_09bx<-max(ec_09a$layer,na.rm=T)
ec_10bx<-max(ec_10a$layer,na.rm=T)
ec_11bx<-max(ec_11a$layer,na.rm=T)
ec_12bx<-max(ec_12a$layer,na.rm=T)
ec_13bx<-max(ec_13a$layer,na.rm=T)
ec_14bx<-max(ec_14a$layer,na.rm=T)
ec_15bx<-max(ec_15a$layer,na.rm=T)
ec_16bx<-max(ec_16a$layer,na.rm=T)
ec_17bx<-max(ec_17a$layer,na.rm=T)
ec_18bx<-max(ec_18a$layer,na.rm=T)
ec_19bx<-max(ec_19a$layer,na.rm=T)
ec_21bx<-max(ec_21a$layer,na.rm=T)
ec_22bx<-max(ec_22a$layer,na.rm=T)
ec_23bx<-max(ec_23a$layer,na.rm=T)
ec_24bx<-max(ec_24a$layer,na.rm=T)

ec_01gx<-max(ec_01c$layer,na.rm=T)
ec_02gx<-max(ec_02c$layer,na.rm=T)
ec_03gx<-max(ec_03c$layer,na.rm=T)
ec_04gx<-max(ec_04c$layer,na.rm=T)
ec_05gx<-max(ec_05c$layer,na.rm=T)
ec_06gx<-max(ec_06c$layer,na.rm=T)
ec_07gx<-max(ec_07c$layer,na.rm=T)
ec_08gx<-max(ec_08c$layer,na.rm=T)
ec_09gx<-max(ec_09c$layer,na.rm=T)
ec_10gx<-max(ec_10c$layer,na.rm=T)
ec_11gx<-max(ec_11c$layer,na.rm=T)
ec_12gx<-max(ec_12c$layer,na.rm=T)
ec_13gx<-max(ec_13c$layer,na.rm=T)
ec_14gx<-max(ec_14c$layer,na.rm=T)
ec_15gx<-max(ec_15c$layer,na.rm=T)
ec_16gx<-max(ec_16c$layer,na.rm=T)
ec_17gx<-max(ec_17c$layer,na.rm=T)
ec_18gx<-max(ec_18c$layer,na.rm=T)
ec_19gx<-max(ec_19c$layer,na.rm=T)
ec_21gx<-max(ec_21c$layer,na.rm=T)
ec_22gx<-max(ec_22c$layer,na.rm=T)
ec_23gx<-max(ec_23c$layer,na.rm=T)
ec_24gx<-max(ec_24c$layer,na.rm=T)

ec_01hx<-max(ec_01d$layer,na.rm=T)
ec_02hx<-max(ec_02d$layer,na.rm=T)
ec_03hx<-max(ec_03d$layer,na.rm=T)
ec_04hx<-max(ec_04d$layer,na.rm=T)
ec_05hx<-max(ec_05d$layer,na.rm=T)
ec_06hx<-max(ec_06d$layer,na.rm=T)
ec_07hx<-max(ec_07d$layer,na.rm=T)
ec_08hx<-max(ec_08d$layer,na.rm=T)
ec_09hx<-max(ec_09d$layer,na.rm=T)
ec_10hx<-max(ec_10d$layer,na.rm=T)
ec_11hx<-max(ec_11d$layer,na.rm=T)
ec_12hx<-max(ec_12d$layer,na.rm=T)
ec_13hx<-max(ec_13d$layer,na.rm=T)
ec_14hx<-max(ec_14d$layer,na.rm=T)
ec_15hx<-max(ec_15d$layer,na.rm=T)
ec_16hx<-max(ec_16d$layer,na.rm=T)
ec_17hx<-max(ec_17d$layer,na.rm=T)
ec_18hx<-max(ec_18d$layer,na.rm=T)
ec_19hx<-max(ec_19d$layer,na.rm=T)
ec_21hx<-max(ec_21d$layer,na.rm=T)
ec_22hx<-max(ec_22d$layer,na.rm=T)
ec_23hx<-max(ec_23d$layer,na.rm=T)
ec_24hx<-max(ec_24d$layer,na.rm=T)

ec_01fx<-max(ec_01e$layer,na.rm=T)
ec_02fx<-max(ec_02e$layer,na.rm=T)
ec_03fx<-max(ec_03e$layer,na.rm=T)
ec_04fx<-max(ec_04e$layer,na.rm=T)
ec_05fx<-max(ec_05e$layer,na.rm=T)
ec_06fx<-max(ec_06e$layer,na.rm=T)
ec_07fx<-max(ec_07e$layer,na.rm=T)
ec_08fx<-max(ec_08e$layer,na.rm=T)
ec_09fx<-max(ec_09e$layer,na.rm=T)
ec_10fx<-max(ec_10e$layer,na.rm=T)
ec_11fx<-max(ec_11e$layer,na.rm=T)
ec_12fx<-max(ec_12e$layer,na.rm=T)
ec_13fx<-max(ec_13e$layer,na.rm=T)
ec_14fx<-max(ec_14e$layer,na.rm=T)
ec_15fx<-max(ec_15e$layer,na.rm=T)
ec_16fx<-max(ec_16e$layer,na.rm=T)
ec_17fx<-max(ec_17e$layer,na.rm=T)
ec_18fx<-max(ec_18e$layer,na.rm=T)
ec_19fx<-max(ec_19e$layer,na.rm=T)
ec_21fx<-max(ec_21e$layer,na.rm=T)
ec_22fx<-max(ec_22e$layer,na.rm=T)
ec_23fx<-max(ec_23e$layer,na.rm=T)
ec_24fx<-max(ec_24e$layer,na.rm=T)

t5<-c(ec_01g,ec_02g,ec_03g,ec_04g,ec_06g,ec_05g,ec_07g,ec_08g,
      ec_09g,ec_10g,ec_11g,ec_12g,ec_13g,ec_14g,ec_15g,ec_22g,
      ec_16g,ec_17g,ec_24g,ec_23g,ec_21g,ec_18g,ec_19g)
t2<-c(ec_01h,ec_02h,ec_03h,ec_04h,ec_06h,ec_05h,ec_07h,ec_08h,
      ec_09h,ec_10h,ec_11h,ec_12h,ec_13h,ec_14h,ec_15h,ec_22h,
      ec_16h,ec_17h,ec_24h,ec_23h,ec_21h,ec_18h,ec_19h)
t4<-c(ec_01b,ec_02b,ec_03b,ec_04b,ec_06b,ec_05b,ec_07b,ec_08b,
      ec_09b,ec_10b,ec_11b,ec_12b,ec_13b,ec_14b,ec_15b,ec_22b,
      ec_16b,ec_17b,ec_24b,ec_23b,ec_21b,ec_18b,ec_19b)
t3<-c(ec_01f,ec_02f,ec_03f,ec_04f,ec_06f,ec_05f,ec_07f,ec_08f,
      ec_09f,ec_10f,ec_11f,ec_12f,ec_13f,ec_14f,ec_15f,ec_22f,
      ec_16f,ec_17f,ec_24f,ec_23f,ec_21f,ec_18f,ec_19f)
tm<-data.frame(cbind(t2,t3,t4,t5))

t5x<-c(ec_01gx,ec_02gx,ec_03gx,ec_04gx,ec_06gx,ec_05gx,ec_07gx,ec_08gx,
      ec_09gx,ec_10gx,ec_11gx,ec_12gx,ec_13gx,ec_14gx,ec_15gx,ec_22gx,
      ec_16gx,ec_17gx,ec_24gx,ec_23gx,ec_21gx,ec_18gx,ec_19gx)
t2x<-c(ec_01hx,ec_02hx,ec_03hx,ec_04hx,ec_06hx,ec_05hx,ec_07hx,ec_08hx,
      ec_09hx,ec_10hx,ec_11hx,ec_12hx,ec_13hx,ec_14hx,ec_15hx,ec_22hx,
      ec_16hx,ec_17hx,ec_24hx,ec_23hx,ec_21hx,ec_18hx,ec_19hx)
t4x<-c(ec_01bx,ec_02bx,ec_03bx,ec_04bx,ec_06bx,ec_05bx,ec_07bx,ec_08bx,
      ec_09bx,ec_10bx,ec_11bx,ec_12bx,ec_13bx,ec_14bx,ec_15bx,ec_22bx,
      ec_16bx,ec_17bx,ec_24bx,ec_23bx,ec_21bx,ec_18bx,ec_19bx)
t3x<-c(ec_01fx,ec_02fx,ec_03fx,ec_04f,ec_06fx,ec_05fx,ec_07fx,ec_08fx,
      ec_09fx,ec_10fx,ec_11fx,ec_12f,ec_13fx,ec_14fx,ec_15fx,ec_22fx,
      ec_16fx,ec_17fx,ec_24fx,ec_23f,ec_21fx,ec_18fx,ec_19fx)
tmx<-data.frame(cbind(t2x,t3x,t4x,t5x))

ecu50$t4<-tm$t4
ecu50$t5<-tm$t5
ecu50$t3<-tm$t3
ecu50$t2<-tm$t2
ecu50$t4x<-tmx$t4x
ecu50$t5x<-tmx$t5x
ecu50$t2x<-tmx$t2x
ecu50$t3x<-tmx$t3x

spplot(ecu50,"t4")

saveRDS(ecu50,"ecu50.RData")


ec_01e <- extract(ele,ec_01,na.rm=T,df=T)  # may take a second
ec_02e <- extract(ele,ec_02,na.rm=T,df=T)  # may take a second
ec_03e <- extract(ele,ec_03,na.rm=T,df=T)  # may take a second
ec_04e <- extract(ele,ec_04,na.rm=T,df=T)  # may take a second
ec_05e <- extract(ele,ec_05,na.rm=T,df=T)  # may take a second
ec_06e <- extract(ele,ec_06,na.rm=T,df=T)  # may take a second
ec_07e <- extract(ele,ec_07,na.rm=T,df=T)  # may take a second
ec_08e <- extract(ele,ec_08,na.rm=T,df=T)  # may take a second
ec_10e <- extract(ele,ec_10,na.rm=T,df=T)  # may take a second
ec_11e <- extract(ele,ec_11,na.rm=T,df=T)  # may take a second
ec_12e <- extract(ele,ec_12,na.rm=T,df=T)  # may take a second
ec_13e <- extract(ele,ec_13,na.rm=T,df=T)  # may take a second
ec_14e <- extract(ele,ec_14,na.rm=T,df=T)  # may take a second
ec_15e <- extract(ele,ec_15,na.rm=T,df=T)  # may take a second
ec_16e <- extract(ele,ec_16,na.rm=T,df=T)  # may take a second
ec_17e <- extract(ele,ec_17,na.rm=T,df=T)  # may take a second
ec_18e <- extract(ele,ec_18,na.rm=T,df=T)  # may take a second
ec_19e <- extract(ele,ec_19,na.rm=T,df=T)  # may take a second
ec_09e <- extract(ele,ec_09,na.rm=T,df=T)  # may take a second
ec_21e <- extract(ele,ec_21,na.rm=T,df=T)  # may take a second
ec_22e <- extract(ele,ec_22,na.rm=T,df=T)  # may take a second
ec_23e <- extract(ele,ec_23,na.rm=T,df=T)  # may take a second
ec_24e <- extract(ele,ec_24,na.rm=T,df=T)  # may take a second

ec_01b<-max(ec_01a$layer,na.rm=T)
ec_02b<-max(ec_02a$layer,na.rm=T)
ec_03b<-max(ec_03a$layer,na.rm=T)
ec_04b<-max(ec_04a$layer,na.rm=T)
ec_05b<-max(ec_05a$layer,na.rm=T)
ec_06b<-max(ec_06a$layer,na.rm=T)
ec_07b<-max(ec_07a$layer,na.rm=T)
ec_08b<-max(ec_08a$layer,na.rm=T)
ec_09b<-max(ec_09a$layer,na.rm=T)
ec_10b<-max(ec_10a$layer,na.rm=T)
ec_11b<-max(ec_11a$layer,na.rm=T)
ec_12b<-max(ec_12a$layer,na.rm=T)
ec_13b<-max(ec_13a$layer,na.rm=T)
ec_14b<-max(ec_14a$layer,na.rm=T)
ec_15b<-max(ec_15a$layer,na.rm=T)
ec_16b<-max(ec_16a$layer,na.rm=T)
ec_17b<-max(ec_17a$layer,na.rm=T)
ec_18b<-max(ec_18a$layer,na.rm=T)
ec_19b<-max(ec_19a$layer,na.rm=T)
ec_21b<-max(ec_21a$layer,na.rm=T)
ec_22b<-max(ec_22a$layer,na.rm=T)
ec_23b<-max(ec_23a$layer,na.rm=T)
ec_24b<-max(ec_24a$layer,na.rm=T)

