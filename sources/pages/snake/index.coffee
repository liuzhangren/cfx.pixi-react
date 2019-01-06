### eslint-disable import/first ###
import cfxify from 'cfx.react.dom'
import { Stage, AppConsumer } from  '@inlet/react-pixi'
import Snake from '../../components/snake'

CFX = cfxify {
  Stage
  AppConsumer
  Snake
}

export default =>
  {
    c_Stage
    c_AppConsumer
    c_Snake
  } = CFX

  c_Stage
    width: 800
    height: 600
    options:
      backgroundColor: 0x012b30
  ,
    c_AppConsumer {}
    ,
      (app) => 
        c_Snake
          app: app