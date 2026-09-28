# sebvolz.github.io

Personal academic website of Sebastian Volz, built with [Academic Pages](https://github.com/academicpages/academicpages.github.io) (Jekyll). The CV PDF is built from LaTeX with [Awesome-CV](https://github.com/posquit0/Awesome-CV).

Live at <https://sebvolz.github.io>.

## Where things are

| What | File |
|---|---|
| Name, sidebar, links | `_config.yml` (`author:` section) |
| Homepage (bio, news) | `_pages/about.md` |
| CV web page | `_pages/cv.md` |
| CV PDF (LaTeX) | `cv/cv.tex` |
| Menu entries | `_data/navigation.yml` |
| Publications | `_publications/` (one Markdown file per paper; re-enable the menu entry in `_data/navigation.yml`) |
| Downloadable files | `files/` |

The CV exists twice: `_pages/cv.md` (web page, without grades) and `cv/cv.tex` (PDF). Update both when something changes.

## Local preview

```sh
make cv      # compile cv/cv.tex -> files/cv.pdf (uses the texlive/texlive Docker image)
make serve   # serve the site at http://localhost:4000 (live reload)
```

## Deployment

Every push to `main` runs `.github/workflows/deploy.yml`, which compiles the CV, builds the site and publishes it. The compiled PDF is never committed. Progress is shown in the repository's **Actions** tab.
