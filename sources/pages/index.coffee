### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, Sprite } from '@inlet/react-pixi'

import {
  onDragStart,
  onDragEnd,
  onDragMove
} from '../logic.js'

CFX = cfxify {
  Stage
  Sprite
}

export default =>

  {
    c_Stage
    c_Sprite
  } = CFX

  c_Stage
    width: 500
    heigth: 500
  ,
    c_Sprite
      image: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png'
      x: 250
      y: 250
      anchor: [0.5, 0.5]
      interactive: true
      pointerdown: onDragStart
      pointerup: onDragEnd
      pointerupoutside: onDragEnd
      pointermove: onDragMove

