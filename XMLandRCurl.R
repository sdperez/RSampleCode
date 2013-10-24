##Examples of XML and RCURL use
library("RCurl")
library("XML")
# Get XML with number of hits
pub.esearch <- getURL("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&rettype=count&term=NSQIP")
pub.esearch <- xmlTreeParse(pub.esearch, asText = TRUE)#parsing the XML file so you can search it
pub.count <- as.numeric(xmlValue(pub.esearch[["doc"]][["eSearchResult"]][["Count"]]))#Extracts the count number from the XML file

#This next query does a more thorough download of the files (but only downloads the ids of the first 20 articles)
pub.esearch <- getURL("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=NSQIP")
pub.esearch <- xmlTreeParse(pub.esearch, asText = TRUE)
pub.IDs <- xmlValue(pub.esearch[["doc"]][["eSearchResult"]][["IdList"]])
#here, instead of looking up the count numbers I tried getting the IDs. It returned all the
#article IDs together in one line