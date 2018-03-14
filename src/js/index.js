'use strict'

if (module.hot) {
  module.hot.accept()
}

import { mount } from 'riot'
import '../styles/index.scss'
import './components/app.tag'
import './components/barchart.tag'
import './components/sidebar.tag'
import { csv, json } from 'd3-fetch'

Promise.all([
  csv('data/stations.csv', (stations) => {
    stations.position_x = +stations.position_x
    stations.position_y = +stations.position_y
    stations.animation_time = +stations.animation_time
    stations.text_x = +stations.text_x
    stations.text_y = +stations.text_y
    return stations
  }),
  json('data/svg_data.json'),
  json('data/content.json')
])
.then(([stations, svg, content]) => {
  mount('metro-app', {
    stations: stations,
    svg_data: svg,
    content: content
  })
})
