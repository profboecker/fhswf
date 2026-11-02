# AGENTS.md

`fhswf` is an R package (not an app) with course materials for FH Südwestfalen:
RMarkdown/LaTeX output formats (Beamer presentation, seminar paper, exercise
sheets), their templates, and a few helpers. There is no CI and no build
system beyond standard R tooling.

## Layout

- `R/fhswf.R` — output formats `presentation()`, `seminarpaper()`, `exercises()`
- `R/render.R` — `render_*()` knit wrappers that copy template assets and clean up
- `R/statistik.R` — `sd_pop()` (population SD); the only statistical helper
- `R/installation.R` — `install_fhswf()` (TinyTeX packages), `update_fhswf()`
- `inst/rmarkdown/templates/fhswf-{presentation,seminarpaper,exercises}/` — RMarkdown skeletons, LaTeX resources, `.sty` files
- `man/`, `NAMESPACE` — roxygen2 8.0.0 output; do not edit by hand

## Commands

- Test suite: `Rscript -e 'devtools::test()'` (testthat edition 3)
- One test file: `Rscript -e 'testthat::test_file("tests/testthat/test-fhswf.R")'`
- Regenerate `NAMESPACE`/`man/` after changing `#'` roxygen comments: `Rscript -e 'devtools::document()'`
- Full package check: `Rscript -e 'devtools::check()'`
- Install locally: `Rscript -e 'devtools::install()'`
- LaTeX deps for PDF rendering: `Rscript -e 'fhswf::install_fhswf()'`

## Gotchas

- Template assets are resolved with `system.file(..., package = "fhswf")`. Edits under
  `inst/rmarkdown/templates/**` are not visible to an installed package until you
  reinstall (`devtools::install()`); `devtools::load_all()` does shim `system.file`.
- Rendering PDFs needs a TeX installation plus the packages listed in
  `install_fhswf()`. Tests do not render documents, so rendering changes need
  manual verification.
- The templates invoke `render_presentation()`, `render_seminarpaper()`, or
  `render_exercises()` through their YAML `knit:` field. These wrappers copy
  skeleton assets into the current working directory and delete generated files
  afterwards; the cleanup is intentional.
- Keep `.render_isolated()` wrapping every `rmarkdown::render()` call. The default
  `envir = parent.frame()` lets a setup chunk such as `rm(list = ls())` delete the
  wrapper's `files` variable and crash cleanup (see `NEWS.md`).
- Versioning is `yyyy.mm.subversion` (e.g. `2026.11.1`): use the current year and
  calendar month, and increment the subversion for additional changes in the same
  month. For releases, bump `DESCRIPTION` and add a `NEWS.md` entry.
- CRAN submission is planned for later; there is no prior submission to preserve
  or compare against. Before submitting, run `devtools::check()` and fill in
  `cran-comments.md`. `.Rbuildignore` excludes dev-only files such as `.claude`,
  `cran-comments.md`, and `AGENTS.md`.
- All PDF formats default to **LuaLaTeX** (`latex_engine = "lualatex"`);
  `latex_engine = "pdflatex"` or `"xelatex"` still works. The templates use Babel
  rather than Pandoc's obsolete `polyglossia-*` variables and guard `\theHtable`;
  the seminar paper and exercise templates pick OpenType fonts in the non-pdfTeX
  branch. `fhswf.Rproj`'s `LaTeX: LuaLaTeX` now matches the defaults.
- `presentation()` applies the LaTeX engine directly; `seminarpaper()` and
  `exercises()` expose it as a named argument forwarded to
  `bookdown::pdf_document2()`.
- Rendering was verified manually with LuaLaTeX for all three skeletons. The
  exercise template previously failed to parse because `$if(german)$` appeared
  unescaped in a comment; use `$$if(german)$$` in LaTeX comments.
- Course material text, code comments, and tests are largely German; keep that
  language when editing templates and test descriptions.
