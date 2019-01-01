### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, Sprite, Graphics } from '@inlet/react-pixi'

CFX = cfxify {
  'div'
  Stage
  Sprite
  Graphics
}

draw = (g) => 
  g.lineStyle 1, 0xff00ff, 1
  g.beginFill 0x012b30, 0.25
  g.drawRoundedRect 0, 0, 200, 1080
  g.endFill()

onDragStart = (event) ->
  @data = event.data
  @alpha = 0.5
  @dragging = true

onDragEnd = () ->
  @alpha = 1
  @dragging = false
  @data = null

onDragMove = () ->
  if @dragging
    newPosition = @data.getLocalPosition @parent
    @x = newPosition.x
    @y = newPosition.y
export default =>

  {
    c_div
    c_Stage
    c_Sprite
    c_Graphics
  } = CFX

  c_Stage
    width: 1920
    heigth: 1080
    options:
      backgroundColor: '0x012b30'
  ,
    c_Graphics
      draw: draw

    c_Sprite
      image: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
      x: 50
      y: 50
      anchor: [0.5, 0.5]
      interactive: true
      pointerdown: onDragStart
      pointerup: onDragEnd
      pointerupoutside: onDragEnd
      pointermove: onDragMove

