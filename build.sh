pandoc src/markdown/spring-mvc-aop-log.md -o build/latex/spring-mvc-aop-log.tex
cp src/format.cls build/
cp src/main.tex build/
xelatex build/main.tex
cp *.pdf build/
