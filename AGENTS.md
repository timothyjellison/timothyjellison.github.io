# AGENTS.md

## Project overview

This repository is Timothy J. Ellison's personal blog and home page:
[`timothyjellison.github.io`](https://github.com/timothyjellison/timothyjellison.github.io).
It is a small [Jekyll](https://jekyllrb.com/) site hosted by GitHub Pages. The
site uses the Minima theme, with local styles in `assets/main.scss`, and the
`jekyll-feed` plugin for the RSS feed.

The repository is the source and deployment repository. The generated site in
`_site/` is tracked in Git and has historically been committed with source
changes. Preserve that convention when preparing a change for publication.

## Repository layout

- `_posts/` contains blog posts. Filenames must use Jekyll's
  `YYYY-MM-DD-title.md` convention.
- `_posts/yyyy-mm-dd-template.md` is the starting point for a new post.
- `index.markdown` is the home page content.
- `404.html` is the custom not-found page.
- `assets/main.scss` imports Minima's styles and contains the site's custom
  dark pink-and-green color palette and syntax highlighting overrides.
- `_config.yml` contains site metadata, theme/plugin configuration, and build
  exclusions. Changes to it require restarting the local Jekyll server.
- `Gemfile` and `Gemfile.lock` define the Ruby/Jekyll dependencies.
- `start.sh` starts the local server and opens the site in the default browser.
- `_site/` is the generated output and is intentionally tracked.
- `AGENTS.md` contains instructions for coding agents and is excluded from the
  generated public site.

## Local development

Use the locked dependencies when running Jekyll:

```bash
bundle install
./start.sh
```

The site is served at <http://127.0.0.1:4000/>. `start.sh` runs
`bundle exec jekyll serve` and opens that URL on macOS. To run the server
without opening a browser, use:

```bash
bundle exec jekyll serve
```

Build the site without starting a server with:

```bash
bundle exec jekyll build
```

Jekyll regenerates `_site/` during a build. Review the generated changes before
committing them. `bundle exec jekyll doctor` is a useful configuration check.
The current configuration leaves `url` empty, so `jekyll doctor` may warn
about the site URL; that warning is existing configuration, not a build
failure.

## Writing and editing content

Create a post by copying `_posts/yyyy-mm-dd-template.md` and renaming it to
the publication date and a URL-friendly title. Keep the YAML front matter at
the top of the file. Posts currently use the `home` layout and commonly set
`title`, `subtitle`, and `tags`:

```yaml
---
layout: home
title: A post title
subtitle: A short description
tags:
  - example
---
```

Use Markdown for post content. Check links, image URLs, code blocks, and the
rendered page locally. The current site includes externally hosted images in
some posts, so avoid replacing those URLs casually.

For visual or layout changes, edit `assets/main.scss` and inspect the home
page, a post page, the feed, and the 404 page locally. Do not edit generated
HTML or CSS in `_site/` by hand; regenerate it from the source instead.

## Deployment flow

There is currently no GitHub Actions workflow in this repository. The Git
remote is `origin`, pointing at the GitHub repository, and the primary branch
is `main`. GitHub Pages is expected to publish this repository through the
repository's Pages configuration. Confirm the configured source under
**Settings → Pages** if deployment behavior is unclear.

The normal publication flow is:

1. Make source changes in the Markdown, SCSS, configuration, or supporting
   files.
2. Run the local server and inspect the result.
3. Run `bundle exec jekyll build` to regenerate `_site/`.
4. Review both source and generated changes with `git diff` and
   `git status`.
5. Commit the source changes and the corresponding generated `_site/` changes
   on `main`.
6. Push `main` to `origin` and verify the published site and RSS feed.

Do not assume that a change is deployed merely because a local build passed.
Deployment depends on the GitHub Pages source configured for the repository.
Do not force-push or rewrite branch history as part of routine site updates.

## Agent guidance

- Read the relevant source file and nearby content before editing.
- Keep changes small and consistent with the existing simple Jekyll structure.
- Preserve post front matter and filename dates unless the task explicitly asks
  for a URL or publication-date change.
- Treat `_site/` as derived output: regenerate it after source changes and
  include the resulting changes, rather than manually patching it.
- Do not add a JavaScript framework, build system, or new plugin for a small
  content or styling change.
- Avoid committing secrets, credentials, local caches, editor metadata, or
  unrelated generated files.
- Before handing off a change, run at least `bundle exec jekyll build` and
  inspect the resulting diff. Use `bundle exec jekyll doctor` when changing
  configuration or dependencies.
