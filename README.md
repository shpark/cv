# Structured data curriculum vitae

Produces my CV in various formats from a `bibtex` bibliography
database and a `yaml` file containing non-publication data, using
`pandoc` templates.

This is based on [Benjamin Schmidt's
CV-pandoc-healy](https://github.com/bmschmidt/CV-pandoc-healy). See
additional info there.

Major changes to bschmidt's setup:

1. Obvs, it's my CV and not his; so there's different sections and organization.
1. Also generate CV in other formats (eg, MarkDown).
1. Bibliography is done using `biblatex`, using keywords instead of categories
   (see `rz-vita.sty`).
1. Bibliography includes links to [PhilPapers](https://philpapers.org/)
1. Bibliography also prints number of Google Scholar
   citations. `zach.bib` contains `scholar` fields that contains the
   Google Scholar cluster ID corresponding to an entry. The Makefile
   produces a file `cv-zach-scholar.tex` from this. It issues, for
   each entry that has citations, a command `\defscholar{<clusterid>}{<citations>}`. 
   It is generated in the Makefile using a little script `citecounts`, 
   which in turn uses [scholar.py](https://github.com/ckreibich/scholar.py) to query
   Google Scholar. `rz-vita.sty` loads that file and prints the
   citations.

`scholar.py` is included as a submodule. After you clone this
repository, you also have to say
```
$ git submodule init
$ git submodule update
```

To get find the Google Scholar cluster ID, click on the "cited by x"
link for the paper in Google Scholar. It'll take you to an URL like
```
https://scholar.google.ca/scholar?cites=5523213711320200321&as_sdt=2005&sciodt=0,5&hl=en
```
The cluster ID is the number after `cites=`. If Google Scholar has
more than one version for it, put all the cluster IDs in the `scholar`
field, separated by commas _but no spaces_.
