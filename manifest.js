import os from 'os'
import path from 'path'
import fs from 'fs'

const host = os.hostname().toLowerCase()
const rxrc = 'node_modules/@rxrc'

const targetRoot = os.homedir()

const ioType = 'linux'
const pkgType = 'pacman'

const defaults = {
  dmode: '0750',
  fmode: '0640',
  user: 'razorx',
  group: 'razorx'
}

const unlinks = []

const directories = [{
  src: `${rxrc}/systemd-user-units/user`,
  dst: '.config/systemd/user',
  pkgs: ['systemd']
}, {
  src: `${rxrc}/keymaps/xkb`,
  dst: '.config/xkb',
  pkgs: ['xorg-server']
}, {
  src: `${rxrc}/tmuxinator-profiles`,
  dst: '.config/tmuxinator',
  pkgs: ['tmux']
}, {
  src: `${rxrc}/xresources/Xresources.d`,
  dst: '.config/Xresources/Xresources.d',
  pkgs: ['xorg-server']
}, {
  src: `${rxrc}/hexchat-material-design-icons/icons-white`,
  dst: '.config/hexchat/icons',
  pkgs: ['hexchat']
}, {
  src: `${rxrc}/awesome-copycats`,
  dst: '.config/awesome',
  pkgs: ['awesome']
}, {
  src: `${rxrc}/apw`,
  dst: '.config/awesome/apw',
  order: 200,
  pkgs: ['awesome']
}]

const files = [{
  src: 'dotfiles/zshenv',
  dst: '.zshenv'
}, {
  src: `${rxrc}/ssh-config/config`,
  dst: '.ssh/config'
}, {
  src: `${rxrc}/ssh-config/authorized_keys`,
  dst: '.ssh/authorized_keys',
  fmode: '0600'
}, {
  src: 'config/gnupg/gpg-agent.conf',
  dst: '.config/gnupg/gpg-agent.conf'
}, {
  src: 'config/ignore',
  dst: '.config/ignore'
}, {
  src: 'config/git/config',
  dst: '.config/git/config'
}, {
  src: 'config/git/ignore',
  dst: '.config/git/ignore'
}, {
  src: 'config/rbenv/default-gems',
  dst: '.local/rbenv/default-gems'
}, {
  src: 'dotfiles/lein/profiles.clj',
  dst: '.lein/profiles.clj',
  pkgs: ['leiningen']
}, {
  src: 'config/npm/config',
  dst: '.config/npm/config'
}, {
  src: 'config/bundle/config',
  dst: '.config/bundle/config'
}, {
  src: 'config/ranger/rc.conf',
  dst: '.config/ranger/rc.conf',
  pkgs: ['ranger']
}, {
  src: 'config/stack/config.yaml',
  dst: '.config/stack/config.yaml',
  pkgs: ['stack-bin']
}, {
  src: 'config/chef/knife.rb',
  dst: '.config/chef/knife.rb'
}, {
  src: 'config/vagrant/Vagrantfile',
  dst: '.config/vagrant/Vagrantfile',
  pkgs: ['vagrant']
}, {
  src: 'config/user-dirs.dirs',
  dst: '.config/user-dirs.dirs',
  pkgs: ['xorg-server']
}, {
  src: 'config/mimeapps.list',
  dst: '.config/mimeapps.list',
  pkgs: ['xorg-server']
}, {
  src: `config/Xresources/default.${host}`,
  dst: '.config/Xresources/default',
  pkgs: ['xorg-server']
}, {
  src: `config/xbindkeys/xbindkeysrc.${host}`,
  dst: '.config/xbindkeys/xbindkeysrc',
  pkgs: ['xbindkeys']
}, {
  src: 'dotfiles/gtkrc-2.0',
  dst: '.gtkrc-2.0',
  pkgs: ['gtk2']
}, {
  src: 'config/gtk-3.0/settings.ini',
  dst: '.config/gtk-3.0/settings.ini',
  pkgs: ['gtk3']
}, {
  src: 'config/termite/config',
  dst: '.config/termite/config',
  pkgs: ['termite']
}, {
  src: 'config/kitty/kitty.conf',
  dst: '.config/kitty/kitty.conf',
  pkgs: ['kitty']
}, {
  src: 'config/sakura/sakura.conf',
  dst: '.config/sakura/sakura.conf',
  pkgs: ['sakura']
}, {
  src: 'config/terminator/config',
  dst: '.config/terminator/config',
  pkgs: ['terminator']
}, {
  src: 'config/zathura/zathurarc',
  dst: '.config/zathura/zathurarc',
  pkgs: ['zathura']
}, {
  src: 'dotfiles/xprofile',
  dst: '.xprofile',
  pkgs: ['xorg-server']
}]

const symlinks = async () => [{
  src: '.config/xkb/Sleipnir',
  dst: '.config/xkb/keymap/steelseries-6gv2.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/xkb/Mimir',
  dst: '.config/xkb/keymap/steelseries-6gv2.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/xkb/Pixelbook',
  dst: '.config/xkb/keymap/samus.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/xkb/Frigg',
  dst: '.config/xkb/keymap/steelseries-6gv2.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/xkb/Gungnir-x60',
  dst: '.config/xkb/keymap/x60t.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/xkb/Mjolnir',
  dst: '.config/xkb/keymap/matebook.xkb',
  pkgs: ['xorg-server']
}, {
  src: '.config/awesome/rc.lua',
  dst: '.config/awesome/rc.lua.template',
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png',
  dst: await randomFile('drive/wallpaper/hosts/mjolnir'),
  hosts: ['pixelbook', 'mjolnir'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png',
  dst: 'drive/wallpaper/hosts/frigg/wallhaven-349408-16x10.png',
  hosts: ['frigg'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png',
  dst: 'drive/wallpaper/hosts/frigg/wallhaven-500094.jpg',
  hosts: ['frigg', 'mimir'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png-2',
  dst: 'drive/wallpaper/hosts/frigg/wallhaven-416958.jpg',
  hosts: ['frigg', 'mimir'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png-3',
  dst: 'drive/wallpaper/hosts/frigg/wallhaven-14375-2560x1440.jpg',
  hosts: ['frigg'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png',
  dst: 'Wallpaper/wallhaven-83639-4x3.jpg',
  hosts: ['pixelbook-x60'],
  pkgs: ['awesome']
}, {
  src: '.config/awesome/themes/powerarrow-dark/wall.png',
  dst: 'drive/wallpaper/wallbase/general/1920.1200/wallpaper-98843.jpg',
  hosts: ['Sleipnir'],
  pkgs: ['awesome']
}]

export default async () => ({
  unlinks,
  directories,
  files,
  symlinks: await symlinks(),
  targetRoot,
  ioType,
  pkgType,
  defaults
})

const randomFile = async dir => {
  const rootDir = path.join(targetRoot, dir)
  const files = await fs.promises.readdir(rootDir)
  if (!files.length) throw new Error(`No files in ${rootDir}`)

  const checkRandom = async () => {
    const randomIndex = Math.floor(Math.random() * files.length)
    const file = files[randomIndex]
    const stats = await fs.promises.stat(path.join(rootDir, file))
    if (stats.isFile()) return path.join(dir, file)
    files.splice(randomIndex, 1)
    return checkRandom()
  }

  return checkRandom()
}
