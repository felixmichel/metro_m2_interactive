'use strict'

if (module.hot) {
  module.hot.accept()
}

import { mount } from 'riot'
import '../styles/index.scss'
import './components/app.tag'
import './components/barchart.tag'
import { csv } from 'd3-fetch'

csv('/data/stations.csv', function (d) {
  d.position_x = +d.position_x
  d.position_y = +d.position_y
  d.animation_time = +d.animation_time
  d.text_x = +d.text_x
  d.text_y = +d.text_y
  return d
}).then(function (data) {
  mount('metro-app', {
    stations: data
  })
})
