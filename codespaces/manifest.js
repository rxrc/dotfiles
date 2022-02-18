'use strict'

const os = require('os')
const path = require('path')
const fs = require('fs')

const host = 'codespaces'
const rxrc = 'node_modules/@rxrc'

const targetRoot = path.resolve('.codespaces')

const ioType = 'linux'
const pkgType = 'noop'

const unlinks = []

const directories = []

const files = [{
  src: 'codespaces/README.md',
  dst: 'README.md'
}, {
  src: 'LICENSE.txt'
}]

const symlinks = []

module.exports = async () => ({
  unlinks,
  directories,
  files,
  symlinks,
  targetRoot,
  ioType,
  pkgType
})
