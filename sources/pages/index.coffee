### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Component } from 'react'
import { Stage, Graphics, Sprite } from '@inlet/react-pixi'

CFX = cfxify {
  Stage
  Graphics
  Sprite
}

{
  c_Stage
  c_Graphics
  c_Sprite
} = CFX

class normal extends Component
  constructor: (props) ->
    super props
    @state = 
      repeat: false

  draw = (g) =>
    g.lineStyle 1, 0xff00ff, 1
    g.drawRoundedRect 1, 1, 200, 1080
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

  render: ->
    # self = @
    # drawSprite = () => 
    #   c_Sprite
    #     key: 'sprite'
    #     image: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
    #     interactive: true
    #     x: 50
    #     y: 50
    #     anchor: [0.5, 0.5]
    #     pointerdown: onDragStart
    #     pointerup: onDragEnd
    #     pointerupoutside: onDragEnd
    #     pointermove: onDragMove
    #     buttonMode: true
    c_Stage
      width: window.screen.width
      height: window.screen.height
      options:
        backgroundColor: 0xeef1f5
        transparent: true
    ,
      c_Graphics
        key: 'siderBar'
        draw: draw
        
      [0..25].reduce (r, c) =>
        [
          r...
          c_Sprite
            key: 'sprite'
            image: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
            interactive: true
            x: 50
            y: 50
            anchor: [0.5, 0.5]
            pointerdown: onDragStart
            pointerup: onDragEnd
            pointerupoutside: onDragEnd
            pointermove: onDragMove
        ]
      , []
      # if @state.repeat
      #   drawSprite()

export default normal
