\name{crm.wrapper}
\alias{create.model.list}
\alias{crm.wrapper}
\alias{load.model}
\alias{model.table}
\title{Automation of model runs}
\usage{
crm.wrapper(model.list,data,ddl=NULL,models=NULL,base="",external=TRUE,...)

create.model.list(parameters)

model.table(model.list)

load.model(x)
}
\arguments{
  \item{data}{Either the raw data which is a dataframe with
  at least one column named ch (a character field
  containing the capture history) or a processed dataframe}

  \item{ddl}{Design data list which contains a list element
  for each parameter type; if NULL it is created}

  \item{model.list}{matrix of model names contained in the
  environment of models function; each row is a model and
  each column is for a parameter and the value is formula
  name}

  \item{models}{a function with a defined environment with
  model specifications as variables; values of model.list
  are some or all of those variables}

  \item{base}{base value for model names}

  \item{external}{if TRUE, model results are stored
  externally; otherwise they are stored in crmlist}

  \item{...}{aditional arguments passed to crm}

  \item{parameters}{character vector of parameter names}

  \item{x}{filename of externally stored model}
}
\value{
create.model.list returns a matrix for crm.wrapper;
crm.wrapper runs and stores models externally and retrurns
a list of model results and a model selection table;
load.model returns model object that is stored externally
}
\description{
Some functions that help automate running a set of crm
models based on parameter specifications.
}
\details{
create.model.list creates all combinations of model
specifications for the specified set of parameters.  In the
calling environment it looks for objects named
parameter.xxxxxx where xxxxxx can be anything. It creates a
matrix with a column for each parameter and as many rows
needed to create all combinations. This can be used as
input to crm.wrapper.

crm.wrapper runs a sequence of crm models by constructing
the call with the arguments and the parameter
specifications.  The parameter specifications can either be
in the local environment or in the environment of the named
function models. The advantage of the latter is that it is
self-contained such that sets of parameter specifications
can be selected without possibility of being over-written
or accidentally changed whereas with the former the set
must be identified via a script and any in the environment
will be used which requires removing/recreating the set to
be used.
}
\author{
Jeff Laake
}
\seealso{
\code{\link{crm}}
}
\keyword{models}

