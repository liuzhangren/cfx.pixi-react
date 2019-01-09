### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, Sprite, Container } from '@inlet/react-pixi'
import * as PIXI from 'pixi.js'

CFX = cfxify {
  Stage
  Sprite
  Container
}

export default =>
  {
    c_Stage
    c_Sprite
    c_Container
  } = CFX

  c_Stage
    width: 800
    height: 600
    