# personal-website

A simple personal website for Cristiano Ulondu Mendes.

## Local preview

From the repository root, run:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`.

## Publish with GitHub Pages

This repository includes a GitHub Actions workflow at
`.github/workflows/deploy.yml` that deploys the static site to GitHub Pages.

To make the site publicly available:

1. Push the repository changes.
2. In GitHub, open **Settings → Pages**.
3. Set **Source** to **GitHub Actions**.
4. Wait for the **Deploy static site to Pages** workflow to finish.

After that, the site will be available on the repository's GitHub Pages URL.