---
title: krok4tcl - diagram converter for tcl using the kroki webservice
author: Detlef Groth
date: <230129.0928>
---

# kroki4tcl - diagram converter for tcl using the kroki webservice

Converts diagram code into kroki URL's and back.

The package *kroki4tcl* takes diagram code for diagram languages like
GraphViz, PlantUML, Ditaa or Pikchr and converts this into Kroki-URL's.
It can as well backtranslate such URL's into the diagram code.

## Procedures

**kroki4tcl::dia2file** *infile outfile*

  Encodes the given diagram file into a image file the diagram type
  and the image type are guessed on the given file extensions.

  This function requires the wget executable being in the PATH and
  for some cvombinations of diagrams and output format the cairosvg
  executable being in the path.

  Arguments:

  * _infile_  - diagram file
  * _outfile_ - image file with extension png, pdf or svg

  Returns: diagram code (text)

  Example:

  ```
  kroki4tcl::dia2file test.pml test.png
  ```


**kroki4tcl::dia2kroki** *text ?dia dia? ?ext ext?*

> Encodes the given diagram text into a kroki URL.

> Arguments:

> * _text_ - diagram code
  * _dia_  - diagram type such as graphviz, plantuml, erd, ditaa, default: graphviz
  * _ext_  - file extension such as svg, png, pdf, default: png

> Returns: kroki URL (text)

> Example:

  ```
  % kroki4tcl::kroki2dia "class A { }" plantuml png
  https://kroki.io/plantuml/svg/eNpLzkksLlZwVKiuBQAUCgOQ
  ```

**kroki4tcl::file2kroki** *filename*

> Encodes the given diagram file into a kroki URL based on the
  file extension or the given diagram type.

> Arguments:

> * _url_ - kroki URL
  * _dia_ - the diagram type, if not given it is guessed from the foile extension, defaults to ""
  * _ext_ - the image file extension, either png, pdf or svg, default: png

> Returns: diagram code (text)

> Example:

> ```
  % kroki4tcl::file2kroki test.pml
> ```

**kroki4tcl::kroki2dia** *url*

> Encodes the given kroki URL back to diagram text.

> Arguments:

> * _url_ -  kroki URL

> Returns: diagram code (text)

> Example:

> ```
  % kroki4tcl::kroki2dia https://kroki.io/plantuml/svg/eNpLzkksLlZwVKiuBQAUCgOQ
  class A { }
> ```

**kroki4tcl::gui** *?path?*

> Initializes a graphical user interface for creating
  diagrams within the given widget *path*


## CHANGELOG

* 2023-01-29 - version 0.4.0 moved to own repo and docu updates

## AUTHOR

Detlef Groth, Caputh-Schwielowsee

## LICENSE

BSD 3-Clause "New" or "Revised" License

