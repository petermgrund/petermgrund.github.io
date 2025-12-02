#!/usr/bin/env Rscript

# R Markdown to Jekyll Posts Renderer
# Usage: cd _knitr && Rscript render.R
# Or to render a specific file: Rscript render.R 2025-12-01-my-post.Rmd

library(knitr)

# Set directories
base_dir <- normalizePath("..")
knitr_dir <- file.path(base_dir, "_knitr")
posts_dir <- file.path(base_dir, "_posts")
fig_dir <- file.path(base_dir, "assets", "images", "knitr")

# Create fig directory if needed
dir.create(fig_dir, recursive = TRUE, showWarnings = FALSE)

# Get files to render (either from args or all .Rmd files)
args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) {
  rmd_files <- file.path(knitr_dir, args)
} else {
  rmd_files <- list.files(knitr_dir, pattern = "\\.Rmd$", full.names = TRUE)
}

if (length(rmd_files) == 0) {
  message("No .Rmd files found in ", knitr_dir)
  quit(status = 0)
}

for (rmd_file in rmd_files) {
  if (!file.exists(rmd_file)) {
    warning("File not found: ", rmd_file)
    next
  }

  # Output filename: 2024-01-01-post-name.Rmd -> 2024-01-01-post-name.md
  base_name <- tools::file_path_sans_ext(basename(rmd_file))
  output_file <- file.path(posts_dir, paste0(base_name, ".md"))

  # Create post-specific figure directory
  post_fig_dir <- file.path(fig_dir, base_name)
  dir.create(post_fig_dir, recursive = TRUE, showWarnings = FALSE)

  # Set knitr options
  opts_knit$set(
    base.url = "/",
    root.dir = base_dir
  )
  opts_chunk$set(
    fig.path = paste0("assets/images/knitr/", base_name, "/"),
    fig.width = 8,
    fig.height = 5,
    dpi = 150,
    message = FALSE,
    warning = FALSE,
    cache = FALSE
  )

  # Render the file
  tryCatch({
    knit(input = rmd_file, output = output_file)
    message("Rendered: ", basename(rmd_file), " -> ", basename(output_file))
  }, error = function(e) {
    warning("Failed to render ", rmd_file, ": ", e$message)
  })
}

message("Done! Generated files are in ", posts_dir)
