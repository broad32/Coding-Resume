#This script runs a monte carlo simulation study to test the merits of two possible
#strategies in the classic 3 door game show game-- 1 door contains a new car and the
#other two are hiding goats.  When the host reveals one of the doors containing a goat
#I can choose to switch to the remaining unopened door or 'stand pat' by maintaing
#my original selection

set.seed(223)
#I define strategy vectors for keeping the original selection and switching to a new door
standpat <- NA
switch <- NA
doors <- c(1:3)
#I create a function to simulate the game N times
gameshow <- function(N){
for(i in 1:N) {
  #prizedoor denotes the door containing the new car while selectiondoor is the door I
  # pick.
  prizedoor <- sample(1:3,1)
  selectiondoor <- sample(1:3,1)
  #A given entry in standpat is given the value of 1 if the original selection matches
  #the door hiding the prize.
  standpat[i] <-ifelse(prizedoor==selectiondoor,1,0)
  #One of the doors not selected is opened and revealed to be hiding a goat.
  open_options <- c(which(doors!=prizedoor & doors!=selectiondoor))
  open <- ifelse(length(open_options)==2, open_options[sample(1:2,1)], open_options)
  #newselection refers to the door I choose if I make a switch
  newselection <- doors[which(doors!=open & doors!=selectiondoor)]
  #A given entry in switch is given the value of 1 if the newselection matches the door
  #hiding the prize
  switch[i] <- ifelse(newselection==prizedoor,1,0)
}
  sp.est <- sum(standpat)/N
  sp.error <- sd(standpat)/sqrt(N)
  sp.lb <- sp.est-1.96*sp.error
  sp.ub <- sp.est+1.96*sp.error
  
  sw.est <- sum(switch)/N
  sw.error <- sd(switch)/sqrt(N)
  sw.lb <- sw.est-1.96*sw.error
  sw.ub <- sw.est+1.96*sw.error 
  
  #The results vector returns a point estimate for the difference in win proportion
  #(switching-standing pat) as well as 95% confidence interval for the benefit of
  #adopting the switch doors strategy.
  
  results <- list(difference=sw.est-sp.est,CI_LB=sw.lb-sp.lb,CI_UB=sw.ub-sp.ub)
}

sample <- gameshow(100)

# Because my answer is positive .4 and significant at the 95% level, I conclude that
#switching doors really is a better strategy-- in fact it is roughly twice as good.