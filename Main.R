##. Data Inspection
###. Identify quantitative and qualititative variables

str(Project2)

quantitative_vars<- names(Project2)[sapply(Project2,is.numeric)]
qualitative_vars<- names(Project2)[sapply(Project2,function(x) is.factor(x) || is.character(x))]

###. inspect the columns for missing value

missing_values<-colSums(is.na(Project2))

missing_values[missing_values >0]

View(missing_values)