export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  keep: [

  ]
  devdep: [
    "autod"
    "cfx.simple-build-tool"
    "ddeyes"
    "umi"
  ]  
  dep: [
    "cfx.react.dom"
    "cfx.react.link"
    "cfx.react.link.dom"
    "react-router"
  ]
  exclude: [
    './packages'
    './node_modules'
    './.autod.conf.js'
    './src'
    './sources'
  ]