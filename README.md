# Dotfiles

[![MIT License](https://img.shields.io/badge/license-MIT-red.svg)](./LICENSE.txt)

My dotfiles managed with

- [Config Curator]
- [zshrc]
- [tmuxrc]
- [vimrc]

[Config Curator]: https://github.com/razor-x/config_curator
[tmuxrc]: https://github.com/razor-x/tmuxrc
[vimrc]: https://github.com/razor-x/vimrc
[zshrc]: https://github.com/razor-x/zshrc

## Requirements

* [Bower]
* [Ruby]
* [Zsh]
* [tmux (optional)][tmux]
* [Vim (optional)][Vim]

[Bower]: http://bower.io/
[Ruby]: https://www.ruby-lang.org/
[tmux]: http://tmux.sourceforge.net/
[Vim]: http://www.vim.org/
[Zsh]: http://www.zsh.org/

## Installation and Usage

If you prefer a clean start, clone the `minimal` branch:
it has the same structure and tools but with
a very minimal configuration.

Bootstrap with

````bash
$ ./bootstrap.zsh
````

Install dependencies with

````bash
$ bower update
$ bundle update
````

Install the dotfiles with

````bash
$ curate
````

Update external applications with

````bash
$ ./update.zsh
````

Run everything above with

````bash
$ ./install.zsh
````

Update managed plugins independently with

````bash
$ zshupg
$ tmuxupg
$ vimupg
````

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/razor-x/dotfiles/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

These configuration files are licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
