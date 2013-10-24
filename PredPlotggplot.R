#Example of plotting predicted lines from a linear mixed model
#using ggplot

library(nlme)
data(BodyWeight)
#Run your model
model <- lme(weight ~ Time + Diet, BodyWeight, ~ 1 | Rat)
summary(model)

#Predict the values
#predict.lme is a pain because you have to specify which rat
#you are interested in, but we don't want that
#manually predicting things instead
times <- seq.int(0, 65, 0.1)
mcf <- model$coefficients$fixed
predicted <- 
  mcf["(Intercept)"] + 
  rep.int(mcf["Time"] * times, nlevels(BodyWeight$Diet)) + 
  rep(c(0, mcf["Diet2"], mcf["Diet3"]), each = length(times))
prediction_data <- data.frame(
  weight = predicted,
  Time   = rep.int(times, nlevels(BodyWeight$Diet)),
  Diet   = rep(levels(BodyWeight$Diet), each = length(times))
)  

library(ggplot2)
#Draw the plot (using ggplot2)
(p <- ggplot(BodyWeight, aes(Time, weight, colour = Diet)) + 
   geom_point() +
   geom_line(data = prediction_data)
)