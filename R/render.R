# Helper: Vorlagendateien ins Arbeitsverzeichnis kopieren und nach dem Render aufräumen
.copy_template_files <- function(files, template_name) {
  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", template_name, "skeleton",
                            f, package = "fhswf"),
                ".", recursive = TRUE)
}

.remove_files <- function(files, patterns = c("\\.log$", "\\.tex$")) {
  extra <- unlist(lapply(patterns, function(p) list.files(pattern = p)))
  for (f in unique(c(files, extra)))
    unlink(f, recursive = TRUE, force = FALSE)
}


#' @rdname seminarpaper
#' @export
render_seminarpaper <- function(...) {
  files <- c("WirGebenImpulse.pdf", "FHSWF.pdf")
  template_name <- "fhswf-seminarpaper"

  .copy_template_files(files, template_name)
  rmarkdown::render(...)
  .remove_files(files)
}


#' @rdname presentation
#' @export
render_presentation <- function(...) {
  files <- c("WirGebenImpulse.pdf", "FHSWF.pdf", "titlepage.pdf")
  template_name <- "fhswf-presentation"

  .copy_template_files(files, template_name)
  rmarkdown::render(...)
  .remove_files(files, patterns = c("\\.log$", "\\.tex$", "\\.sty$", "_cache$", "_files$"))
}


#' @rdname exercises
#' @export
render_exercises <- function(...) {
  files <- c("WirGebenImpulse.pdf", "FHSWF.pdf")
  template_name <- "fhswf-exercises"

  .copy_template_files(files, template_name)
  rmarkdown::render(...)
  .remove_files(files)
}
