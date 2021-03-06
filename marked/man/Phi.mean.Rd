\name{Phi.mean}
\alias{Phi.boxplot}
\alias{Phi.mean}
\alias{p.boxplot}
\alias{p.mean}
\title{Various utility parameter summary functions}
\usage{
Phi.mean(x,age=0,time=NULL,age.bins=NULL,age.levels=NULL)

       p.mean(x,age=0,time=NULL,age.bins=NULL,age.levels=NULL)

       Phi.boxplot(x,age=0,time=NULL,sex=NULL)

       p.boxplot(x,age=0,time=NULL,sex=NULL)
}
\arguments{
  \item{x}{dataframe of reals contained in model}

  \item{age}{at which Phi or p should be shown across time}

  \item{time}{at which Phi or p should be shown across
  ages}

  \item{sex}{for which Phi or p should be shown across
  ages}

  \item{age.bins}{bins for age in which values are
  summarized}

  \item{age.levels}{labels for age.bins}
}
\value{
matrix of labelled values for Phi.mean and p.mean or
boxplot object
}
\description{
Several functions have been added to compute mean values
and boxplots of values. Currently they have only been
defined for Phi and p for cjs and they are not generic.
}
\author{
Jeff Laake
}
\keyword{utility}

