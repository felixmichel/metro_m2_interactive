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
        import { csv } from "d3-fetch";
        import { select } from "d3-selection";
        import { transition } from "d3-transition";
        import { easeLinear } from "d3-ease";

        // TODO: Ziate, Videos einbetten, Breakpoint-Tablet, Hover- / Click-State-Subway-Line, Real-Data for Sidebar, Click-Indicator for Sidebar, Scroll-Indicator for Analysis, Close-Button Mobile

        // Bugs: Animationen nur einmal ausführen, bei Resize keine Animation mehr machen

        // Nice to have: Barchart-Quiz, Scroll Fanciness, kleiner parallax Effekt, Charts in position fixed, Veränderung der Charts beim Scrollen, Chart-Animation, sobald Animation im Viewport

        var primary_color = "#FF3814";
        var background_color = "#EDE6DE";

        var breakpoint_l = 1550;
        var breakpoint_ml = 1199;
        var breakpoint_m = 520;

        var that = this;

        that.sidebar_data = 'bla';

        that.on("mount", () => {
            drawBackground()
        })

        function drawBackground () {

            var svg = select("#map_background"),
            svg_width = select("#background_wrapper").node().getBoundingClientRect().width;

            var svg_height = Math.min(1200, window.innerHeight);

            if (window.innerWidth < breakpoint_m) svg_height = 600;

            svg.selectAll("*").remove();

            svg.attr("width", svg_width)
                .attr("height", svg_height)
                .style("background-color", "#A0BEC9");

            var marseille_shape = svg.append("g")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(300, -300)" } else if (window.innerWidth > breakpoint_ml) {
                    return "translate(-75, -300)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("polygon")
                .attr("points", opts.svg_data[0].marseille)

            var frioul_shape_1 = svg.append("g")
                .attr("id", "frioul1")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(300, -300)" } else if (window.innerWidth > breakpoint_ml) {
                    return "translate(-75, -300)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("path")
                .style("display", "block")
                .attr("d", opts.svg_data[0].frioul1)

            var frioul_shape_2 = svg.append("g")
                .attr("id", "frioul2")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(300, -300)" } else if (window.innerWidth > breakpoint_ml) {
                    return "translate(-75, -300)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("path")
                .style("display", "block")
                .attr("d", opts.svg_data[0].frioul2)

            var subway_line = svg.append("g")
               .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(300, -300)" } else if (window.innerWidth > breakpoint_ml) {
                    return "translate(-75, -300)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })

            subway_line
                .append("path")
                .attr("stroke-width", 8)
                .attr("fill", background_color)
                .attr("stroke", primary_color)
                .style("display", "block")
                .attr("d", opts.svg_data[0].subway_line)

            var subway_path = subway_line.select("path")
            var totalLength = subway_path.node().getTotalLength();

            subway_line
                .attr("stroke-dasharray", totalLength + " " + totalLength)
                .attr("stroke-dashoffset", totalLength)
                .transition()
                .duration(6000)
                .ease(easeLinear)
                .attr("stroke-dashoffset", 0);

            var stations = svg.append("g")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                        return "translate(1219, 35)" } else if (window.innerWidth > breakpoint_ml) {
                        return "translate(845, 40)" } else if (window.innerWidth > breakpoint_m) {
                        return "translate(620, 40)" } else if (window.innerWidth < breakpoint_m) {
                        return "translate(65, 50)"
                        }
                })

            var stations_enter = stations.selectAll(".station")
                .data(opts.stations)
                .enter()
                .append("g")
                .attr("class", "station")
                .attr("id", function(d) { return d.station })

            stations_enter
                .append("circle")
                .attr("r", 10)
                .attr("cx", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_x * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_x ; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_x }

                })
                .attr("cy", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_y * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_y ; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_y }

                })
                .attr("fill", primary_color)
                .attr("stroke", background_color)
                .attr("stroke-width", 3)
                .style("opacity", 0)
                .transition()
                .duration(100)
                .delay(function(d) { return d.animation_time + 100; })
                .style("opacity", 1)

            stations_enter
                .append("circle")
                .attr("cx", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_x * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_x ; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_x }
                })
                .attr("cy", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_y * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_y ; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_y }

                })
                .attr("r", 6)
                .attr("fill", background_color)
                .style("opacity", 0)
                .transition()
                .delay(function(d) { return d.animation_time; })
                .style("opacity", 1)


            stations_enter
                .append("text")
                .attr("class", "stations-text")
                .attr("x", function(d) { if (window.innerWidth < breakpoint_m) {
                    return d.text_x * 0.75 + 15; } else if (window.innerWidth > breakpoint_l) {
                    return d.text_x  + 25; } else if (window.innerWidth > breakpoint_m) { 
                        return d.text_x + 15; }
                })
                .attr("y", function(d) { if (window.innerWidth < breakpoint_m) {
                    return d.text_y * 0.75 + 5; } else if (window.innerWidth > breakpoint_l) {
                    return d.text_y + 5; } else if (window.innerWidth > breakpoint_m) {
                    return d.text_y + 5; }
                })
                .style("opacity", 0)
                .transition()
                .delay(function(d) { return d.animation_time; })
                .style("opacity", 1)
                .text(function(d) { return d.station; })

            stations_enter.on("click", function (d) {
                select(".intro").style("opacity", 0);
                select("#frioul1").style("opacity", 0);
                select("#frioul2").style("opacity", 0);
                select(".sidebar").style("visibility", "visible");
                select(".sidebar").style("opacity", 1);

                that.update({
                    sidebar_data: d
                })
            })

        var metro_train = subway_line.append("g")
            .attr("class", "metro-train")
            //.attr("fill", "#52412F")
            .attr("fill", primary_color)

        metro_train.append("path")
            .style("display", "block")
            .attr("transform", "translate(7,0)rotate(70)")
            .attr("d", opts.svg_data[0].metro)
            .transition()
            .delay(800)
            .attr("transform", "translate(0,-5)rotate(100)")
            .transition()
            .delay(500)
            .attr("transform", "translate(0,-5)rotate(0)")
            .transition()
            .delay(450)
            .attr("transform", "translate(7,0)rotate(70)")
            .transition()
            .delay(2700)
            .attr("transform", "translate(0,-5)rotate(-25)")
            .transition()
            .delay(500)
            .attr("transform", "translate(6,-10)rotate(-25)")

        metroTransition();

        function metroTransition() {
          metro_train.transition()
              .duration(6000)
              .ease(easeLinear)
              .attrTween("transform", translateAlong(subway_path.node()))
        }

        // Returns an attrTween for translating along the specified path element.
        function translateAlong(path) {
          return function(d, i, a) {
            return function(t) {
              var p = path.getPointAtLength(t * totalLength);
              return "translate(" + p.x + "," + p.y + ")";
            };
          };
        }
        subway_line.exit().remove()

        }

        // Redraw based on the new size whenever the browser window is resized.
        window.onresize = function () { drawBackground(); riot.update(); };

    </script>
</metro-app>
