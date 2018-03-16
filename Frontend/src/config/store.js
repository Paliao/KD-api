import thunk from 'redux-thunk'
import { createStore, applyMiddleware } from 'redux'
import reducers from './reducers'

const store = applyMiddleware(thunk)(createStore)(reducers)

export default store
