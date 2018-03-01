'use strict'

if (module.hot) {
  module.hot.accept()
}

import { mount } from 'riot'
import '../styles/index.scss'
import './components/app.tag'
import './components/barchart.tag'
import { csv } from 'd3-fetch'

csv('/data/content.csv', function (d) {
  d.revenue = +d.revenue
  return d
}).then(function (dataset) {
  mount('metro-app', {
    data: dataset
  })
})
