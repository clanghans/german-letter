# german-letter
This is a German letter template using the g-brief tex package

## Installation under Linux Mint
Install following packages and its dependencies via *apt*
```
sudo apt install pdflatex texlive texlive-lang-english texlive-lang-german texlive-fonts-extra
```

## Workflow
The workflow is intended to be a true REPL (read-eval-print loop). By running
`make all` it will create the pdf and show it in an generic pdf-viewer
*xdg-open*. There you can have a look over your letter and fiddle with the TeX files.
And repeat...

### clean-up
Temporary files can be removed by running `make clean`.

### install
After you are happy with your letter you can run `make install` which moves the
pdf from the temporary folder and prepends a date to the document.
