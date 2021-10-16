library(car)
str(Prestige)
head(Prestige)


Prestige.lm <-lm(income~education, data= Prestige)
class(Prestige.lm)
Prestige.lm

windows(width=12,height=8)
plot(Prestige$income ~ Prestige$education,
     col="cornflowerblue",pch=19,
     xlab="Education(years)",ylab="income (dollars)",
     main="Education and Income")


# abline : draw a line in the plot
# lwd = the thickness of a line
abline(Prestige.lm,col="salmon",lwd=2)

# summary function : It shows a lot of
# analysis information including residual, regression coefficient,
# R^2 value , F-value etc...
summary(Prestige.lm)
## Output description##

# < residual > : information of distribution of residuals
# In ideal case, the distribution should follow normal distribution.
# Because average of residual is 0, if we know mean value, we can see 
# degree of bias in the distribution. In this case, median value is minus.
# we can know that the distribution shows a long tailed shape to the right --> not a normal distribution.
# So, by checking it, we can infer how the residual is similar to a normal distribution.

# < coefficients > : It shows estimated regression coefficient and result of significance test.
# regression estimate(coefficient) is shown as Estimate column.
# the leftover is t-value and significance probability(p-value)

# t-test(checking p value!) for regression coefficient tests the null hypothesis that the regression coefficient is zero
# P value for education is less than 0.5, It means that 
# coefficient estimate for education is statistically significant.
# So, I cannot say that coefficient of education is zero.

# < Residual standard error > : It means the standard deviation of the residual values when using the regression model to predict dependent variables from independent variables.
# In other words, based on the regression line, it can shows the average volatility that could volatile up and down
# Since RSE can show a measure of variation that is not accounted for by the model,
# The smaller the value, the better the fit of the model

# < Multiple R-squared > : The explanatory power of the regression model.
# The bigger the value, the better the model's explanatory power

# < F-statistic >  Global test to check if your model has at least one significant variable. If p value is less than 0.05,
# it means that at least one coefficient in the regression equation is not a zero.


coef(summary(Prestige.lm))
# I can extract only the necessary information.

anova(summar(Prestige.lm))
# call only analysis of variance table.
# If P value is less than 0.05, we can reject the null hypothesis 
# that all regression coefficients are 0. So, regression model is statistically significant.

coef(Prestige.lm)
# extract only coefficient

confint(Prestige.lm)
# confidence interval

fitted(Prestige.lm)[1:3]
# predicted value
resid(Prestige.lm)[1:3]
# observed value - predicted value
Prestige$income[1:3]
# observed value

Prestige.new <-data.frame(education=c(5,10,15))
# In order to predict output from new data, first I should make
# data as data frame. And I should make the predictor variable name same with the independent variable name. 

predict(Prestige.lm,newdata=Prestige.new)
# Predict income with Prestige.new's independent variable.

predict(Prestige.lm,newdata=Prestige.new,interval="confidence")
# 95% confidence interval

mean(Prestige$education)
lm(income~education, data=Prestige,
   subset = (education >= mean(Prestige$education)))
# It performs regression analysis to the group with a period of education greater than or equal to the average. 

lm(income~education, data=Prestige,
   subset = (education <= mean(Prestige$education)))
# Also, by executing this line, I can know how it has different meaning for 1 year of education in each group.
