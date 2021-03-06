% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ff_panel_expand.R
\name{ff_panel_expand_longrosterwide}
\alias{ff_panel_expand_longrosterwide}
\title{long Panel Record Date of Attendance each ID, Expand to Wide of Cumulative Attendance by Dates}
\usage{
ff_panel_expand_longrosterwide(df, svr_id_t, svr_id_i, st_idcol_prefix = "id_")
}
\arguments{
\item{svr_id_t}{string time variable name}

\item{svr_id_i}{string individual ID name}

\item{st_idcol_prefix}{string prefix for wide id}
}
\value{
a list of two dataframes
\itemize{
  \item df_roster_wide - a wide dataframe rows are unique dates, columns are individuals,
  cells are 1 if attended that day
  \item df_roster_wide_cumu - a wide dataframe rows are unique dates, columns are individuals,
  cells show cumulative attendance
}
}
\description{
INPUT MATRIX: There are $N$ students in class, but only a subset of them attend class each day.
If student $id_i$ is in class on day $Q$, the teacher records on a sheet the date
and the student ID. So if the student has been in class 10 times, the teacher has
ten rows of recorded data for the student with two columns: column one is the student
ID, and column two is the date on which the student was in class. Suppose there were
50 students, who on average attended exactly 10 classes each during the semester,
this means we have \eqn{10 \cdot 50} rows of data, with differing numbers of
rows for each student. This is the input matrix for this function here.

OUTPUT MATRIX: Now we want to generate a new dataframe, where each row is a date, and each column
is a student. The values in the new dataframe shows, at the $Q^{th}$ day, how many
classes student $i$ has attended so far. The following results is also in a REconTools
Function. This is shown as df outputed by this function generated below.

This function is useful beyond the roster example. It is used in the optimal allocation
problem as well. There are individual recipients of allocation, and each can receive some Q
units of allocations. Given total resources available, what is the sequence in which allocation
should be given to each. The input dataframe has two columns, the ID of each individual, and
the queue rank for a particular allocation for this individual. Expanding to wide gives us
a new df where each row is each additional unit of aggregate allocation available, and each
column is a different individual. The values says at the current level of overall resources
how many units of resources go to each of the individual.
}
\examples{
library(dplyr)
library(tidyr)
library(tibble)
# Generate Input Data Structure
# Define
it_N <- 3
it_M <- 5
svr_id <- 'student_id'

# from : support/rand/fs_rand_draws.Rmd
set.seed(222)
df_panel_attend_date <- as_tibble(matrix(it_M, nrow=it_N, ncol=1)) \%>\%
  rowid_to_column(var = svr_id) \%>\%
  uncount(V1) \%>\%
  group_by(!!sym(svr_id)) \%>\% mutate(date = row_number()) \%>\%
  ungroup() \%>\% mutate(in_class = case_when(rnorm(n(),mean=0,sd=1) < 0 ~ 1, TRUE ~ 0)) \%>\%
  filter(in_class == 1) \%>\% select(!!sym(svr_id), date) \%>\%
  rename(date_in_class = date)

print(df_panel_attend_date)

# Parameters
df <- df_panel_attend_date
svr_id_i <- 'student_id'
svr_id_t <- 'date_in_class'
st_idcol_prefix <- 'sid_'

# Invoke Function
ls_df_rosterwide <- ff_panel_expand_longrosterwide(df, svr_id_t, svr_id_i, st_idcol_prefix)
df_roster_wide_func <- ls_df_rosterwide$df_roster_wide
df_roster_wide_cumu_func <- ls_df_rosterwide$df_roster_wide_cumu

# Print
print(df_roster_wide_func)
print(df_roster_wide_cumu_func)
}
\references{
\url{https://fanwangecon.github.io/REconTools/reference/ff_panel_expand_longrosterwide.html}
\url{https://fanwangecon.github.io/R4Econ/panel/widelong/fs_pivotwider.html}
\url{https://github.com/FanWangEcon/REconTools/blob/master/R/ff_panel_expand.R}
}
\author{
Fan Wang, \url{http://fanwangecon.github.io}
}
