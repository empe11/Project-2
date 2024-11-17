##Predict low (1) or high-quality (5) nursing homes in the U.S

##PART 1: DATA SELECTION
#7,500 entries (cases/observations), 81 total columns (variables)

#Select variables: Provider name 
#Predictors: Number of Certified Beds (BEDCERT), Average Number of Residents per Day
#Target: quality rating (1 or 5)

subset1<-myData[,c("PROVNAME", "quality_rating", "BEDCERT", "RESTOT", 
                   "CCRC_FACIL", "CHOW_LAST_12MOS",
                   "TOTHRD", "incident_cnt", "cmplnt_cnt", 
                   "PAYDEN_CNT", "TOT_PENLTY_CNT")]

View(subset1)

plot(subset1$quality_rating~subset1$TOTHRD, main="Scatterplot of quality Against Income", 
     xlab="complain", ylab="quality", col="chocolate", pch=16)

table(myData$quality_rating)

missing_values<-colSums(is.na(myData))
View(missing_values)

length(missing_values[missing_values >0])


##PART 2:MODEL BUILDING

##PART 3: MODEL COMPARISON AND 