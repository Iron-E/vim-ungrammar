# vim-ungrammar

`Vim-ungrammar` is a plugin for Neovim and Vim for the [Ungrammar][ungrammar] filetype which provides:

* [Filetype](./ftdetect/ungram.vim) detection.
* [`ftplugin`](./ftplugin/ungrammar.vim) setting adjustments.
* [Syntax](./syntax/ungrammar.vim) files.

# Highlight Groups

This plugin defines the following syntax groups:

| Group Name          | Description                      | Example            |
|:--------------------|:---------------------------------|:-------------------|
| `ungramConditional` | A conditional (1-or-0).          | `?`                |
| `ungramLabel`       | A label for a token or string.   | `scope:'local'`    |
| `ungramOperator`    | An operator.                     | `=`                |
| `ungramRepeat`      | 0 or more repetitions.           | `*`                |
| `ungramRule`        | A rule for a grammar.            | `Foo`              |
| `ungramString`      | A specific string of characters. | `'for'`            |
| `ungramToken`       | A token.                         | `'identifier_var'` |

# Markdown

You can use this plugin seamlessly with [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown) provided that the following is part of your `init.vim` configuration:

```vim
let g:vim_markdown_fenced_languages = ['ungram=ungrammar']
```

Then, you can create codeblocks in markdown and it will use the syntax file from this plugin:

````markdown
	```ungram
	 Foo = 'A' | 'B'
````

[ungrammar]:https://rust-analyzer.github.io/blog/2020/10/24/introducing-ungrammar.html "Introducing Ungrammar"

