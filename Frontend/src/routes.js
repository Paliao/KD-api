import { StackNavigator } from 'react-navigation'

import homeScreen from './home/home'

const RootNavigator = StackNavigator(
  {
    Home: {
      screen: homeScreen
    }
  },{
    initialRouteName: 'Home'
  } 
)

export default RootNavigator
