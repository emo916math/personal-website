CURRENT WEBSITE — SOURCE AND GENERATED HTML

Edit index.qmd or the files under music/. Run these commands from this folder:

  quarto preview     Preview and automatically rebuild when you save.
  quarto render      Rebuild the generated website in _site/.

Publish ONLY the contents of _site/ to your web host. It includes the HTML,
styles, scripts, search index, images, and linked score PDFs needed by the site.
The project root is your editable source, not the folder to serve as a website.

This package contains no migration archive, retired pages, previous versions,
unused assets, or commented-out passages. The existing external CV link is
retained; no local CV snapshot is included. Audio/video remain external.

score-sources/ contains the editable LilyPond sources for the displayed scores;
they are not copied to _site/. SVGs used by the site are in assets/scores/.
Quarto alone is enough to render; LilyPond is needed only to re-engrave notation.

To exclude text entirely, remove it from the source. HTML comments are not a
privacy mechanism. This package removes the existing commented passages from
both source and output, including the music passage marked with a mistyped
comment opener. The original working project has not been changed.
