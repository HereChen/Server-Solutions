markdown_to_latex() {
    mkdir build/latex
    pandoc src/markdown/*.md -o build/latex/content.tex
    cp src/latex/format.cls build/latex/
    cp src/latex/main.tex build/latex/
}

latex_to_pdf(){
    mkdir build/pdf
    xelatex  build/latex/main.tex
    xelatex  build/latex/main.tex
    cp *.pdf build/pdf/
}

main() {
    markdown_to_latex
    latex_to_pdf
}

main
