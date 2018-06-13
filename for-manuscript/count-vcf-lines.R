
"( for i in */*vcf*; do  echo $i `zcat $i |grep -v ^#|wc -l ` ; done ) 2>/dev/null >log2 "


a = read.table("log2",as=T)
a$pop = sub("/.*","",a[,1])
a$fn = sub(".*/","",a[,1])



# l=20:160
a[ a[,2] %in% l & a$pop == "CEU",]
a[ a[,2] %in% l & a$pop == "FIN",]
a[ a[,2] < 5 & a$pop == "FIN",]
a[1:10,]


  
z=reshape2::acast(a,fn~pop,value.var="V2")
q=apply(z,1,min)
q

not_ok = q < 10
f1 = rownames(z[  not_ok   ,1:5])
f1

to_remove = paste( sprintf("rm */%s",f1) )
to_remove
getwd()
for(i in to_remove) { print(i); system(i) ; }



