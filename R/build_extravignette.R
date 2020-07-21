#' Build optional vignette once the package is installed
#'
#' This function aims at creating vignettes after the package installation.
#' @export
#' @examples
#' search()
#' build_extravignette()
#'
build_extravignette <- function() {

  ## The vignette source files are stored in different places depending on whether one
  ## uses the installed version of the package or the one loaded with devtools during
  ## the development of the package. We thus try both:
  path1 <- paste0(find.package("testenvrmarkdown"), "/inst/extdata/")
  path2 <- paste0(find.package("testenvrmarkdown"), "/extdata/")

  if (dir.exists(path1)) {
    path <- path1
  }
  if (dir.exists(path2)) {
    path <- path2
  }
  path_complete <- normalizePath(paste0(path, "vignette_test", ".Rmd"), mustWork = TRUE)

  ## Create a clean environment:
  vignette_env <- new.env(parent = as.environment("package:stats"))

  ## Rendering the vignette
  vignette_path <- rmarkdown::render(path_complete, quiet = TRUE, envir = vignette_env)

  ## We open the vignette:
  utils::browseURL(vignette_path)

  ## We return the path:
  invisible(vignette_path)
}

#' A simple function
#'
#' @export
hello <- function() print("hello world")
