#' NGL HTML Widget
#'
#' Protein structure viewer HTML widget
#'
#' @import htmlwidgets
#'
#' @export
ngl <- function(pdbfile, width = NULL, height = NULL, elementId = NULL) {

  data <- paste(readLines(pdbfile), collapse="\n")
  # forward options using x
  x = list(
    data
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'ngl',
    x,
    width = width,
    height = height,
    package = 'ngl',
    elementId = elementId
  )
}

#' Shiny bindings for ngl
#'
#' Output and render functions for using ngl within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a ngl
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name ngl-shiny
#'
#' @export
nglOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'ngl', width, height, package = 'ngl')
}

#' @rdname ngl-shiny
#' @export
renderNgl <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, nglOutput, env, quoted = TRUE)
}
