#' @rdname seminarpaper
#' @export
render_seminarpaper <- function(...){

  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf")

  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "fhswf-seminarpaper", "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)

  rmarkdown::render(...)

  files <- c(files,list.files(pattern="\\.log"), list.files(pattern="\\.tex"))
  for (f in files)
    unlink(f, recursive = FALSE, force = FALSE)


}


#' @rdname presentation
#' @export
render_presentation <- function(...){

  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf", "titlepage.pdf")

  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "fhswf-presentation", "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)

  rmarkdown::render(...)

  files <- c(files,list.files(pattern="\\.log"), list.files(pattern="\\.tex"), list.files(pattern="\\.sty"))
  for (f in files)
    unlink(f, recursive = FALSE, force = FALSE)


}
