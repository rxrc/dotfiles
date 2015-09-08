# Dotfiles

[![Release](https://img.shields.io/github/release/rxrc/dotfiles.svg)](https://github.com/rxrc/dotfiles/releases)
[![MIT License](https://img.shields.io/github/license/rxrc/dotfiles.svg)](./LICENSE.txt)

My dotfiles managed with

- [Config Curator]
- [zshrc]
- [tmuxrc]
- [vimrc]

[Config Curator]: https://github.com/razor-x/config_curator
[tmuxrc]: https://github.com/rxrc/tmuxrc
[vimrc]: https://github.com/rxrc/vimrc
[zshrc]: https://github.com/rxrc/zshrc

## Requirements

* [Bower]
* [Ruby] with [Bundler]
* [Zsh]
* [tmux (optional)][tmux]
* [Vim (optional)][Vim]

### Initial Bootstrap

Note: the only requirement for the initial bootstrap is Zsh.

Because this installs a new `.zshrc`,
you should restart your shell before proceeding.

After bootstrapping, you can choose to install Ruby
under [rbenv] using [ruby-build].
These two tools are installed during the bootstrap.
Once Ruby is setup, install the bundler gem.
Bower should be installed manually using [npm].

#### Quick Start

Note that on this branch, the install script takes care
of everything except installing Ruby and Node.
Thus, a full install might look like

```bash
$ ./bootstrap.zsh
$ exit
$ rbenv install 2.2.2
$ nvm install stable
$ nvm use stable
$ ./install.zsh
```

Pull future updates with

```bash
$ git pull
$ ./install.zsh update
```

[Bower]: http://bower.io/
[Bundler]: http://bundler.io/
[npm]: https://www.npmjs.com/
[rbenv]: https://github.com/sstephenson/rbenv
[Ruby]: https://www.ruby-lang.org/
[ruby-build]: https://github.com/sstephenson/ruby-build
[tmux]: http://tmux.sourceforge.net/
[Vim]: http://www.vim.org/
[Zsh]: http://www.zsh.org/

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
$ bower update
$ bundle update
```

Note that some bower dependencies on this branch
may point to private repositories.
You will either need to replace or remove these.
Otherwise you can start with the minimal branch.

Install the dotfiles with

```bash
$ curate
```

Update external applications with

```bash
$ ./update.zsh
```

Setup systemd/User units with

```bash
$ ./units.zsh
```

Install external packages and plugins with

```bash
$ ./npm_modules.zsh
$ ./vagrant_plugins.zsh
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
