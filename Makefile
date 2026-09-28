# Local preview helpers. On GitHub, .github/workflows/deploy.yml does the same on every push.
#
#   make cv       compile cv/cv.tex -> files/cv.pdf (in the TeX Live Docker image used by CI)
#   make serve    install gems (first run only) and serve the site at http://localhost:4000
#   make clean    remove build output

TEXLIVE_IMAGE = texlive/texlive:latest

.PHONY: cv serve install clean

cv:
	mkdir -p files cv/build .texcache
	docker run --rm -u $$(id -u):$$(id -g) \
		-v "$(CURDIR)":/work -w /work/cv \
		-e HOME=/tmp -e TEXMFVAR=/work/.texcache \
		$(TEXLIVE_IMAGE) \
		latexmk -lualatex -interaction=nonstopmode -halt-on-error -outdir=build cv.tex
	cp cv/build/cv.pdf files/cv.pdf

install:
	bundle config set --local path vendor/bundle
	bundle install

serve: install
	bundle exec jekyll serve -l -H localhost

clean:
	rm -rf _site cv/build files/cv.pdf .jekyll-cache
