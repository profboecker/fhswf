##' Templates for RMarkdown-based Beamer PDF presentations supporting
##' the \sQuote{Metropolis} style by Matthias Vogelgesang and others,
##' the \sQuote{IQSS} style by Ista Zahn and Gary King,
##' and the \sQuote{Monash} style by Rob J Hyndman.
##'
##' Note that not all options and customizations available at the LaTeX
##' level are implemented or supported yet.  A number of styling options
##' could be exposed by setting YAML meta-data in the header for either
##' style. This needs more testing and documentation.
##'
##' @title Binb is not Beamer - PDF Presentation Themes
##'
##' @param toc A logical variable defaulting to \code{FALSE}.
##' @param slide_level A numeric variable defaulting to two for
##' \sQuote{Metropolis} and \sQuote{Monash}, and three for \sQuote{IQSS}.
##' @param incremental A logical variable defaulting to \code{FALSE}.
##' @param fig_width A numeric variable defaulting to ten.
##' @param fig_height A numeric variable defaulting to seven.
##' @param fig_crop A logical variable defaulting to \code{TRUE}.
##' @param fig_caption A logical variable defaulting to \code{TRUE}.
##' @param dev A character variable defaulting to \dQuote{pdf}.
##' @param df_print A character variable defaulting to \dQuote{default}.
##' @param fonttheme A character variable defaulting to \dQuote{default}.
##' @param colortheme For the \sQuote{Monash} theme only. A character variable defaulting to \dQuote{monashwhite}.
##' @param highlight A character variable defaulting to \dQuote{tango}.
##' @param keep_tex A logical variable defaulting to \code{FALSE}.
##' @param latex_engine A character variable defaulting to \dQuote{xelatex}.
##' @param citation_package An optional character variable with possible value
##' \dQuote{default}, \dQuote{natbib} (the default), or \dQuote{biblatex}.
##' @param includes An optional character variable defaulting to \code{NULL}.
##' @param md_extensions An optional character variable defaulting to \code{NULL}.
##' @param pandoc_args An optional character variable defaulting to \code{NULL}.
##' @param ... diverse other parameters
##'
##' @section IQSS Details: We currently set \code{slide_level} to three to use
##' the same appearance as the LaTeX demo. This means section and sub-section headers
##' use one and two hash marks, new slides use three, and \dQuote{box} environments
##' start with four. More commonly, Beamer theme use two and work without subsections.
##'
##' @seealso Three other packages also offer RMarkdown interfaces to LaTeX
##' (or HTML) content: \code{\link[tint]{tint}} for Tufte-style pdf and html,
##' \code{\link[pinp]{pinp}} for two-column pdf vignettes, and
##' \code{\link[linl]{linl}} for LaTeX letters.
##'
##' @return RMarkdown content processed is returned for use by the
##' \code{\link[rmarkdown]{render}} function but the function is invoked
##' for it side effect of creating the pdf file.
##'
##' @author Dirk Eddelbuettel
##'
##' @rdname presentation
##' @export
presentation <- function(toc = FALSE,
                   slide_level = 2,
                   incremental = FALSE,
                   fig_width = 8,
                   fig_height = 5,
                   fig_crop = TRUE,
                   fig_caption = TRUE,
                   dev = 'pdf',
                   df_print = "default",
                   fonttheme = "default",
                   colortheme = "fhswfwhite",
                   highlight = "tango",
                   keep_tex = FALSE,
                   latex_engine = "pdflatex",
                   citation_package = c("default", "natbib", "biblatex"),
                   includes = NULL,
                   md_extensions = NULL,
                   pandoc_args = NULL) {

  fcolortheme <- paste0("beamercolortheme", colortheme, ".sty")
  for (f in c("beamerfontthemefhswf.sty", fcolortheme,
              "beamerthemefhswf.sty", "titlepage.pdf", "figs/"))
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "fhswf-presentation",
                            "skeleton", f, package="fhswf"),
                ".", recursive=TRUE)

  template <- system.file("rmarkdown", "templates", "fhswf-presentation",
                          "resources", "template.tex",
                          package="fhswf")

  fmt <- rmarkdown::beamer_presentation(template = template,
                                 toc = toc,
                                 slide_level = slide_level,
                                 incremental = incremental,
                                 fig_width = fig_width,
                                 fig_height = fig_height,
                                 fig_crop = fig_crop,
                                 fig_caption = fig_caption,
                                 dev = dev,
                                 df_print = df_print,
                                 theme = "fhswf",
                                 colortheme = colortheme,
                                 fonttheme = fonttheme,
                                 highlight = highlight,
                                 keep_tex = keep_tex,
                                 latex_engine = latex_engine,
                                 citation_package = citation_package,
                                 includes = includes,
                                 md_extensions = md_extensions,
                                 pandoc_args = pandoc_args)


  # Based on: https://stackoverflow.com/questions/25646333/code-chunk-font-size-in-rmarkdown-with-knitr-and-latex

  fmt$knitr$knit_hooks$size = function(before, options, envir) {
    if (before) {
      return(paste0("\n \\", options$size, "\n\n"))
    }else{
      return("\n\n \\normalsize \n")
    }
  }

  return(fmt)

}


##' @title Seminar Paper PDF Themes
##' @seealso Three other packages also offer RMarkdown interfaces to LaTeX
##' (or HTML) content: \code{\link[tint]{tint}} for Tufte-style pdf and html,
##' @author Stefan Böcker
##'
##' @param ... divers parameters
##' @rdname seminarpaper
##' @export
seminarpaper <- function(...) {
  template <- system.file("rmarkdown/templates/fhswf-seminarpaper/resources/fhswf-seminarpaper.tex",
                          package="fhswf")
  bookdown::pdf_document2(...,
                          template = template
  )
}


# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  fmt
}


##' @title Exercise Sheets PDF Themes
##' @seealso Three other packages also offer RMarkdown interfaces to LaTeX
##' (or HTML) content: \code{\link[tint]{tint}} for Tufte-style pdf and html,
##' @author Stefan Böcker
##'
##' @param ... divers parameters
##' @rdname exercises
##' @export
exercises <- function(...) {
  template <- system.file("rmarkdown/templates/fhswf-exercises/resources/fhswf-exercises.tex",
                          package="fhswf")
  bookdown::pdf_document2(...,
                          template = template
  )
}


# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  fmt
}




knitr_fun <- function(name) utils::getFromNamespace(name, 'knitr')

output_asis <- knitr_fun('output_asis')
