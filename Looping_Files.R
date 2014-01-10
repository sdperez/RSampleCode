path = "~/Documents/My Data/BRAZIL/Elections/"
out.file<-""
file.names <- dir(path, pattern =".txt")
for(i in 1:length(file.names)){
  file <- read.table(file.names[i],header=TRUE, sep=";", stringsAsFactors=FALSE)
  out.file <- rbind(out.file, file)
}
write.table(out.file, file = "cand_Brazil.txt",sep=";", 
            row.names = FALSE, qmethod = "double",fileEncoding="windows-1252")
