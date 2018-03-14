


f1 = "for i in *; do echo $i `zcat $i|grep -v ^#|wc -l ` ; done > /tmp/t1"
setwd("pop1")

system(f1)

v1 = read.table("/tmp/t1",as=T)
setwd("../..")

setwd("pop2/")

system(f1)

v2 = read.table("/tmp/t1",as=T)

setwd("..")
m = merge(v1,v2,by=1)

s = which(m[,2] < 15 | m[,3] < 15)

getwd()


cmd1 = ( sprintf("pop1/%s",m[s,1]) )
system(sprintf("rm %s",paste(cmd1, collapse=" ") ))

cmd1 = ( sprintf("pop2/%s",m[s,1]) )
system(sprintf("rm %s",paste(cmd1, collapse=" ") ))
