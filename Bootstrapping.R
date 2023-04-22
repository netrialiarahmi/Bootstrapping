---
title: "Bootstrap"
author: "Netri Alia Rahmi"
date: "2023-04-22"
output: html_document
---

# **Bootstrapping for Means**

```{r}
x <- c(1:5)
n <- length(x)
B <- 10
x_star <- NULL
for (i in 1:B)
{
  x_star <- cbind(x_star, sample(x,n,replace = TRUE))
}
x_star
x_boot <- matrix(0,1,n)
for (i in 1:n) {
  x_boot[,i] <- mean(x_star[,i])
}
x_boot
#PARAMETRIK
set.seed(123)
n <- 10
x <- rnorm(n, mean=0, sd=1)
x_bar <- mean(x)
var_x <- var(x)
sd_x <- sd(x)
B <- 100
x_bar_boot <- vector()
for (i in 1:B) {
  x_boot <- sample(x,n,replace = TRUE)
  x_bar_boot[i] <- mean(x_boot)
}
hist(x_bar_boot)
qqnorm(x_bar_boot)
#NONPARAMETRIK
x <- sample(seq(1,3,by=0.001),20, replace = TRUE)
n <- length(x)
x_bar <- mean(x)
var_x <- var(x)
sd_x <- sd(x)
var_x_bar <- var_x/n
sd_x_bar <- sqrt(var_x_bar)
B <- 100
x_bar_boot <- vector()
for (i in 1:B) {
  x_boot <- sample(x,n,replace = TRUE)
  x_bar_boot[i] <- mean(x_boot)
}
hist(x_bar_boot)
qqnorm(x_bar_boot)
#Bias dan Varians Statistik
x_bar_boot_bar <- mean(x_bar_boot)
bias <- x_bar_boot_bar-x_bar
var_x_bar_boot <- var(x_bar_boot)
sd_x_bar_boot <- sqrt(var_x_bar_boot)
#CI Xbar boot bawah
#Bias dan Varians Statistik
x_bar_boot_bar <- mean(x_bar_boot)
bias <- x_bar_boot_bar-x_bar
var_x_bar_boot <- var(x_bar_boot)
sd_x_bar_boot <- sqrt(var_x_bar_boot)
z<-qt(.975,1008)
#CI bawah
CI_bawah<-x_bar_boot_bar-z*(sd_x_bar_boot/sqrt(n))
CI_bawah
#CI Atas
CI_atas<-x_bar_boot_bar+z*(sd_x_bar_boot/sqrt(n))
CI_atas
```

# **Bootstrapping for Median**

```{r}
x <- c(1:5)
n <- length(x)
B <- 10
x_star <- NULL

for (i in 1:B)
{
  x_star <- cbind(x_star, sample(x,n,replace = TRUE))
}

x_star

x_boot <- matrix(0,1,n)
for (i in 1:n) {
  x_boot[,i] <- median(x_star[,i]) # mengganti mean menjadi median
}

x_boot

#PARAMETRIK
set.seed(123)
n <- 10
x <- rnorm(n, mean=0, sd=1)
x_bar <- median(x) # mengganti mean menjadi median
var_x <- var(x)
sd_x <- sd(x)
B <- 100
x_bar_boot <- vector()
for (i in 1:B) {
  x_boot <- sample(x,n,replace = TRUE)
  x_bar_boot[i] <- median(x_boot) # mengganti mean menjadi median
}

hist(x_bar_boot)
qqnorm(x_bar_boot)

#NONPARAMETRIK
x <- sample(seq(1,3,by=0.001),20, replace = TRUE)
n <- length(x)
x_bar <- median(x) # mengganti mean menjadi median
var_x <- var(x)
sd_x <- sd(x)
var_x_bar <- var_x/n
sd_x_bar <- sqrt(var_x_bar)
B <- 100
x_bar_boot <- vector()
for (i in 1:B) {
  x_boot <- sample(x,n,replace = TRUE)
  x_bar_boot[i] <- median(x_boot) # mengganti mean menjadi median
}

hist(x_bar_boot)
qqnorm(x_bar_boot)

#Bias dan Varians Statistik
x_bar_boot_bar <- mean(x_bar_boot)
bias <- x_bar_boot_bar-x_bar
var_x_bar_boot <- var(x_bar_boot)
sd_x_bar_boot <- sqrt(var_x_bar_boot)

#CI Xbar boot bawah

#Bias dan Varians Statistik
x_bar_boot_bar <- mean(x_bar_boot)
bias <- x_bar_boot_bar-x_bar
var_x_bar_boot <- var(x_bar_boot)
sd_x_bar_boot <- sqrt(var_x_bar_boot)

z<-qt(.975,1008)

#CI bawah
CI_bawah<-x_bar_boot_bar-z*(sd_x_bar_boot/sqrt(n))
CI_bawah

#CI Atas
CI_atas<-x_bar_boot_bar+z*(sd_x_bar_boot/sqrt(n))
CI_atas
```
