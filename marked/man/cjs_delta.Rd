\name{cjs_delta}
\alias{cjs_delta}
\title{HMM Initial state distribution functions}
\usage{
cjs_delta(pars, m, F, T, start)
}
\arguments{
  \item{pars}{list of real parameter matrices (id by
  occasion) for each type of parameter}

  \item{m}{number of states}

  \item{F}{initial occasion vector}

  \item{T}{number of occasions}

  \item{start}{matrix with values that are first occasion
  and for some CJS type models the state of first
  observation}
}
\value{
2-d array of initial state probability vectors for each id
}
\description{
Functions that compute the initial probability distribution
for the states. Currently only CJS, MS models and MS models
with state uncertainty are included and these all use
cjs_delta to assign a known state.
}
\author{
Jeff Laake <jeff.laake@noaa.gov>
}
\references{
Zucchini, W. and I.L. MacDonald. 2009. Hidden Markov Models
for Time Series: An Introduction using R. Chapman and Hall,
Boca Raton, FL. 275p.
}

