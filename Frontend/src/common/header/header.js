import React from 'react'
import { View, Text, StyleSheet } from 'react-native'
import Icon from 'react-native-vector-icons/FontAwesome'

export default props => (
  <View style={styles.containerStyle} >
    <Text style={styles.list}><Icon name='list' size={25} /></Text>
  </View>
)

const styles = StyleSheet.create({
  containerStyle: {
    paddingTop: 15,
    justifyContent: 'center',
    height: 75,
    backgroundColor: '#000823',
    elevation: 10
  },
  list: {
    color: '#b20000',
    alignSelf: 'flex-start',
    paddingLeft: 15,
    
  }
})