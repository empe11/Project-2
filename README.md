# Project-2

##. Data Inspection
###. Identify quantitative and qualititative variables

str(Project2)

quantitative_vars<- names(Project2)[sapply(Project2,is.numeric)]
qualitative_vars<- names(Project2)[sapply(Project2,function(x) is.factor(x) || is.character(x))]

