.PHONY: knit build serve clean

# Render all R Markdown files to Jekyll posts
knit:
	cd _knitr && Rscript render.R

# Build the Jekyll site (renders R Markdown first)
build: knit
	bundle exec jekyll build

# Serve the site locally (renders R Markdown first)
serve: knit
	bundle exec jekyll serve

# Serve without re-rendering R Markdown
serve-only:
	bundle exec jekyll serve

# Clean generated files
clean:
	rm -rf _site .jekyll-cache
