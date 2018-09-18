## Regional
mm <- c(0.835, 0.6, 0.292, 0.025, 0.179)
mn <- c(0.156, 0.351, 0.494, 0.304, 0.502)

nn <- 1-mm-mn

## Global
MM <- mean(mm)
MN <- mean(mn)
NN <- mean(nn)

M <- MM+MN/2
N <- NN+MN/2

print(c(M=M, N=N))

print(observed <- c(
	mm = MM
	, mn = MN
	, nn = NN
))
print(expected <- c(
	mm = M^2
	, mn = 2*M*N
	, nn = N^2
))
