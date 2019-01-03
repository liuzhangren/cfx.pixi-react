### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, Sprite, Graphics } from '@inlet/react-pixi'
import pic from '../components/sprite'

CFX = cfxify {
  Stage
  Sprite
  Graphics
  pic
}

{
  c_Stage
  c_Sprite
  c_Graphics
  c_pic
} = CFX



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
    if newPosition.x > 200
      @x = newPosition.x
      @y = newPosition.y


    
export default =>

  c_Stage
    width: 1920
    heigth: 1080
    options:
      backgroundColor: '0x012b30'
  ,
    [
        c_Graphics
          key: 'siderBar'
          draw: draw
      ,
        c_pic
          key: 'sprite'
          image: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
          interactive: true
          pointerdown: onDragStart
          pointerup: onDragEnd
          pointerupoutside: onDragEnd
          pointermove: onDragMove
          buttonMode: true
    ]
