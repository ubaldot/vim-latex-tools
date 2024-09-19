vim9script noclear

# A bunch of utility functions for editing your LaTeX documents.
# Maintainer:	Ubaldo Tiberi
# License: BSD-3

if !has('vim9script') ||  v:version < 900
  # Needs Vim version 9.0 and above
  echo "You need at least Vim 9.0"
  finish
endif

if exists('g:latex_tools_loaded')
  finish
endif
g:latex_tools_loaded = true
