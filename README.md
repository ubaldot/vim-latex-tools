# Vim-latex-tools

If you are fine with everything your LaTeX LSP provides but you are after
few additional features for editing your LaTeX documents, then this plugin is
for you.

It offers _forward-_ and _inverse-_ search, document outline and few other handy
features in an extremely compact and lightweight form that perfectly
complements what is already offered by your LSP of choice. If you have new
feature suggestions, just ask or send a PR. :)

The plugin works multi-platform but it requires some setup.

In case you want a well-established, all-in-one solution, check out
[vimtex](https://github.com/lervag/vimtex).

## Requirements

You need Vim9 compiled with `'+clientserver'` option. You can verify it by
running `vim --version`.

You also need a LaTeX distribution and `latexmk`.

### Windows

- You need [SumatraPDF](https://www.sumatrapdfreader.org/free-pdf-reader). You
  must rename the executable as `SumatraPDF.exe`.
- Open SumatraPDF.exe, go to _Settings/Options_ and replace the line in the
  _Set inverse-search command-line box_, with the following:

```
vim --servername vim --remote-send ":call BackwardSearch(%l, '%f')<cr>"
```

If you use gvim, then replace `vim` with `gvim` in the above line.

### Linux

- You need [zathura](https://www.sumatrapdfreader.org/free-pdf-reader).
- Add the following lines to `~/.config/zathura/zathurarc`

```
set synctex true
set synctex-editor-command "vim --servername vim --remote-send ':call BackwardSearch(%{line}, %{input})<cr>'"
```

If you use gvim, then replace `vim` with `gvim` in the above line. If
`~/.config/zathura/zathurarc` file does not exist, create it.

### MacOs

- You need [Skim.app](https://github.com/yegappan/lsp).

## Autocompletion, diagnostics, etc.

These features are provided by the LSP. You need to download LSP server and a
LSP client (i.e. a Vim plugin) to make the magic to happen.

#### LSP Server

You can use the one you want. I tested it with
[texlab](https://github.com/latex-lsp/texlab).

#### LSP Client

You can use the one you want. I tested it with
[yegappan/lsp](https://github.com/yegappan/lsp). Follow the instructions on
the repo to see how to install the plugin.

Regarding the LSP client configuration, you can read how-to on `:h lsp.txt`
or, if you don't have any other LSP, you can try with something the following:

```
var lspServers = [
    {
        name: 'texlab',
        filetype: ['tex'],
        path: 'texlab',
    }
]

autocmd VimEnter * g:LspAddServer(lspServers)
```

## Commands

There are only two commands:

```
:LatexRender # Build the .tex file
:LatexOutlineToggle # Toggle the buffer outline
```

## Mappings

You can map the following functions:

```
<Plug>ForwardSearch
<Plug>ChangeLatexEnvironment
<Plug>DeleteLatexEnvironment
<Plug>HighlightOuterEnvironment
```

which are mapped as defaults as it follows:

```
<F5> <Plug>ForwardSearch
<c-l>c <Plug>ChangeLatexEnvironment
<c-l>d <Plug>DeleteLatexEnvironment
<c-l>h <Plug>HighlightOuterEnvironment
```

You can also use `%` to jump from/to/from the
`\begin{<environment>}`/`\end{<environment>}` of the current `<environment>`.

## Configuration

The configuration happen through the dictionary `g:latex_tools_config` and you
can only set the following parameters by adding the following to your
`.vimrc`:

```
g:latex_tools_config = {}
g:latex_tools_config['use_default_mappings'] = true
g:latex_tools_config['latex_engine'] = 'xelatex'
```

Possible choices for `latex_engine` key are
`['pdflatex', 'xelatex', 'lualatex']`. Default value is `'xelatex'`
