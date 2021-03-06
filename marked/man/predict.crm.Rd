\name{predict.crm}
\alias{predict.crm}
\title{Compute estimates of real parameters}
\usage{
\method{predict}{crm}(object,newdata=NULL,ddl=NULL,parameter=NULL,unique=TRUE,
                   vcv=FALSE,se=FALSE,chat=1,subset,select,...)
}
\arguments{
  \item{object}{model object}

  \item{newdata}{a dataframe for crm}

  \item{ddl}{list of dataframes for design data; created by
  call to}

  \item{parameter}{name of real parameter to be computed
  (eg "Phi" or "p")}

  \item{unique}{TRUE if only unique values should be
  returned}

  \item{vcv}{logical; if TRUE, computes and returns v-c
  matrix of real estimates}

  \item{se}{logical; if TRUE, computes std errors and conf
  itervals of real estimates}

  \item{chat}{over-dispersion value}

  \item{subset}{logical expression using fields in real
  dataframe}

  \item{select}{character vector of field names in real
  that you want to include}

  \item{...}{generic arguments not used here}
}
\value{
A data frame (\code{real}) is returned if \code{vcv=FALSE};
otherwise, a list is returned also containing vcv.real:
\item{real}{ data frame containing estimates, and if
vcv=TRUE it also contains standard errors and confidence
intervals} \item{vcv.real}{variance-covariance matrix of
real estimates}
}
\description{
Computes real estimates and their var-cov for a particular
subset of parameters.
}
\examples{
data(dipper)
dipper.proc=process.data(dipper,model="cjs",begin.time=1)
dipper.ddl=make.design.data(dipper.proc)
mod.Phisex.pdot=crm(dipper.proc,dipper.ddl,
   model.parameters=list(Phi=list(formula=~sex+time),p=list(formula=~1)),hessian=TRUE)
xx=predict(mod.Phisex.pdot)
xx
xx=predict(mod.Phisex.pdot,newdata=dipper[c(1,23),],vcv=TRUE)
xx
}
\author{
Jeff Laake
}
\keyword{utility}

