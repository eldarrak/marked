\name{hmmDemo}
\alias{hmmDemo}
\title{HMM computation demo functions}
\usage{
hmmDemo(data, id, ddl = NULL, begin.time = 1, model = "hmmCJS",
  title = "", model.parameters = list(), design.parameters = list(),
  initial = NULL, groups = NULL, time.intervals = NULL,
  accumulate = FALSE, chunk_size = 1e+07, strata.labels = NULL,
  state.names = NULL, obs.names = NULL, ...)
}
\arguments{
  \item{data}{Either the raw data which is a dataframe with
  at least one column named ch (a character field
  containing the capture history) or a processed dataframe}

  \item{id}{id number for calculation}

  \item{ddl}{Design data list which contains a list element
  for each parameter type; if NULL it is created}

  \item{begin.time}{Time of first capture(release)
  occasion}

  \item{model}{Type of c-r model (hmm models only)}

  \item{title}{Optional title; not used at present}

  \item{design.parameters}{Specification of any grouping
  variables for design data for each parameter}

  \item{model.parameters}{List of model parameter
  specifications}

  \item{initial}{Optional vector of initial values for beta
  parameters; if named from previous analysis only relevant
  values are used}

  \item{groups}{Vector of names factor variables for
  creating groups}

  \item{time.intervals}{Intervals of time between the
  capture occasions}

  \item{accumulate}{if TRUE, like capture-histories are
  accumulated to reduce computation}

  \item{chunk_size}{specifies amount of memory to use in
  accumulating capture histories and design matrices;
  amount used is 8*chunk_size/1e6 MB (default 80MB)}

  \item{strata.labels}{labels for strata used in capture
  history; they are converted to numeric in the order
  listed. Only needed to specify unobserved strata. For any
  unobserved strata p=0..}

  \item{state.names}{names for states used to label output}

  \item{obs.names}{names for observations used to lablel
  output}

  \item{...}{optional arguments passed to js or cjs and
  optimx}
}
\value{
hmm demo list
}
\description{
Uses dataframe and arguments to construct HMM state vectors
alpha and phi for demonstration.#'
}
\examples{
# cormack-jolly-seber model
data(dipper)
#note id values will not match row numbers in dipper because
#capture histories of "0000001" are removed. But if you process data and
#pass it to hmmDemo then it will match dipper.proc$data
dipper.proc=process.data(dipper,model="hmmCJS")
x=hmmDemo(dipper.proc,id=45,state.names=c("Alive","Dead"),obs.names=c("Missed","Seen"))
par(mfrow=c(2,1))
barplot(t(x$alpha),beside=TRUE,names.arg=x$chforwardstrings)
barplot(t(x$phi),beside=TRUE,names.arg=x$chforwardstrings)
#data(mstrata)
#mstrata$freq=1
#x=hmmDemo(mstrata,id=1,model="hmmMSCJS")
#rowSums(x$alpha*x$beta)
#exp(x$lnl)
# state probabilities given the data
#x$alpha*x$beta/exp(x$lnl)
}
\author{
Jeff Laake
}
\keyword{models}

