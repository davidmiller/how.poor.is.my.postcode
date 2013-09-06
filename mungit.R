library(gdata)
lsoa.imd <- read.xls("/home/david/src/scratch/how.poor.is.my.postcode/1871524.xls", sheet=2)
pc.lsoa.lookup <- read.csv("/home/david/src/scratch/how.poor.is.my.postcode/PCD11_OA11_LSOA11_MSOA11_LAD11_EW_LU.csv")
pc.lsoa.lookup$LSOA.CODE <- pc.lsoa.lookup$LSOA11CD
pc.imd.lookup <- merge(pc.lsoa.lookup, lsoa.imd)
write.csv(pc.imd.lookup, file="/home/david/src/scratch/how.poor.is.my.postcode/pc.imd.lookup.csv")

wkc.pcs <- read.csv("/home/david/src/scratch/how.poor.is.my.postcode/w.c.k.csv")

wkc.pc.imd.lookup <- pc.imd.lookup[pc.imd.lookup$PCD7 %in% wkc.pcs[,1],]

write.csv(wkc.pc.imd.lookup, file="/home/david/src/scratch/how.poor.is.my.postcode/wkc.pc.imd.lookup.csv")