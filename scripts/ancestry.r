library(data.table)
library(dplyr)
library(ggplot2)

a <- fread("../data/ukb_sqc_v2.txt", he=FALSE)
b <- fread("../data/ukb878_imp_chr10_v2_s487406.sample", he=FALSE, skip=2)

a <- subset(a, V66 == 1)

index <- a$V26 > (a$V27 * 0.5 + 45)
table(index)
ggplot(a, aes(V27, V26)) +
geom_point(aes(colour=index)) +
geom_abline(intercept=45, slope=0.5)

# Assume that the order of b is the same as a after exclusions removed

write.table(b$V1[index], file="../data/non_europeans.txt", row=F, col=F, qu=F)
write.table(b$V1[!index], file="../data/europeans.txt", row=F, col=F, qu=F)



