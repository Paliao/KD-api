import { DrawerNavigator } from 'react-navigation'

import homeScreen from '../screens/home'

const RootNavigator = DrawerNavigator(
  {
    Home: {
      screen: homeScreen
    }
  },{
    initialRouteName: 'Home',
    drawerWidth: 300
  } 
)

export default RootNavigator
