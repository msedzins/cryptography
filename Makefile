articles := asciidoc/article1/index.html
 
deploy: asciidoc/index.html
	git commit -a -m "New version"
	git push

asciidoc/index.html: asciidoc/index.asciidoc ${articles}
	asciidoctor asciidoc/index.asciidoc -o asciidoc/index.html
	cp $@ $(subst asciidoc,docs,$(@))

asciidoc/article%/index.html: asciidoc/article%/index.asciidoc
	asciidoctor $? -o $@
	cp $@ $(subst asciidoc,docs,$(@))
