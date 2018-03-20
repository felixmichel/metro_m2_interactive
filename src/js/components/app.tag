<metro-app>
  <header class="container" id="background_wrapper">
    <metro-sidebar class="sidebar" data="{ sidebar_data }"></metro-sidebar>
    <div class="intro">
      <h1>Les inégalités de Marseille</h1>
      <h2>Les différences arrêt par arrêt</h2>
      <p class="author">Une enquête de <span>Nicolas Bocquet et Félix Michel</span></p>
      <div class="scroll-indicator mobile">
        <a href="#main" class="scroll-indicator-inner"></a>
      </div>
    </div>
    <svg id="map_background"></svg>

    <div class="scroll-indicator desktop">
      <span class="scroll-text">Scroller</span>
      <a href="#main" class="scroll-indicator-inner"></a>
    </div>
  </header>

    <section id="main" class="container scrolly">
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

             <h4>Revenue</h4>
             <section class="chart-container">
              <metro-barchart scrollEvent={ opts.chartTrigger } title="Revenue" color="#FF3814" size="large-chart" series="revenue" suffix=" €"></metro-barchart>
            </section>

            <p>
                { opts.content[0].age }
            </p> 

            <h4>Étranger, immigré</h4>
            <section class="chart-container">
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Immigré" color="#FF3814" size="medium-chart" series="percent_immigration" max_value="35.91" suffix="%"></metro-barchart>
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Étranger" color="#FF7960" size="medium-chart" series="percent_etranger" max_value="35.91" suffix="%"></metro-barchart>
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
            <h4>Omnipraticien</h4>
             <section class="chart-container">
              <metro-barchart scrollEvent={ opts.chartTrigger } title="Omnipraticien" color="#FF3814" size="large-chart" series="omnipraticien" suffix=""></metro-barchart>
            </section>
             <p>
                { opts.content[0].age }
            </p>
            <p>
                { opts.content[0].age }
            </p>

            <h4>Commerce</h4>

            <section class="chart-container">
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Boulangerie" color="#FF3814" size="medium-chart" series="boulangerie" max_value="50" height="350" suffix=""></metro-barchart>
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Coiffeur" color="#FF7960" size="medium-chart" series="coiffeur"suffix="" height="350" max_value="50"></metro-barchart>
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Banque, caisse d'épargne" color="#CC2D10" size="medium-chart" series="banque" suffix="" height="350" max_value="50"></metro-barchart>
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Réparation voiture" color="#7F1C0A" size="medium-chart" series="voiture" max_value="50" height="350" suffix=""></metro-barchart>
            </section>

            <h4>Age</h4>
            <section class="chart-container">
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Jeunes" color="#FF3814" size="medium-chart" series="percent_under18" max_value="35.81" suffix="%"></metro-barchart>
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Vieux" color="#FF7960" size="medium-chart" series="percent_over65" max_value="35.81" suffix="%"></metro-barchart>
            </section>
            <p>
                { opts.content[0].age }
            </p> 
            <p>
                { opts.content[0].age }
            </p>

            <h4>Restaurant</h4>

            <section class="chart-container">
                <metro-barchart scrollEvent={ opts.chartTrigger } title="Restaurant" color="#FF3814" size="large-chart" series="restaurant"  suffix=""></metro-barchart>
            </section>
            <p>
                { opts.content[0].age }
            </p>

        </article>
    </section>

    <footer class="container"></footer>


    <script type="text/javascript">
    import { select } from 'd3-selection'
    import { easeLinear } from 'd3-ease'

    import 'intersection-observer'
    import scrollama from 'scrollama'
    import { transition } from 'd3-transition'

    const scroller = scrollama()

    // TODO: Ziate, Videos einbetten, Breakpoint-Tablet, Click-State-Subway-Line, Real-Data for Sidebar, Click-Indicator for Sidebar (Positioning Mobile), Lazy-Video-Loading

    // Nice to have: Barchart-Quiz, Scroll Fanciness, kleiner parallax Effekt, Charts in position fixed

    var primaryColor = '#FF3814'
    var backgroundColor = '#EDE6DE'

    var breakpointLarge = 1550
    var breakpointMidLarge = 1199
    var breakpointMid = 520

    function drawBarChart (response) {
        opts.chartTrigger.trigger('draw')
    }

    var that = this

    that.sidebar_data = ''

    that.on('mount', () => {
      drawBackground()
      scroller
        .setup({
          step: '.scrolly', // required - class name of trigger steps
          once: true,
          offset: 0.8
        })
    })

    scroller.onStepEnter(drawBarChart)

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
            return 'translate(-625, -220)scale(0.75)'
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
              return 'translate(-625, -220)scale(0.75)'
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
              return 'translate(-625, -220)scale(0.75)'
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
            return 'translate(-625, -220)scale(0.75)'
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
              return 'translate(65, 30)'
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
          .attr('class', 'inner-circle')
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

      stationsEnter.attr('pointer-events', 'none')
        .transition()
        .delay(6000)
        .attr('pointer-events', '')

      stationsEnter.on("mouseenter", function(d, i) {
        select(this).select('.inner-circle')
          .transition()
          .attr("fill", primaryColor)

        select(this).select('text')
          .transition()
          .style("font-weight", 700)
        })

      stationsEnter.on("mouseleave", function(d, i) {
        select(this).select('.inner-circle')
          .transition()
          .attr("fill", backgroundColor)

        select(this).select('text')
          .transition()
          .style("font-weight", 400)
        })

      stationsEnter.on('click', function (d) {

        select('.intro').transition().style('opacity', 0)
        select('#frioul1').transition().style('opacity', 0)
        select('#frioul2').transition().style('opacity', 0)
        select('.sidebar').attr('class', 'sidebar move-in')
        select('.close').transition().duration(1000).style('opacity', 1)

        select('#indicator_arrow').style('display', 'none')

        that.update({
          sidebar_data: d
        })
      })

      select('.close').on('click', function () {
        select('.sidebar').attr('class', 'sidebar')
        select('.intro').transition().style('opacity', 1)
        select('#frioul1').transition().style('opacity', 1)
        select('#frioul2').transition().style('opacity', 1)
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

  var arrow = svg.append('g')
    .attr('id', 'indicator_arrow')
    .attr('fill', '#C9B49D')
    .attr('transform', function () {
            if (window.innerWidth > breakpointLarge) {
              return 'translate(1270, 390)'
            } else if (window.innerWidth > breakpointMidLarge) {
              return 'translate(900, 400)'
            } else if (window.innerWidth > breakpointMid) {
              return 'translate(675, 400)'
            } else if (window.innerWidth < breakpointMid) {
              return 'translate(100, 300)scale(0.75)'
            }
          })
  
  arrow.append('path')
    .attr('d', opts.svg_data[0].arrow1)

  arrow.append("path")
    .attr('d', opts.svg_data[0].arrow2)

  arrow.append('text')
    .attr('x', -30)
    .attr('y', 55)
    .text('Cliquer')

    
  subwayLine.exit().remove()
}
// Redraw based on the new size whenever the browser window is resized.

function reDraw () {
  drawBackground()
  drawBarChart()
}

window.addEventListener('resize', reDraw)

if (window.innerWidth < 768) window.removeEventListener('resize',reDraw)

</script>
</metro-app>
