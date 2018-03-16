import React from 'react'
import { View } from 'react-native'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import thunk from 'redux-thunk'


import reducers from './src/reducers'
import RootStack from './src/routes'

const store = applyMiddleware(thunk)(createStore)(reducers)
export default class App extends React.Component {
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
