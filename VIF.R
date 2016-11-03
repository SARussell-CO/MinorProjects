# How to calculate VIF----
# This is an extension on the post from Shivani Tanwar on Quora:
# https://www.quora.com/How-can-we-calculate-the-variance-inflation-factor-for-a-categorical-predictor-variable-when-examining-multicollinearity-in-a-linear-regression-model/answer/Shivani-Tanwar-1?__nsrc__=4

# Constructing a model that we might want to measure VIF for:
mod1 <- lm(qsec ~ wt + am + hp, data = mtcars)
summary(mod1)
# Coefficients:
#             Estimate Std. Error t value  Pr(>|t|)    
# (Intercept) 20.43256    1.09191   18.71   < 2e-16 ***
# wt           0.44352    0.37392    1.19     0.246    
# am          -1.03848    0.56872   -1.83     0.079 .  
# hp          -0.02447    0.00397   -6.16 0.0000012 ***
# 
# Residual standard error: 1.05 on 28 degrees of freedom
# Multiple R-squared:  0.689,	Adjusted R-squared:  0.656 
# F-statistic: 20.7 on 3 and 28 DF,  p-value: 0.000000288

# Now let's check the VIF (the easy, reliable way)
library(car) # Companion to Applied Regression
vif(mod1)
# wt      am      hp 
# 3.77484 2.27108 2.08812

# Let's manually calculate VIF and compare to the car::vif() function!
vars <- c("wt", "am", "hp")
vifs <- numeric(length(vars))
for (i in 1:length(vifs)){
    # Create several regression models
    vs <- vars[-i]
    var0 <- mtcars[, vars[i]]
    var1 <- mtcars[, vs[1]]
    var2 <- mtcars[, vs[2]]
    # lm(first variable to test ~ remaining variables in model)
    mod <- lm(var0 ~  var1 + var2)
    vifs[i] <- 1/(1 - summary(mod)$r.squared) # Formula courtesy of Shivani Tanwar
}
names(vifs) <- vars
all.equal(vifs, car::vif(mod1)) # TRUE
