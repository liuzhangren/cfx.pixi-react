### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Component } from 'react'
import { Container, Graphics, Rope } from '@inlet/react-pixi'
import * as PIXI from 'pixi.js'

CFX = cfxify {
  Container
  Graphics
  Rope
}

img = 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/snake.png'

class Snake extends Component
  constructor: (props) ->
    super props 
    @state = 
      ropeLength: 45
      points: []
      showSpine: true
  count = 0
  componentDidMount: ->
    points = []

    points.push new PIXI.Point i*@state.ropeLength, 0 for i in [0...25]

    @setState {
      points
    }
    @props.app.ticker.add @tick
  
  componentWillUnmount: ->
    @props.app.ticker.remove @tick
  
  tick: (delta) =>
    count += 0.1*delta

    points = @state.points
    len = points.length

    (
      points[i].y = Math.sin((i*0.2)+count)*30
      points[i].x = i*@state.ropeLength + Math.cos((i * 0.3) + count) * 20
    ) for i in [0...len]

    @setState {
      points
    }
  
  toggleSpine: () => 
    @setState ({ showSpine }) => ({ showSpine: !showSpine })
  
  render: ->

    {
      c_Container
      c_Graphics
      c_Rope
    } = CFX

    c_Container
      x: 50
      y: 300
      scale: [0.6, 0.6]
      interactive: true
      pointerdown: @toggleSpine
    ,
      c_Rope
        image: img
        points: @state.points
      
      @state.showSpine && (
        c_Graphics
          draw: (g) =>
            {
              points
            } = @state
            
            g.clear()

            startX = 
              if points[0]
              then points[0].x
              else 0
            startY = 
              if points[0]
              then points[0].y
              else 0
            
            g.lineStyle 2, '0xffc2c2'
            g.moveTo startX, startY

            g.lineTo item.x, item.y for item in points

            (
              g.beginFill '0xff0022'
              g.drawCircle item.x, item.y, 10
              g.endFill()
            ) for item in points
      )
export default Snake