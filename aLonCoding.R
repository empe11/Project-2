##Predict low (1) or high-quality (5) nursing homes in the U.S
##Predict high-quality nursing homes in the US: High (5): 1, 0 otherwises

##PART 1: DATA SELECTION
#7,500 entries (cases/observations), 81 total columns (variables)

#Select variables: Provider name 
#Predictors: Number of Certified Beds (BEDCERT), Average Number of Residents per Day
#Target: quality rating (1 or 5)

subset1<-myData[,c("PROVNAME", "quality_rating", "BEDCERT", "RESTOT",
                   "TOTHRD", "incident_cnt", "cmplnt_cnt", "PAYDEN_CNT", "TOT_PENLTY_CNT"
                   ,"staffing_rating", "overall_rating", "staffing_rating")]
View(subset1)

table(myData$staffing_rating)
table(myData$overall_rating)
table(myData$staffing_rating)

##Inspect missing value
missing_values<-colSums(is.na(subset1))
View(missing_values) ##return quality rating has missing value

length(missing_values[missing_values >0])

subset1[!complete.cases(subset1), "quality_rating"]

##PART 2:MODEL BUILDING

##PART 3: MODEL COMPARISON AND 