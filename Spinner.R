#Exam 1-- Spin the Wheel Problem
#The rules to this game can be found at link:
# https://byu-stat-223-winter2019-t1.github.io/course-site/exam1.html
set.seed(223)

# Part 1
spinner <- function() {
  spins_left <- NA
  spins_left[1] <- 50
  spin <- NA
  spin[1] <- 1
  winnings <- NA
  # The prompt did not specify the number of tickets I start with so I will assume
  # that I have the bare minimum needed to play.  This ticket is immediately spent
  # and does not factor into any of my calculations so I initialize at 0.
  winnings[1] <- 0
  
  while(spins_left[1]>0 & (spin[1]==1 | spin[1]==5 | spin[1]==7)) {
    spins_left[1] <- spins_left[1]-1
    spin[1] <- sample(1:10,1,replace = TRUE) 
    winnings[1] <- ifelse(spin[1]==1 | spin[1]==5 | spin[1]==7,5*(50-spins_left[1])+50-spins_left[1]-1,winnings[1])
  }
  winnings[1]
}

sim1 <- spinner() # I earn 0 tickets in the first simulation

# Part 2
spinner_results <- NA
stuffed_rat <- NA
for (i in 1:10000) {
  spinner_results[i] <-  spinner()
  stuffed_rat[i] <- ifelse(spinner_results[i]>=20,1,0)
}

# Not required but worth calculating-- I expect to win about 2 tickets
spinner.est <- sum(spinner_results)/10000
spinner.error <- sd(spinner_results)/sqrt(10000)
spinner.lb <- spinner.est- 1.96*spinner.error
spinner.ub <- spinner.est+1.96*spinner.error

# Parts 3 and 4
rat.est <- sum(stuffed_rat)/10000
rat.error <- sd(stuffed_rat)/sqrt(10000)
rat.lb <- rat.est- 1.96*rat.error
rat.ub <- rat.est+1.96*rat.error

# I win a rat about 1% of the time.  I should probably find another carnival game.

