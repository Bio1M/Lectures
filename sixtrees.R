library("ape")

library("shellpipes")
startGraphics(height=7, width=10)

tree <- read.tree(matchFile(ext="tre"))
letter <- c("A", "B", "C", "D", "E", "F")

par(mfrow=c(2, 3), cex=1.)
for(i in 1:6)
plot(tree[[i]], main=letter[[i]])
