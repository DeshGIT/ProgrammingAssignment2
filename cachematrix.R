library(MASS)
## In total there are 2 functions
#makeCacheMatix function has set, get, setInverse functions
makeCacheMatrx<-function(x = matrix()){
  inv <- NULL ## initializing inverse as NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function()x ## function to get the matrix
  setInverse<-function(inverse) inv<<-inverse
  getInverse<-fuction(){inv}
  list(set=set,get=get,setInverse=setInverse, getInverse=getInverse)
}
## the following function get cache data
cashSolve<- function(x,...){
  inv<-x$getInverse()
  if(!is.null(inv)){ ## here it chaecks whether inverse is NUll
    message("getting cached data")
    return((inv))
  }
  mat<-x$get()
  inv<-solve(mat,...)
  x$setInverse(inv)
  inv
}
