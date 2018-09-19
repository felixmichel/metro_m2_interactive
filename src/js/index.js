'use strict'

if (module.hot) {
  module.hot.accept()
}

import { mount } from 'riot'
import '../styles/index.scss'
import './components/app.tag'
import './components/barchart.tag'
import './components/sidebar.tag'
import './components/quiz.tag'
import './components/raw.tag'
import { csv, json } from 'd3-fetch'

function TriggerChart () {
  riot.observable(this)
}

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
  json('data/content.json'),
  json('https://spreadsheets.google.com/feeds/list/15kW1TxJsPEeEyOK6NnVoDdJOqgD7yaeeH2yyCpaPyA0/od6/public/values?alt=json')
])
  .then(([stations, svg, content, parsedEntries]) => {
    mount('metro-app', {
      chartTrigger: new TriggerChart(),
      stations: stations,
      svg_data: svg,
      content: content,
      spreadsheet: parsedEntries.feed.entry
    })
  })
