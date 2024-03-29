# Dotfiles

[![Release](https://img.shields.io/github/release/rxrc/dotfiles.svg)](https://github.com/rxrc/dotfiles/releases)
[![MIT License](https://img.shields.io/github/license/rxrc/dotfiles.svg)](./LICENSE.txt)

My dotfiles managed with

- [Config Curator]
- [zshrc]
- [tmuxrc]
- [nvimrc]

[Config Curator]: https://github.com/rxrc/curator
[tmuxrc]: https://github.com/rxrc/tmuxrc
[nvimrc]: https://github.com/rxrc/nvimrc
[zshrc]: https://github.com/rxrc/zshrc

## Requirements

* [Zsh].
* [Node.js] with [npm].
* [tmux (optional)][tmux]
* [Neovim (optional)][Neovim]

### Initial Bootstrap

Note: the only requirement for the initial bootstrap is Zsh.

Because this installs a new `.zshrc`,
you should restart your shell before proceeding.

#### Quick Start

Note that the install script takes care
of everything except installing Node via nvm.
Thus, a full install might look like

```bash
$ ./bootstrap.zsh
$ exit # reload shell after installing zshrc
$ nvm install
$ nvm use
$ ./install.zsh
```

Pull future updates with

```bash
$ git pull
$ ./install.zsh update
```

[Neovim]: https://neovim.io/
[Node.js]: https://nodejs.org/
[Zsh]: https://www.zsh.org/
[npm]: https://www.npmjs.com/
[tmux]: http://tmux.sourceforge.net/

## Installation and Usage

If you prefer a clean start, clone the `minimal` branch:
it has the same structure and tools but with
a very minimal configuration.
Tagged releases are based on that branch.

Bootstrap with

```bash
$ ./bootstrap.zsh
```

Install dependencies with

```bash
$ npm install
```

Note that some npm dependencies on this branch
may point to private repositories.
You will either need to replace or remove these.
Otherwise you can start with the minimal branch.

Install the dotfiles with

```bash
$ npm start
```

Update external applications with

```bash
$ ./update.zsh
```

Setup systemd/User units with

```bash
$ ./units.zsh
```

Run everything above with

```bash
$ ./install.zsh
```

This will skip updating external packages.

To install and update everything, run

```bash
$ ./install.zsh update
```

To only install the configuration files and units,

```bash
$ ./install.zsh config
```

Additional manual configuration is documented in
[NOTES.md](./NOTES.md).

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/rxrc/dotfiles/fork).
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
