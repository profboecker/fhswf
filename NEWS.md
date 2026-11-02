# fhswf 2026.11.1

* All PDF output formats (`presentation()`, `seminarpaper()`, `exercises()`)
  now default to LuaLaTeX. pdfLaTeX remains available via
  `latex_engine = "pdflatex"`.
* Templates now use Babel for all engines (Pandoc 3 no longer populates the
  `polyglossia-*` variables) and guard `\theHtable` against an existing
  definition. The seminar paper and exercise templates select OpenType font
  equivalents under LuaLaTeX/XeLaTeX; `install_fhswf()` installs the required
  font packages.
* Fixed the exercise template failing to parse because of an unescaped
  `$if(german)$` inside a LaTeX comment.
* Fixed `render_presentation()` (and `render_seminarpaper()` /
  `render_exercises()`) failing with "Objekt 'files' nicht gefunden"
  during cleanup. `rmarkdown::render()` evaluates document code chunks
  in `parent.frame()` by default, i.e. inside the wrapper function's
  own frame; code in the rendered document (e.g. `rm(list = ls())` in
  a setup chunk) could therefore wipe out the wrapper's local `files`
  variable before cleanup ran. Rendering now always uses an isolated
  environment unless the caller explicitly supplies `envir`.
