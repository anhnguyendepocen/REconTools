% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ff_opti_bisect.R
\name{ff_opti_bisect_pmap_multi}
\alias{ff_opti_bisect_pmap_multi}
\title{Dataframe rows are individuals, find root for each individual, given cts diff monotonic function with root.}
\usage{
ff_opti_bisect_pmap_multi(
  df,
  fc_withroot,
  fl_lower_x,
  fl_upper_x,
  ls_svr_df_in_func,
  svr_root_x = "x",
  it_iter_tol = 50,
  fl_zero_tol = 10^-5,
  bl_keep_iter = TRUE,
  st_bisec_prefix = "bisec_",
  st_lower_x = "a",
  st_lower_fx = "fa",
  st_upper_x = "b",
  st_upper_fx = "fb"
)
}
\arguments{
\item{df}{dataframe containing all row/individual specific variable information, will append bisection results to datafram}

\item{fc_withroot}{function with root, the function should have hard-coded in scalars and arrays that
would not change over iterations and would not change across individuals}

\item{fl_lower_x}{float value of common lower bound}

\item{fl_upper_x}{float value of common upper bound, opposing sign}

\item{ls_svr_df_in_func}{list of string names variables in df that are inputs for fc_withroot.}

\item{svr_root_x}{string the x variable name that appears n fc_withroot.}

\item{it_iter_tol}{integer how many maximum iterations to allow for bisection at most}

\item{fl_zero_tol}{float at what gap to zero will algorithm stop}

\item{bl_keep_iter}{whether to keep all iteration results as data columns}

\item{st_bisec_prefix}{string prefix for all bisection iteration etc results variables}

\item{st_lower_x}{string variable name component for lower bound x}

\item{st_lower_fx}{string variable name component for lower bound x evaluated at function}

\item{st_upper_x}{string variable name component for upper bound x}

\item{st_upper_fx}{string variable name component for upper bound x evaluated at function}
}
\value{
dataframe containing bisection root for each individual/row
}
\description{
This is only for strictly monotonically functions that have unique crossing at zero. There are potentially three
types of inputs relevant for the bisection root evaluation. Values in each row are parameters for the same nonlinear
function, we want to find roots for N nonlinear functions defined by each row. First type of input are these row specific
variable values. Second type of inputs are scalars or arrays that are fixed over all rows. Third type of inputs are values
that are shifting over bisection iterations. The implementation here assumes that we have lower and upper bound values
that are common across all individauls (rows), and that garantee opposing signs.
}
\examples{
library(dplyr)
library(tibble)
it_N_child_cnt <- 9
ar_intercept = seq(-10, -1, length.out = it_N_child_cnt)
ar_slope = seq(0.1, 1, length.out = it_N_child_cnt)
df_lines <- as_tibble(cbind(ar_intercept, ar_slope)) \%>\% rowid_to_column(var='ID')
ar_st_col_names = c('ID','fl_int', 'fl_slope')
df_lines <- df_lines \%>\% rename_all(~c(ar_st_col_names))
fc_withroot_line <- function(fl_int, fl_slope, x){
  return(fl_int + fl_slope*x)
}
fl_lower_x_line <- 0
fl_upper_x_line <- 100000
ls_svr_df_in_func_line <- c('fl_int', 'fl_slope')
svr_root_x_line <- 'x'
fl_zero_tol = 10^-6
df_bisec <- ff_opti_bisect_pmap_multi(df_lines, fc_withroot_line,
                                           fl_lower_x_line, fl_upper_x_line,
                                           ls_svr_df_in_func_line, svr_root_x_line, bl_keep_iter = FALSE)
df_bisec \%>\% select(-one_of('f_p_t_f_a'))
}
\references{
\url{https://fanwangecon.github.io/REconTools/reference/ff_opti_bisect_pmap_multi.html}
\url{https://fanwangecon.github.io/REconTools/articles/fv_opti_bisect_pmap_multi.html}
\url{https://github.com/FanWangEcon/REconTools/blob/master/R/ff_opti_bisect.R}
}
\author{
Fan Wang, \url{http://fanwangecon.github.io}
}
