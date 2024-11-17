##Predict low (1) or high-quality (5) nursing homes in the U.S
##Predict high-quality nursing homes in the US: High (5): 1, 0 otherwises

##PART 1: DATA SELECTION
#7,500 entries (cases/observations), 81 total columns (variables)

#Select variables: 
#Target: quality rating 5

subset1<-myData[,c("PROVNAME", "quality_rating", "BEDCERT", "RESTOT",
                   "TOTHRD", "incident_cnt", "cmplnt_cnt", "PAYDEN_CNT", "TOT_PENLTY_CNT"
                   ,"staffing_rating", "overall_rating", "survey_rating")]
View(subset1)
#Count the number of occurrences
table(myData$quality_rating) 
table(myData$overall_rating)

#Inspect missing value
missing_values<-colSums(is.na(subset1))
View(missing_values) ##return quality rating has missing value

length(missing_values[missing_values >0])

# Handle missing value using Omission Strategy -> Remove missing values
subset1[!complete.cases(subset1),]
omissionData<-na.omit(subset1)
View(omissionData)

#convert quality_rating to binary
omissionData$quality_rating<-ifelse(omissionData$quality_rating==5,1,0)
table(omissionData$quality_rating) #return 5-stars: 2282, else: 5007

subset2<-omissionData[,c("PROVNAME","quality_rating", "staffing_rating", "overall_rating", "survey_rating")]
View(subset2)

##PART 2:MODEL BUILDING - Classification model

##PART 3: MODEL COMPARISON AND 

















