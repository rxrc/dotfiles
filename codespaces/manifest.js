import os from 'os'
import path from 'path'
import fs from 'fs'

const host = 'codespaces'
const rxrc = 'node_modules/@rxrc'

const targetRoot = path.resolve('.codespaces')

const ioType = 'linux'
const pkgType = 'noop'

const unlinks = []

const directories = []

const files = [{
  src: 'codespaces/bootstrap.sh',
  dst: 'bootstrap.sh',
  fmode: '0755'
}, {
  src: 'dotfiles/zshenv',
  dst: '.zshenv'
}, {
  src: 'config/ignore',
  dst: '.config/ignore'
}, {
  src: 'codespaces/README.md',
  dst: 'README.md'
}, {
  src: 'LICENSE.txt'
}]

const symlinks = []

export default async () => ({
  unlinks,
  directories,
  files,
  symlinks,
  targetRoot,
  ioType,
  pkgType
})
