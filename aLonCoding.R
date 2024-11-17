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

#subset2<-omissionData[,c("quality_rating", "staffing_rating", "overall_rating", "survey_rating")]

subset2<-omissionData[,c("quality_rating", "BEDCERT", "RESTOT", "TOT_PENLTY_CNT")]

View(subset2)

cor(subset2[,3:5])
##PART 2:MODEL BUILDING - Classification model

#k-Nearest neighbors
subset2STD<-scale(subset2[2:4])

subset2STD<-data.frame(subset2STD, subset2$quality_rating)
View(subset2STD)
colnames(subset2STD)[4]<-"quality_rating"

#convert target variable to categorical data type

subset2STD$quality_rating<-as.factor(subset2STD$quality_rating)

set.seed(1)
#partition the data into training and validation sets
myIndex<-createDataPartition(subset2$quality_rating, p=0.6, list=FALSE)
trainSet<-subset2[myIndex,]
validationSet<-subset2[-myIndex,]
View(trainSet)
View(validationSet)

#implement a 10-fold cross-validation 
myCtrl<-trainControl(method="cv", number=10)
myGrid<-expand.grid(.k=c(1:10))

set.seed(1)
#implement KNN method
KNN_fit<-train(quality_rating~., data=trainSet, method="knn", 
               trControl=myCtrl, tuneGrid=myGrid)
KNN_fit

#assess the performance of KNN model
KNN_Class<-predict(KNN_fit, newdata=validationSet)
#create confusion Matrix
confusionMatrix(KNN_Class, validationSet$quality_rating, positive = "1")

##PART 3: MODEL COMPARISON AND Selection

















