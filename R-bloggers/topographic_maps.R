#persp() function enable users to draw perspective surface over x-y plane
library("mvtnorm")
library("MASS")
set.seed(6)
sigma <- matrix(c(4,2,2,3), ncol = 2)
x <- rmvnorm(500, mean = c(1,2), sigma = sigma, method = "chol")
z <- kde2d(x[,1], x[,2],n = 200);
opar <- par(no.readonly = T)
par(mar = rep(0,4))
persp(z, theta = 60, phi = 5, col = heat.colors(199, alpha = 1), shade = 0.4, border = NA, box = F)
par(opar)

#wireframe() functioncould generate 3D scatter plot and surfaces
library(marmap)
library(lattice)
data("nw.atlantic")
at1 <- nw.atlantic
at1 <- as.bathy(at1)
wireframe(unclass(at1), shade = T, aspect = c(1/2, 0.1), scales = list(draw = F, arrows = F))

#Package rgl provides medium to high level functions for 3D interactive graphics
library(rgl)
data("volcano")
head(volcano)
z <- 3 * volcano
x <- 10*(1:nrow(z))
y <- 10*(1:ncol(z))
zlim <- range(z)
zlen <- zlim[2]- zlim[1]+1
colorlut <- terrain.colors(zlen, alpha = 0)
col <- colorlut[z-zlim[1]+1]
open3d()
rgl.surface(x,y,z,color=col,alpha=1,back="lines")
colorlut <- heat.colors(zlen,alpha=1)
col<-colorlut[z-zlim[1]+1]
rgl.surface(x,y,matrix(1,nrow(z),ncol(z)),color=col,back="fill")
