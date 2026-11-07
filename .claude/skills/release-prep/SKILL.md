---
name: release-prep
description: Prepare a fhswf release - check the yyyy.mm.subversion version, bump DESCRIPTION, add a NEWS.md entry, run devtools::check()
disable-model-invocation: true
---

# Release prep for fhswf

Follow `AGENTS.md` ("Gotchas" → Versioning and CRAN). Do not commit or push
unless the user asks.

1. **Version**: Read the `Version:` field in `DESCRIPTION`. Today's date
   determines the target: `yyyy.mm.subversion` with the current year and
   calendar month. If the month in the current version matches today, increment
   the subversion (e.g. `2026.11.1` → `2026.11.2`). Otherwise start at `.1`.
   Ask the user to confirm the new version before editing.
2. **DESCRIPTION**: Set the new `Version:`. Leave `RoxygenNote` unchanged.
3. **NEWS.md**: Add a top entry for the new version. Summarise the changes since
   the last release using `git log <last-release-commit>..HEAD --oneline` and the
   diff. Match the existing style in `NEWS.md`. Keep the text in the language
   the existing entries use.
4. **Check**: Run `Rscript -e 'devtools::check()'` and report the NOTEs, WARNINGs
   and ERRORs verbatim. Do not claim success if the check reports problems.
5. **cran-comments.md**: Mention in the final report that this file still needs
   to be filled in before submission. Do not write it without asking.

Report the new version, the changed files, and the check result.
