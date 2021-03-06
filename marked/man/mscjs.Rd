\name{mscjs}
\alias{mscjs}
\title{Fitting function for Multistate CJS models}
\usage{
mscjs(x, ddl, dml, model_data = NULL, parameters, accumulate = TRUE,
  initial = NULL, method, hessian = FALSE, debug = FALSE,
  chunk_size = 1e+07, refit, itnmax = NULL, control = NULL, scale,
  use.admb = FALSE, re = FALSE, compile = FALSE, extra.args = "",
  clean = TRUE, ...)
}
\arguments{
  \item{x}{processed dataframe created by process.data}

  \item{ddl}{list of dataframes for design data; created by
  call to \code{\link{make.design.data}}}

  \item{dml}{list of design matrices created by
  \code{\link{create.dm}} from formula and design data}

  \item{model_data}{a list of all the relevant data for
  fitting the model including imat,
  S.dm,p.dm,Psi.dm,S.fixed,p.fixed,Psi.fixed and
  time.intervals. It is used to save values and avoid
  accumulation again if the model was re-rerun with an
  additional call to cjs when using autoscale or
  re-starting with initial values.  It is stored with
  returned model object.}

  \item{parameters}{equivalent to \code{model.parameters}
  in \code{\link{crm}}}

  \item{accumulate}{if TRUE will accumulate capture
  histories with common value and with a common design
  matrix for S and p to speed up execution}

  \item{initial}{list of initial values for parameters if
  desired; if each is a named vector from previous run it
  will match to columns with same name}

  \item{method}{method to use for optimization; see
  \code{optim}}

  \item{hessian}{if TRUE will compute and return the
  hessian}

  \item{debug}{if TRUE will print out information for each
  iteration}

  \item{chunk_size}{specifies amount of memory to use in
  accumulating capture histories; amount used is
  8*chunk_size/1e6 MB (default 80MB)}

  \item{refit}{non-zero entry to refit}

  \item{itnmax}{maximum number of iterations}

  \item{control}{control string for optimization functions}

  \item{scale}{vector of scale values for parameters}

  \item{use.admb}{if TRUE creates data file for admbcjs.tpl
  and runs admb optimizer}

  \item{re}{if TRUE creates random effect model
  admbcjsre.tpl and runs admb optimizer}

  \item{compile}{if TRUE forces re-compilation of tpl file}

  \item{extra.args}{optional character string that is
  passed to admb if use.admb==TRUE}

  \item{clean}{if TRUE, deletes the tpl and executable
  files for amdb if use.admb=T}

  \item{...}{any remaining arguments are passed to
  additional parameters passed to \code{optim} or
  \code{\link{cjs.lnl}}}
}
\value{
The resulting value of the function is a list with the
class of crm,cjs such that the generic functions print and
coef can be used. \item{beta}{named vector of parameter
estimates} \item{lnl}{-2*log likelihood} \item{AIC}{lnl +
2* number of parameters} \item{convergence}{result from
\code{optim}; if 0 \code{optim} thinks it converged}
\item{count}{\code{optim} results of number of function
evaluations} \item{reals}{dataframe of data and real S and
p estimates for each animal-occasion excluding those that
occurred before release} \item{vcv}{var-cov matrix of betas
if hessian=TRUE was set}
}
\description{
A function for computing MLEs for a Multi-state
Cormack-Jolly-Seber open population capture-recapture model
for processed dataframe \code{x} with user specified
formulas in \code{parameters} that create list of design
matrices \code{dml}. This function can be called directly
but is most easily called from \code{\link{crm}} that sets
up needed arguments.
}
\details{
It is easiest to call \code{mscjs} through the function
\code{\link{crm}}. Details are explained there.
}
\author{
Jeff Laake <jeff.laake@noaa.gov>
}
\references{
Ford, J. H., M. V. Bravington, and J. Robbins. 2012.
Incorporating individual variability into mark-recapture
models. Methods in Ecology and Evolution 3:1047-1054.
}

