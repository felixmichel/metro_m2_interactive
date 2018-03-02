'use strict'

if (module.hot) {
  module.hot.accept()
}

import { mount } from 'riot'
import '../styles/index.scss'
import './components/app.tag'
import './components/barchart.tag'

mount('metro-app', {
})

