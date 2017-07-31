# Structured data curriculum vitae

Produces my CV in various formats from a `bibtex` bibliography database and a `yaml` file containing non-publication data, using `pandoc` templates.

This is based on [Benjamin Schmidt's CV-pandoc-healy](https://github.com/bmschmidt/CV-pandoc-healy). See additional info there.

Major changes to bschmidt's setup:

1. Obvs, it's my CV and not his; so there's different sections and organization.
1. Also generate CV in other formats (eg, MarkDown).
1. Bibliography is done using `biblatex`, using keywords instead of categories
   (see `r-vita.sty`).

