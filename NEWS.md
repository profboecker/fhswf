# fhswf 2026.8.1

* Fixed `render_presentation()` (and `render_seminarpaper()` /
  `render_exercises()`) failing with "Objekt 'files' nicht gefunden"
  during cleanup. `rmarkdown::render()` evaluates document code chunks
  in `parent.frame()` by default, i.e. inside the wrapper function's
  own frame; code in the rendered document (e.g. `rm(list = ls())` in
  a setup chunk) could therefore wipe out the wrapper's local `files`
  variable before cleanup ran. Rendering now always uses an isolated
  environment unless the caller explicitly supplies `envir`.

# fhswf 2026.8.0

# fhswf 2026.07.07

## Initial CRAN submission

* Development version ready for testing.
