require(survival)
# uploading package in memory.

str(colon)
#dataset for colon cancer

colon1<-na.omit(colon)
View(colon)
View(colon1)

result<-glm(status~rx+sex+age+obstruct+perfor+ adhere+ nodes + differ + extent + surg, family = binomial,data =colon1)
#logistic regression model

summary(result)

reduced.model = step(result)
summary(reduced.model)
# new model summary

install.packages("devtools")
devtools::install_github("cardiomoon/moonBook")
require(moonBook)
extractOR(reduced.model)

fit = glm (formula = status~ rx+ obstruct+adhere +nodes+extent+surg,family=binomial,data=colon1)
# new model by using selected variables.

fit.od=glm (formula = status~ rx+ obstruct+adhere +nodes+extent+surg,family=quasibinomial,data=colon1)

pchisq(summary(fit.od)$dispersion*fit$df.residual,fit$df.residual,lower=F)
#0.2803691 > 0.05 --> there is no Overdispersion
# if without Overdispersion, use optioin : family=binomial (fit model)
# else use option : family = quasibinomial (fit.od model)

ORplot(fit.od)
