# Vim-latex-tools

If you are fine with everything your LaTeX LSP provides but you are after few
additional features for editing your LaTeX documents, then this plugin is for
you.

It offers _forward-_ and _inverse-_ search, document outline and few other
handy features in an extremely compact and lightweight form that perfectly
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

- You need [SumatraPDF](https://www.sumatrapdfreader.org/free-pdf-reader).
- Open SumatraPDF.exe, go to _Settings/Options_ and replace the line in the
  _Set inverse-search command-line box_, with the following:

```
vim --servername vim --remote-send ":call BackwardSearch(%l, '%f')<cr>"
```

If you use gvim, then replace `vim` with `gvim` in the above line.

> [!NOTE]
> Sometimes the backwards search does not put the Vim/Gvim in foreground but you have to manually do it.
> This happens because Windows does not allow to windows to bring themselves in foreground. See also `:h foreground()`. The line in the source code is however highlighted.

### Linux

- You need [zathura](https://pwmt.org/projects/zathura/).

> [!WARNING]
>
> The backwards search does not work in WSL, see
> [this issue](https://github.com/pwmt/zathura/issues/679). I don't know if it
> works with ordinary Linux because I don't have any Linux machine available. If someone wants
> to give it a try and let me know I would appreciate it.

### MacOS

- You need [Skim.app](https://skim-app.sourceforge.io/).
- Open `Skim.app` and go to _Skim/Settings..._ and in the tab _Sync_ set the
  _PDF-TeX Sync support_ fields as it follows

  - Preset: Custom
  - Command: `mvim`
  - Arguments: `--remote-send ":call BackwardSearch(%line, '%file')<cr>"`

The above works assuming that you are using _MacVim_. If you are using `vim`
or `gvim` you have to change the field _Command_ accordingly.

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
:LatexOutlineToggle # Toggle the buffer outline. Disabled if you have
vim-outline installed.
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
