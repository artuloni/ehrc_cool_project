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

mod.lm <- lm(index ~ pc, data = data)
summary(mod.lm)

# simulation ####

size <- c()
for(i in 1 : nrow(data)){
  ifelse(index[i] < mean(index), size[i] <- "small", size[i] <- "big")
}
table(size)
