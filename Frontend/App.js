import React, { Component } from 'react'
import { View } from 'react-native'
import { Provider } from 'react-redux'

import store from './src/config/store'
import RootStack from './src/routes'

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <View style={{flex: 1}}>
          <RootStack />
        </View>
      </Provider>
    )
  }
}
