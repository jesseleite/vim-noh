# Vim Noh 🔎

A vim plugin for automatically clearing search highlighting when cursor is moved.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'jesseleite/vim-noh'
```

## Comparison with vim-slash

Vim-noh is a smaller alternative to [vim-slash](https://github.com/junegunn/vim-slash), which is a smaller alternative to [vim-oblique](https://github.com/junegunn/vim-oblique).  Many features are missing in vim-noh, but that's the point, [my dear](https://www.youtube.com/watch?v=GQ5ICXMC4xY).

## Customization

Place the current match at the center of the window:

```vim
noremap <plug>(slash-after) zz
```

## Thanks!

Thank you to the legendary [Junegunn Choi](https://github.com/junegunn), who wrote the original [vim-slash](https://github.com/junegunn/vim-slash) plugin that this fork is based on.
