<metro-app>
    <header class="container" id="background_wrapper">
        <metro-sidebar class="sidebar" data="{ sidebar_data }"></metro-sidebar>
        <div class="intro">
            <h1>Les inégalités de Marseille</h1>
            <h2>Les différences arrêt par arrêt</h2>
            <p class="author">Une enquête de <span>Nicolas Bocquet et Félix Michel</span></p>
        </div>
        <svg id="map_background"></svg>
    </header>
<!--         <div class="scroll-indicator">
            <div class="scroll-indicator-inner">
            </div>
            
        </div> -->
    <section class="container">
        <article class="content">
            <h3>
                { opts.content[0].intro }
            </h3>
            <!-- <hr> -->

            <!-- <div class="byline">
                Nicolas Bocquet (texte/videos), Félix Michel (données/code)
            </div> -->

            <p style="margin-top: 40px;">
                { opts.content[0].age }
            </p> 

            <h4>Étranger, immigré</h4>
            <section class="chart-container">
               <!--  <metro-barchart title="" color="" size="small-chart" series="percent_francais" max_value="100"></metro-barchart> -->
                <metro-barchart title="Immigré" color="#FF3814" size="medium-chart" series="percent_immigration" max_value="35.91" suffix="%"></metro-barchart>
                <metro-barchart title="Étranger" color="#FF7960" size="medium-chart" series="percent_etranger" max_value="35.91" suffix="%"></metro-barchart>
<!--                 <metro-barchart color="#7F1C0A" size="medium-chart" series="strangers" custom_axis=false></metro-barchart> -->
            </section>
            <p>
                { opts.content[0].age }
            </p> 
            <p>
                { opts.content[0].age }
            </p>
            <p>
                { opts.content[0].age }
            </p>
            <h4>Age</h4>
            <section class="chart-container">
                <metro-barchart title="Jeunes" color="#FF3814" size="medium-chart" series="percent_under18" max_value="35.81" suffix="%"></metro-barchart>
                <metro-barchart title="Vieux" color="#FF7960" size="medium-chart" series="percent_over65" max_value="35.81" suffix="%"></metro-barchart>
            </section>
            <p>
                { opts.content[0].age }
            </p> 
            <p>
                { opts.content[0].age }
            </p>

        </article>
    </section>

    <footer class="container"></footer>


    <script type="text/javascript">
    import { select } from 'd3-selection'
    import { easeLinear } from 'd3-ease'

    // TODO: Ziate, Videos einbetten, Breakpoint-Tablet, Hover-Click-State-Subway-Line, Real-Data for Sidebar, Click-Indicator for Sidebar, Scroll-Indicator for Analysis, Close-Button Mobile

    // Bugs: Animationen nur einmal ausführen, bei Resize keine Animation mehr machen

    // Nice to have: Barchart-Quiz, Scroll Fanciness, kleiner parallax Effekt, Charts in position fixed, Veränderung der Charts beim Scrollen, Chart-Animation, sobald Animation im Viewport

    var primaryColor = '#FF3814'
    var backgroundColor = '#EDE6DE'

    var breakpointLarge = 1550
    var breakpointMidLarge = 1199
    var breakpointMid = 520

    var that = this

    that.sidebar_data = 'bla'

    that.on('mount', () => {
      drawBackground()
    })

    function drawBackground () {
      var svg = select('#map_background')
      var svgWidth = select('#background_wrapper').node().getBoundingClientRect().width
      var svgHeight = Math.min(1200, window.innerHeight)

      if (window.innerWidth < breakpointMid) svgHeight = 600

      svg.selectAll('*').remove()

      svg.attr('width', svgWidth)
        .attr('height', svgHeight)
        .style('background-color', '#A0BEC9')

      svg.append('g')
        .attr('transform', function () {
          if (window.innerWidth > breakpointLarge) {
            return 'translate(300, -300)'
          } else if (window.innerWidth > breakpointMidLarge) {
            return 'translate(-75, -300)'
          } else if (window.innerWidth > breakpointMid) {
            return 'translate(-300, -300)'
          } else if (window.innerWidth < breakpointMid) {
            return 'translate(-625, -200)scale(0.75)'
          }
        })
          .attr('stroke-width', 2)
          .attr('stroke', '#DBCDBE')
          .attr('fill', backgroundColor)
          .append('polygon')
          .attr('points', opts.svg_data[0].marseille)

      svg.append('g')
          .attr('id', 'frioul1')
          .attr('transform', function () {
            if (window.innerWidth > breakpointLarge) {
              return 'translate(300, -300)'
            } else if (window.innerWidth > breakpointMidLarge) {
              return 'translate(-75, -300)'
            } else if (window.innerWidth > breakpointMid) {
              return 'translate(-300, -300)'
            } else if (window.innerWidth < breakpointMid) {
              return 'translate(-625, -200)scale(0.75)'
            }
          })
          .attr('stroke-width', 2)
          .attr('stroke', '#DBCDBE')
          .attr('fill', backgroundColor)
          .append('path')
          .style('display', 'block')
          .attr('d', opts.svg_data[0].frioul1)

      svg.append('g')
          .attr('id', 'frioul2')
          .attr('transform', function () {
            if (window.innerWidth > breakpointLarge) {
              return 'translate(300, -300)'
            } else if (window.innerWidth > breakpointMidLarge) {
              return 'translate(-75, -300)'
            } else if (window.innerWidth > breakpointMid) {
              return 'translate(-300, -300)'
            } else if (window.innerWidth < breakpointMid) {
              return 'translate(-625, -200)scale(0.75)'
            }
          })
          .attr('stroke-width', 2)
          .attr('stroke', '#DBCDBE')
          .attr('fill', backgroundColor)
          .append('path')
          .style('display', 'block')
          .attr('d', opts.svg_data[0].frioul2)

      var subwayLine = svg.append('g')
        .attr('transform', function () {
          if (window.innerWidth > breakpointLarge) {
            return 'translate(300, -300)'
          } else if (window.innerWidth > breakpointMidLarge) {
            return 'translate(-75, -300)'
          } else if (window.innerWidth > breakpointMid) {
            return 'translate(-300, -300)'
          } else if (window.innerWidth < breakpointMid) {
            return 'translate(-625, -200)scale(0.75)'
          }
        })

      subwayLine
          .append('path')
          .attr('stroke-width', 8)
          .attr('fill', backgroundColor)
          .attr('stroke', primaryColor)
          .style('display', 'block')
          .attr('d', opts.svg_data[0].subway_line)

      var subwayPath = subwayLine.select('path')
      var totalLength = subwayPath.node().getTotalLength()

      subwayLine
          .attr('stroke-dasharray', totalLength + ' ' + totalLength)
          .attr('stroke-dashoffset', totalLength)
          .transition()
          .duration(6000)
          .ease(easeLinear)
          .attr('stroke-dashoffset', 0)

      var stations = svg.append('g')
          .attr('transform', function () {
            if (window.innerWidth > breakpointLarge) {
              return 'translate(1219, 35)'
            } else if (window.innerWidth > breakpointMidLarge) {
              return 'translate(845, 40)'
            } else if (window.innerWidth > breakpointMid) {
              return 'translate(620, 40)'
            } else if (window.innerWidth < breakpointMid) {
              return 'translate(65, 50)'
            }
          })

      var stationsEnter = stations.selectAll('.station')
          .data(opts.stations)
          .enter()
          .append('g')
          .attr('class', 'station')
          .attr('id', function (d) { return d.station })

      stationsEnter
          .append('circle')
          .attr('r', 10)
          .attr('cx', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.position_x * 0.75
            } else if (window.innerWidth > breakpointLarge) {
              return d.position_x
            } else if (window.innerWidth > breakpointMid) {
              return d.position_x
            }
          })
          .attr('cy', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.position_y * 0.75
            } else if (window.innerWidth > breakpointLarge) {
              return d.position_y
            } else if (window.innerWidth > breakpointMid) {
              return d.position_y
            }
          })
          .attr('fill', primaryColor)
          .attr('stroke', backgroundColor)
          .attr('stroke-width', 3)
          .style('opacity', 0)
          .transition()
          .duration(100)
          .delay(function (d) { return d.animation_time + 100 })
          .style('opacity', 1)

      stationsEnter
          .append('circle')
          .attr('cx', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.position_x * 0.75
            } else if (window.innerWidth > breakpointLarge) {
              return d.position_x
            } else if (window.innerWidth > breakpointMid) {
              return d.position_x
            }
          })
          .attr('cy', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.position_y * 0.75
            } else if (window.innerWidth > breakpointLarge) {
              return d.position_y
            } else if (window.innerWidth > breakpointMid) {
              return d.position_y
            }
          })
          .attr('r', 6)
          .attr('fill', backgroundColor)
          .style('opacity', 0)
          .transition()
          .delay(function (d) { return d.animation_time })
          .style('opacity', 1)

      stationsEnter
          .append('text')
          .attr('class', 'stations-text')
          .attr('x', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.text_x * 0.75 + 15
            } else if (window.innerWidth > breakpointLarge) {
              return d.text_x + 25
            } else if (window.innerWidth > breakpointMid) {
              return d.text_x + 15
            }
          })
          .attr('y', function (d) {
            if (window.innerWidth < breakpointMid) {
              return d.text_y * 0.75 + 5
            } else if (window.innerWidth > breakpointLarge) {
              return d.text_y + 5
            } else if (window.innerWidth > breakpointMid) {
              return d.text_y + 5
            }
          })
          .style('opacity', 0)
          .transition()
          .delay(function (d) { return d.animation_time })
          .style('opacity', 1)
          .text(function (d) { return d.station })

      stationsEnter.on('click', function (d) {
        select('.intro').style('opacity', 0)
        select('#frioul1').style('opacity', 0)
        select('#frioul2').style('opacity', 0)
        select('.sidebar').style('visibility', 'visible')
        select('.sidebar').style('opacity', 1)

        that.update({
          sidebar_data: d
        })
      })

  var metroTrain = subwayLine.append('g')
      .attr('class', 'metro-train')
      // .attr('fill', '#52412F')
      .attr('fill', primaryColor)

  metroTrain.append('path')
      .style('display', 'block')
      .attr('transform', 'translate(7,0)rotate(70)')
      .attr('d', opts.svg_data[0].metro)
      .transition()
      .delay(800)
      .attr('transform', 'translate(0,-5)rotate(100)')
      .transition()
      .delay(500)
      .attr('transform', 'translate(0,-5)rotate(0)')
      .transition()
      .delay(450)
      .attr('transform', 'translate(7,0)rotate(70)')
      .transition()
      .delay(2700)
      .attr('transform', 'translate(0,-5)rotate(-25)')
      .transition()
      .delay(500)
      .attr('transform', 'translate(6,-10)rotate(-25)')

  metroTransition()

  function metroTransition () {
        metroTrain.transition()
          .duration(6000)
          .ease(easeLinear)
          .attrTween('transform', translateAlong(subwayPath.node()))
  }

  // Returns an attrTween for translating along the specified path element.
  function translateAlong (path) {
        return function (d, i, a) {
          return function (t) {
            var p = path.getPointAtLength(t * totalLength)
            return 'translate(' + p.x + ',' + p.y + ')'
          }
        }
      }
  subwayLine.exit().remove()
}
// Redraw based on the new size whenever the browser window is resized.
window.onresize = function () { drawBackground(); riot.update() }

</script>
</metro-app>
