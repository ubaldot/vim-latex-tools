vim9script noclear

# A bunch of utility functions for editing your LaTeX documents.
# Maintainer:	Ubaldo Tiberi
# License: BSD-3

if !has('vim9script') ||  v:version < 900
  # Needs Vim version 9.0 and above
  echo "You need at least Vim 9.0"
  finish
endif

if exists('g:loaded_latex_tools') && g:loaded_latex_tools
  finish
endif
g:loaded_latex_tools = true
