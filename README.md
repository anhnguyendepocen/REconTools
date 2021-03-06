[![HitCount](http://hits.dwyl.io/fanwangecon/REconTools.svg)](https://github.com/FanWangEcon/REconTools)  [![Star](https://img.shields.io/github/stars/fanwangecon/REconTools?style=social)](https://github.com/FanWangEcon/REconTools/stargazers) [![Fork](https://img.shields.io/github/forks/fanwangecon/REconTools?style=social)](https://github.com/FanWangEcon/REconTools/network/members) [![Star](https://img.shields.io/github/watchers/fanwangecon/REconTools?style=social)](https://github.com/FanWangEcon/REconTools/watchers)

# R Tools for Panel Data and Optimization

This is a work-in-progress [website](https://fanwangecon.github.io/REconTools/) consisting of files for doing Panel Data Statistics/Econometrics Analysis. Materials gathered from various [projects](https://fanwangecon.github.io/research) in which R code is used. Files are from [**Fan**](https://fanwangecon.github.io/)'s [REconTools](https://github.com/FanWangEcon/REconTools) repository.

From [Fan](https://fanwangecon.github.io/)'s other repositories: For dynamic borrowing and savings problems, see [Dynamic Asset Repository](https://fanwangecon.github.io/CodeDynaAsset/); For code examples, see also [R Example Code](https://fanwangecon.github.io/R4Econ/) ([bookdown site](https://fanwangecon.github.io/R4Econ/bookdown)), [Matlab Example Code](https://fanwangecon.github.io/M4Econ/) and [Stata Example Code](https://fanwangecon.github.io/Stata4Econ/); For intro econ with Matlab, see [Intro Mathematics for Economists](https://fanwangecon.github.io/Math4Econ/), and for intro stat with R, see [Intro Statistics for Undergraduates](https://fanwangecon.github.io/Stat4Econ/) ([bookdown site](https://fanwangecon.github.io/Stat4Econ/bookdown)). See [here](https://github.com/FanWangEcon) for all of [Fan](https://fanwangecon.github.io/)'s public repositories.

Please contact [FanWangEcon](https://fanwangecon.github.io/) for issues or problems.

[![](https://img.shields.io/github/last-commit/fanwangecon/REconTools)](https://github.com/FanWangEcon/REconTools/commits/master) [![](https://img.shields.io/github/commit-activity/m/fanwangecon/REconTools)](https://github.com/FanWangEcon/REconTools/graphs/commit-activity) [![](https://img.shields.io/github/issues/fanwangecon/REconTools)](https://github.com/FanWangEcon/REconTools/issues) [![](https://img.shields.io/github/issues-pr/fanwangecon/REconTools)](https://github.com/FanWangEcon/REconTools/pulls)

# Installation

This package contains tools used by various [projects](https://fanwangecon.github.io/research) that use R. To run code from various projects, need to install this package first.

```
# To Install the Programs in the R folder of the REconTools Repository
devtools::install_github("fanwangecon/REconTools")
```

# Table of Content for Selected Functions

Click on the [Functions](https://fanwangecon.github.io/REconTools/reference/index.html) tab to see all functions. Click on the [Guide Articles](https://fanwangecon.github.io/REconTools/articles/index.html) tab to see vignettes for a subset of functions. Vignettes for some functions are provided in the [R Example Code (R4Econ)](https://fanwangecon.github.io/R4Econ/) Example repository and linked to functions under function references. 

## 1. Arithmetics

### 1.1 Tabulate and Counting

1. [By Groups, Count Unique Individuals](https://fanwangecon.github.io/REconTools/reference/ff_summ_count_unique_by_groups.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_summ_count.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_summ_count_unique_by_groups.html) | vignette
    + By Groups, Count Unique Individuals and non-NA observations of other Variables.
    + **tidy**: *group_by + mutate_if + mutate + n_distinct + slice(1L)*

### 1.2 Averaging

1. [All Variables Summary Stats](https://fanwangecon.github.io/REconTools/reference/ff_summ_percentiles.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_summ_percentiles.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_summ_percentiles.html) | vignette
    + All Variables: N + NAcount + Mean + SD + Percentiles.
    + **tidy**: *summarise_if(is.numeric) + gather + separate + spread  + select*
2. [By Groups One Variable All Statistics](https://fanwangecon.github.io/REconTools/reference/ff_summ_bygroup.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_summ_bygroup.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_summ_bygroup.html) | [vignette](https://fanwangecon.github.io/REconTools/articles/fv_summ_bygroup.html)
    + One Variable: mean + median + sd + IQR + mad + min + max + first + last + n.distinct
    + The above statistics categorized by variable factors jointly
    + **tidy**: *map(ar_fl, !partial(quantile, probs = .x)) + set_names(nm = ar_st) + group_by + summarize_at(, funs()) + rename(!!var := !!sym(var)) + mutate(!!var := paste0(var,’str’,!!!syms(vars))) + gather + unite + spread(varcates, value)*

## 2. Panel

## 2.1 Wider or Longer

1. [Long Panel Duplicate One Variable to Wide](https://fanwangecon.github.io/REconTools/reference/ff_panel_expand_longandwide.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_panel_expand.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_panel_expand_longandwide.html) | [vignette](https://fanwangecon.github.io/REconTools/articles/fv_panel_expand_longandwide.html)
    + long panel var X, average X by within i t subgroups, expand avgX_{i,tgroup} to wide, merge to long panel
    + **tidy**: *group_by + summarise + spread + left_join*
2. [Long Roster to Wide Day and ID Roster with Cumsum](https://fanwangecon.github.io/REconTools/reference/ff_panel_expand_longrosterwide.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_panel_expand.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_panel_expand_longrosterwide.html) | [vignette](https://fanwangecon.github.io/R4Econ/panel/widelong/fs_pivotwider.html)
    + long panel record date of attendance for each id, expand to wide panel of cumulative attendance by dates
    + **tidy**: *pivot_wider + rename_at + mutate_at + list(~replace_na) + list(~cumsum)*


## 2.2 Statistcs by Dates

1. [Cumulative Stat Last Observation Across Individuals](https://fanwangecon.github.io/REconTools/reference/ff_panel_cumsum_grouplast.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_panel_cumsum.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_panel_cumsum_grouplast.html) | [vignette](https://fanwangecon.github.io/REconTools/articles/fv_panel_cumsum_grouplast.html)
    + Summing latest at current date SAT score from N individuals where dataframe contains all scores, dataframe by date, moving statistics with date.
    + **tidy**: *for (ctr) + data[1:ctr,] + groupby + slice(n()) + summarize*

## 3. Distributions

1. [Discrete Random Normal Variable](https://fanwangecon.github.io/REconTools/reference/ff_dist_integrate_normal.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_dist_integrate.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_dist_integrate_normal.html) | vignette
    + Discretized normal random variable with Trapezoidal rule.
2. [Compute Gini for a non-negative Vector](https://fanwangecon.github.io/REconTools/reference/ff_dist_gini_vector_pos.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_dist_gini.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_dist_gini_vector_pos.html) | [vignette](https://fanwangecon.github.io/REconTools/articles/fv_dist_gini_vector_pos.html)
    + Single line gini inequality formula.

## 4. Optimization

1. [Concurrent Bisection Different Parameters](https://fanwangecon.github.io/REconTools/reference/ff_opti_bisect_pmap_multi.html): [**r**](https://github.com/FanWangEcon/REconTools/blob/master/R/ff_opti_bisect.R) | [ref](https://fanwangecon.github.io/REconTools/reference/ff_opti_bisect_pmap_multi.html) | [vignette](https://fanwangecon.github.io/REconTools/articles/fv_opti_bisect_pmap_multi.html)
    + A strictly monotonic linear or nonlinear function with one root
    + A dataframe where each column is a different parameter for the function, and each row parameter values
    + Find roots for this function concurrently over all rows at the row specific parameters
    + **tidy**: *case_when + pmap*

----
Please contact [![](https://img.shields.io/github/followers/fanwangecon?label=FanWangEcon&style=social)](https://github.com/FanWangEcon) [![](https://img.shields.io/twitter/follow/fanwangecon?label=%20&style=social)](https://twitter.com/fanwangecon) for issues or problems.

![RepoSize](https://img.shields.io/github/repo-size/fanwangecon/REconTools)
![CodeSize](https://img.shields.io/github/languages/code-size/fanwangecon/REconTools)
![Language](https://img.shields.io/github/languages/top/fanwangecon/REconTools)
![Release](https://img.shields.io/github/downloads/fanwangecon/REconTools/total)
![License](https://img.shields.io/github/license/fanwangecon/REconTools)
