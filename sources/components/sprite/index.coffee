### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Sprite } from '@inlet/react-pixi'

CFX = cfxify {
  Sprite
}

export default ({
  image
  pointerdown
  pointerup
  pointerupoutside
  pointermove
}) =>
  {
    c_Sprite
  } = CFX

  c_Sprite {
    image
    x: 50
    y: 50
    anchor: [0.5, 0.5]
    interactive: true
    pointerdown
    pointerup
    pointerupoutside
    pointermove
    buttonMode: true
  }

