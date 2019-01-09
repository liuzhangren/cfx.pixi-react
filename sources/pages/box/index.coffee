### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage } from '@inlet/react-pixi'
import box from '../../components/box'

CFX = cfxify {
  Stage
  box
}

{
  c_Stage
  c_box
} = CFX
    
export default =>

  c_Stage
    width: 1920
    heigth: 1080
    options:
      backgroundColor: '0x012b30'
  ,
    c_box {}
