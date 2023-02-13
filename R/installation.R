#' Install fhswf package
#'
#' `install_fhswf()` installs required tinytex packages
#'
#' @export
install_fhswf <- function(){
  #
  tinytex::tlmgr_update()

  pkgs <- c("caption", "xpatch", "csquotes", "verbatimbox", "float","enumitem",
            "elsarticle","pdfcolmk","eurosym","paralist","sectsty","subfig",
            "lineno","algorithm2e","ifoddpage","relsize","setspace",
            "microtype","fp","ms","pgf","babel-english","biblatex",
            "logreq","grffile","bera","fancyhdr","titlesec","palatino",
            "mathtools","eukdate","textpos","grfext","fpl","mathpazo","biber",
            "colortbl", "wrapfig", "pdflscape", "xcolor", "multirow", "carlito")

  # pkgs <- c(pkgs, "ifdraft") # Package not present in any (?) TexLive Repo

  pkgs <- pkgs[!duplicated(pkgs)]
  pkgs <- sort(pkgs)

  tinytex::tlmgr_install(pkgs = pkgs)
}

#' Update fhswf package
#'
#' `update_fhswf()` updates fhswf package
#'
#' @export
update_fhswf <- function(){
  message("Updating the fhswf package...\n")
  remotes::install_github("profboecker/fhswf", dependencies = TRUE,
                          upgrade = TRUE, quiet = TRUE)

}
