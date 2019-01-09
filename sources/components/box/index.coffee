### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Graphics, Container } from '@inlet/react-pixi'
# import * as PIXI from 'pixi.js'

CFX = cfxify {
  Graphics
  Container
}

{
  c_Graphics
  c_Container
} = CFX

draw = (g) =>
  # g.beginFill 0x5995c2
  g.lineStyle 1, 0x5995c2, 1

  g.drawPolygon [
    25, 75
    50, 50
    150, 50
  ]
drawTitle = (g) =>
  g.beginFill 0x5995c2
  console.log g
  g.fillAlpha 0.5
  g.lineStyle 1, 0x5995c2, 1

  g.drawPolygon [
    150, 50
    175, 25
    255, 25
    280, 50
    255, 75
    175, 75
    150, 50
  ]
draw2 = (g) =>
  g.lineStyle 1, 0x5995c2, 1

  g.drawPolygon [
    280, 50
    380, 50
    405, 75
  ]
export default =>
  c_Container
    key: 'container'
  ,
    c_Graphics
      key: 'line1'
      draw: draw
    c_Graphics
      key: 'title'
      draw: drawTitle
    c_Graphics
      key: 'line2'
      draw: draw2