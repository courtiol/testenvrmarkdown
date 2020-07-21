This is a testing package to study an issue concerning environment handling in **{rmarkdwown}**

See:

- [see community.rstudio.com](https://community.rstudio.com/t/scoping-environment-struggle-in-r-markdown/70709/)
- [github issue](https://github.com/rstudio/rmarkdown/issues/1853)

Reprex:

```{r}
remotes::install_github("courtiol/testenvrmarkdown")
library(testenvrmarkdown)
build_extravignette()
```
