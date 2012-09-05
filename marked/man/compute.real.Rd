\name{compute.real}
\alias{compute.real}
\title{Compute estimates of real parameters}
\usage{
  compute.real(model, parameter, unique = FALSE,
    vcv = FALSE, chat = 1, subset, select)
}
\arguments{
  \item{model}{MARK model object}

  \item{parameter}{name of real parameter to be computed
  (eg "Phi" or "p")}

  \item{unique}{TRUE if only unique values should be
  returned}

  \item{vcv}{logical; if TRUE, computes and returns v-c
  matrix of real estimates}

  \item{chat}{over-dispersion value}

  \item{subset}{logical expression using fields in real
  dataframe}

  \item{select}{character vector of field names in real
  that you want to include}
}
\value{
  A data frame (\code{real}) is returned if
  \code{vcv=FALSE}; otherwise, a list is returned also
  containing vcv.real: \item{real}{ data frame containing
  estimates, and if vcv=TRUE it also contains standard
  errors and confidence intervals}
  \item{vcv.real}{variance-covariance matrix of real
  estimates}
}
\description{
  Computes real estimates and var-cov from design matrix
  (design) and coefficients (beta) using specified link
  functions
}
\details{
  The estimated real parameters can be derived from the
  estimated beta parameters, a completed design matrix, and
  the link function specifications. MARK produces estimates
  of the real parameters, se and confidence intervals but
  there are at least 2 situations in which it is useful to
  be able to compute them after running the analysis in
  MARK: 1) adjusting confidence intervals for estimated
  over-dispersion, and 2) making estimates for specific
  values of covariates.  The first case is done in
  \code{\link{get.real}} with a call to this function.  It
  is done by adjusting the estimated standard error of the
  beta parameters by multiplying it by the square root of
  \code{chat} to adjust for over-dispersion.  A normal 95%
  confidence interval is computed for the link estimate
  (estimate +/- 1.96*se) and this is then back-transformed
  to the real parameters using \code{\link{inverse.link}}
  with the appropriate inverse link function for the
  parameter to construct a 95% confidence interval for the
  real parameter. There is one exception. For parameters
  using the \code{mlogit} transformation, a \code{logit}
  transformation of each individual real Psi and its se are
  used to derive the confidence interval. The estimated
  standard error for the real parameter is also scaled by
  the square root of the over-dispersion constant
  \code{chat} stored in \code{model$chat}. But, the code
  actually computes the variance-covariance matrix rather
  than relying on the values from the MARK output because
  real estimates will depend on any individual covariate
  values used in the model which is the second reason for
  this function.

  New values of the real parameter estimates can easily be
  computed by simply changing the values of the covariate
  values in the design matrix and computing the
  inverse-link function using the beta parameter estimates.
  The covariate values to be used can be specified in one
  of 2 ways. 1) Prior to making a call to this function,
  use the functions \code{\link{find.covariates}} to
  extract the rows of the design matrix with covariate
  values and either fill in those values aautomatically
  with the options provided by
  \code{\link{find.covariates}} or edit those values to be
  the ones you want and then use
  \code{\link{fill.covariates}} to replace the values into
  the design matrix and use it as the value for the
  argument \code{design}, or 2) automate this step by
  specifying a value for the argument \code{data} which is
  used to take averages of the covariate values to fill in
  the covariate entries of the design matrix.  In computing
  real parameter estimates from individual covariate values
  it is important to consider the scale of the individual
  covariates. By default, an analysis with MARK will
  standardize covariates by subtracting the mean and
  dividing by the standard deviation of the covariate
  value. However, in the \code{RMark} library all calls to
  MARK.EXE do not standardize the covariates and request
  real parameter estimates based on the mean covariate
  values. This was done because there are many instances in
  which it is not wise to use the standardization
  implemented in MARK and it is easy to perform any
  standardization of the covariates with R commands prior
  to fitting the models.  Also, with pre-standardized
  covariates there is no confusion in specifying covariate
  values for computation of real estimates.  If the model
  contains covariates and the argument \code{design} is not
  specified, the design matrix is extracted from
  \code{model} and all individual covariate values are
  assigned their mean value to be consistent with the
  default in the MARK analysis.

  If a value for \code{beta} is given, those values are
  used in place of the estimates
  \code{model$results$beta$estimate}.
}
\author{
  Jeff Laake
}
\keyword{utility}
