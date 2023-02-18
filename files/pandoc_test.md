% Author
% My title
% June 15, 2006
## Metadata

## Definitions
:   Definition 1

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

## Lineblocks for Formatting

| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical

| 200 Main St.
| Berkeley, CA 94718

## Nicer Tables

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

## Joining Multiple Files 
```bash
pandoc chap1.md chap2.md chap3.md metadata.yaml -s -o book.html
```
### On Meta Data and really nice stuff 
[Stuff on Extra Formatting -> Abstracts etc. ]( https://pandoc.org/MANUAL.html#extension-yaml_metadata_block )

YAML file like this: 
``` yaml
---
title:  'This is the title: it contains a colon'
author:
- Author One
- Author Two
keywords: [nothing, nothingness]
abstract: |
  This is the abstract.

  It consists of two paragraphs.
...
```
Just compile it with the other stuff see Joining Multiple Files

## Footnotes

Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.
[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first
    line.  In this way, multi-paragraph footnotes work like
    multi-paragraph list items.

## Citations 

For citing use [@Haller] or [@Mandel2009; @Soskice2005]

Or:   
Blah blah [see @Haller, pp. 33-35].

```bash
pandoc test.md test.yaml --bibliography=literature.bib --citeproc -o test.pdf
```

Citation styles via the `--csl` flag

## Emojis 

:grimacing: 
```bash
pandoc test.md -f markdown+emoji -o test.html
# Using pdf out raises error cuz latex 
```
## Slideshow 

To produce an HTML/JavaScript slide show, simply type

```bash 
pandoc -t FORMAT -s habits.txt -o habits.html
# with theme
pandoc -t beamer habits.txt -V theme:Warsaw -o habits.pdf
```
where FORMAT is either s5, slidy, slideous, dzslides, or revealjs.

Speaker Notes: 
```pandoc
::: notes

This is my note.

- It can contain Markdown
- like this list

:::
```
### Linking HTML files 
pandoc -t chunkedhtml will produce a zip archive of linked HTML files, one for each section of the original document. Internal links will automatically be adjusted to point to the right place, images linked to under the working directory will be incorporated, and navigation links will be added. In addition, a JSON file sitemap.json will be included describing the hierarchical structure of the files.


## Formatting 

Using Latex Varibles  -> can go into yaml file

```latex
---
documentclass: article
header-includes: |
  \RedeclareSectionCommand[
    beforeskip=-10pt plus -2pt minus -1pt,
    afterskip=1sp plus -1sp minus 1sp,
    font=\normalfont\itshape]{paragraph}
  \RedeclareSectionCommand[
    beforeskip=-10pt plus -2pt minus -1pt,
    afterskip=1sp plus -1sp minus 1sp,
    font=\normalfont\scshape,
    indent=0pt]{subparagraph}
...
%relevant:

indent
font 
afterskip 
papersize
linestretch % -> linespacing
margin-left, margin-right, margin-top, margin-bottom
fontsize
toc, toc-depth
biblatexoptions
linestretch: 1.5
geometry:
- top=30mm
- left=30mm
- bottom=30mm
- right=30mm
```

## Including Stuff 
test bla bla   

\begin{center}
  \input{regression.tex}
\end{center}

test bla bla   
pasdlj asjhdalsdjh Lkjh
asjkdlah

## NOTE: 

You can compile to tex!!! -> Easy work hack

Using this and compile extension: `-f markdown+fenced_divs`
```
::: Warning ::::::
This is a warning.

::: Danger
This is a warning within a warning.
:::
::::::::::::::::::
```
::: Warning ::::::
This is a warning.

::: Danger
This is a warning within a warning.
:::
::::::::::::::::::

Note: I dont get this yet

## Ressources 

Great Note Taking Setup
https://www.youtube.com/watch?v=zB_3FIGRWRU
