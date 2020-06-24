N<-readline(prompt="Número decimal> ")
invisible(readLines(file("stdin"), 1))
M<-as.integer(N)
B=""
while(as.integer(M)>0){
  B<-paste(as.character(M%%2),B)
  M<-as.integer(M/2)
}
print(paste(as.character(N)," en binario es ",B))

