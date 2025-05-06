##### 
set.seed(123)
n <- 1000
b0 <- 1
b1 <- 2
pc <- rnorm(1000, 1, 0.25)
mu <- exp(b0 + b1 * pc)
index <- rpois(1000, mu)
data <- data.frame(pc = pc, index = index)
#####

library(performance)
library(ggplot2)


# Data exploration
hist(pc)
hist(index)

class(pc)
class(index)
plot(pc ~ index)

ggplot(data = data, aes(x = pc, y = index)) + geom_point(size = 3) + 
  stat_smooth(method = lm)

ggplot(data = data, aes(x = pc, y = index)) + geom_point(size = 3) + 
  stat_smooth(method = glm,method.args = list(family = poisson(link = "log"))) 

mod.glm <- glm(index ~ pc, family = poisson(link = "log"), data = data)
sum(residuals(mod.glm, type = "deviance")^2) / df.residual(mod.glm) 
check_model(mod.glm)
summary(mod.glm)





