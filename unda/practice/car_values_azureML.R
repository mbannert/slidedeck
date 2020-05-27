library(AzureML)
load("data/renaults.RData")

rpm <- lm(Price ~ Kilometers + Age,
     data = renault)

car_scorer <- function(newdata)
{
  out <- predict.lm(rpm,newdata)
  out  
}

# generate Azure Workspace object
ws <- workspace(
  id = "aa62497c09ab40d9bdf4b7b418a1ccf0",
  auth = "eCsf9Gs7wR8N9Vc0ERd2Dg55mhDQsShCX0VbvLB9OBy4Tyd0A7QgR4RS2k9exFGkZtJjFtYu9jweS2ZhetwEnQ=="
)

# run the model locally
car_scorer(data.frame("Price" = 0,
                      "Kilometers" = 50000,
                      "Age" = 365,
                      stringsAsFactors = F))

# push the model to Azures Server
rws <- publishWebService(ws,
                         car_scorer,
                         "pricing lemons",
                         renault[,c("Price",
                                    "Kilometers","Age")],
                         data.frame = T)

price <- consume(rws,
                 data.frame("Price" = 0,
                            "Kilometers" = 50000,
                            "Age" = 365,
                            stringsAsFactors = F))

d <- AzureML::datasets(ws)
airports <- AzureML::download.datasets(ws,"Airport Codes Dataset")

# AzureML Basic example.
library(lme4)
set.seed(1)
train <- sleepstudy[sample(nrow(sleepstudy), 120),]
m <- lm(Reaction ~ Days + Subject, data = train)
predict(m,sleepstudy[1,])
# Deine a prediction function to publish based on the model:
sleepyPredict <- function(newdata){
  predict(m, newdata=newdata)
}

ep <- publishWebService(ws,
                        sleepyPredict,
                        name="sleepy lm",
                        inputSchema = sleepstudy,
                        data.frame = TRUE)

# OK, try this out, and compare with raw data
ans <- consume(ep, sleepstudy)$ans
plot(ans, sleepstudy$Reaction)

# Remove the service
deleteWebService(ws, "sleepy lm")


# more on azure: 
# http://www.nealanalytics.com/deploying-r-modelsfunctions-with-the-azureml-r-package/


# https://www.r-bloggers.com/deploying-a-car-price-model-using-r-and-azureml/
# https://longhowlam.wordpress.com/2015/08/20/deploying-a-car-price-model-using-r-and-azureml/


