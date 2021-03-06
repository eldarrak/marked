\name{cjs_dmat}
\alias{cjs_dmat}
\alias{ms_dmat}
\alias{ums2_dmat}
\alias{ums_dmat}
\title{HMM Observation Probability matrix functions}
\usage{
cjs_dmat(pars, m, F, T)
}
\arguments{
  \item{pars}{list of real parameter matrices (id by
  occasion) for each type of parameter}

  \item{m}{number of states}

  \item{F}{initial occasion vector}

  \item{T}{number of occasions}
}
\value{
4-d array of id and occasion-specific observation
probability matrices - state-dependent distributions in
Zucchini and MacDonald (2009)
}
\description{
Functions that compute the probability matrix of the
observations given the state for various models. Currently
only CJS, MS models and MS models with state uncertainty
are included.
}
\author{
Jeff Laake <jeff.laake@noaa.gov>
}
\references{
Zucchini, W. and I.L. MacDonald. 2009. Hidden Markov Models
for Time Series: An Introduction using R. Chapman and Hall,
Boca Raton, FL. 275p.
}

