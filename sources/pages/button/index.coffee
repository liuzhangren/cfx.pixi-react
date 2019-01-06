### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, Graphics, Text, Container } from '@inlet/react-pixi'
import * as PIXI from 'pixi.js'

CFX = cfxify {
  Stage
  Graphics
  Text
  Container
}

{
  c_Stage
  c_Graphics
  c_Text
  c_Container
} = CFX

style = new PIXI.TextStyle 
  align: "center"
  fontFamily: 'sans-serif'
  fontSize: 20
  zIndex: 100
  # fontWeight: 'bold'
  fill: ["#436d87"]
  stroke: "#eef1f5"
  strokeThickness: 1
  letterSpacing: 5
  wordWrap: true

draw = (g) =>
  g.beginFill 0x1a4158
  g.lineStyle 4, 0x436d87, 1

  g.drawPolygon [
    50, 50
    150, 50
    150, 75
    125, 100
    25, 100
    25, 75
    50, 50
  ]

onDragStart = (event) ->
  @data = event.data
  @dragging = true
  console.log 'hello world!!!'

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
  
  c_Stage
    width: 1920
    heigth: 1080
    options:
      backgroundColor: '0x012b30'
  ,
    c_Container
      key: 'Container'
      interactive: true
      buttonMode: true
      pointerdown: onDragStart
      pointerup: onDragEnd
      pointerupoutside: onDragEnd
      pointermove: onDragMove
    ,
      c_Text
        text: '按钮'
        x: 63
        y: 63
        style: style

      c_Graphics
        key: 'btn'
        draw: draw
        # anchor: [0.5, 0.5]
        alpha: 0.5
        