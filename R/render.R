#' @rdname seminarpaper
#' @export
render_seminarpaper <- function(...){

  # Dateinamen aus der Vorlage sammeln
  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf")
  template_name <- "fhswf-seminarpaper"
  
  # .. und Vorlagendateien in das Arbeitsverzeichnis kopieren
  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", template_name, "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)

  # render using rmarkdown
  rmarkdown::render(...)

  # remove unnecessary files
  files <- c(files,list.files(pattern="\\.log"), list.files(pattern="\\.tex"))
  for (f in files)
    unlink(f, recursive = FALSE, force = FALSE)

}



#' @rdname presentation
#' @export
render_presentation <- function(...){
  
  # Dateinamen aus der Vorlage sammeln
  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf", "titlepage.pdf")
  template_name <- "fhswf-presentation"
  
  # .. und Vorlagendateien in das Arbeitsverzeichnis kopieren
  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", template_name, "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)

  # render using rmarkdown
  rmarkdown::render(...)

  # remove unnecessary files
  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf", "titlepage.pdf")
  files <- c(files, 
             list.files(pattern="\\.log"), 
             list.files(pattern="\\.tex"), 
             list.files(pattern="\\.sty"), 
             list.files(pattern="\\_cache"), 
             list.files(pattern="\\_files"))
  for (f in files)
    unlink(f, recursive = FALSE, force = FALSE)

}



#' @rdname exercises
#' @export
render_exercises <- function(...){
  
  # Dateinamen aus der Vorlage sammeln
  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf")
  template_name <- "fhswf-exercises"
  
  # .. und Vorlagendateien in das Arbeitsverzeichnis kopieren
  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", template_name, "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)
  
  # render using rmarkdown
  rmarkdown::render(...)
  
  # remove unnecessary files
  files <- c(files,list.files(pattern="\\.log"), list.files(pattern="\\.tex"))
  for (f in files)
    unlink(f, recursive = TRUE, force = FALSE)
  
}