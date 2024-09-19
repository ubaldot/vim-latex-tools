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


import "../after/plugin/tex.vim"

# Commands and mappings
def LatexFilesCompletion(A: any, L: any, P: any): list<string>
  return getcompletion('\w*.tex', 'file')
enddef
command! -nargs=? -buffer -complete=customlist,LatexFilesCompletion LatexRender LatexRender(<f-args>)
command! -buffer LatexOutlineToggle LatexOutlineToggle()

nnoremap <buffer> % <ScriptCmd>JumpTag()<cr>
noremap <unique> <script> <buffer> <Plug>ForwardSearch <Scriptcmd>tex.ForwardSearch()<cr>
noremap <unique> <script> <buffer> <Plug>ChangeLatexEnvironment <Scriptcmd>tex.ChangeLatexEnvironment()<cr>
noremap <unique> <script> <buffer> <Plug>DeleteLatexEnvironment <Scriptcmd>tex.DeleteLatexEnvironment()<cr>
noremap <unique> <script> <buffer> <Plug>HighlightOuterEnvironment <Scriptcmd>tex.HighlightOuterEnvironment()<cr>

var use_default_mappings = true
if exists('g:latex_tools_config')
  use_default_mappings = get('g:latex_tools_config', 'use_default_mappings', true)
endif

if use_default_mappings
  if !hasmapto('<Plug>ForwardSearch')
    nnoremap <buffer> <F5> <Plug>ForwardSearch
  endif
  if !hasmapto('<Plug>ChangeLatexEnvironment')
    nnoremap <buffer> <c-l>c <Plug>ChangeLatexEnvironment
  endif
  if !hasmapto('<Plug>DeleteLatexEnvironment')
    nnoremap <buffer> <c-l>d <Plug>DeleteLatexEnvironment
  endif
  if !hasmapto('<Plug>HighlightOuterEnvironment')
    nnoremap <buffer> <c-l>h <Plug>HighlightOuterEnvironment
  endif
endif
