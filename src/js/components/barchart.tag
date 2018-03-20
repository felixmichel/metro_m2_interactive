<metro-barchart>
  <div class="wrapper { opts.size }">
    <svg id="{ opts.series }"></svg>
  </div>

<script type="text/javascript">
	import { csv } from "d3-fetch";
  import { event, select, selectAll } from "d3-selection";
  import { scaleBand, scaleLinear } from "d3-scale";
  import { min, max } from "d3-array";
  import { axisBottom, axisLeft } from "d3-axis";
  import { transition } from 'd3-transition'
  import { format } from 'd3-format'

  var primary_color = opts.color;
  var background_color = "#EDE6DE";

  var breakpoint_l = 1550;
  var breakpoint_ml = 1199;
  var breakpoint_m = 520;

  opts.scrollevent.on('draw', function () {
    drawChart()
  })

  function drawChart () {
  
  var series = opts.series;

  //var svg_width = Math.max(0, window.innerWidth),
	var svg = select("#" + opts.series)
  var svg_width = svg.node().parentNode.getBoundingClientRect().width
  var svg_height = opts.height ? opts.height : 500;

	svg.selectAll("*").remove();
	svg.attr("width", svg_width);
  svg.attr("height", svg_height);

	var margin = {top: 35, right: window.innerWidth < breakpoint_m ? 25 : 35, bottom: 175, left: 47},
	width = +svg.attr("width") - margin.left - margin.right,
	height = +svg.attr("height") - margin.top - margin.bottom;

	svg.style("background-color", background_color);
	
	var x = scaleBand().rangeRound([0, width]).padding(0.1),
	y = scaleLinear().rangeRound([height, 0]);

	var g = svg.append("g")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	csv("data/m2_stat.csv", function(d) {
		d[series] = +d[series];
		return d; })
	.then(function(data) {
    var max_value = max(data, function(d) { return d[series]; })
		x.domain(data.map(function(d) { return d.station; }));
		y.domain([0, opts.max_value ? opts.max_value : max_value]);

    var formatting = format("d")

    var y_axis = g.append("g")
      .attr("class", "axis axis--y")
        .attr("fill", primary_color)
        .call(axisLeft(y).ticks(5)
        .tickFormat(d => formatting(d) + opts.suffix))
    
    y_axis.append("g")
      .attr("class", "chart-title")
      .append("text")
      .attr("fill", primary_color)
      .attr("y", -30)
      .attr("x", 10)
      .attr("dy", "0.71em")
      .attr("text-anchor", "start")
      .text(opts.title);

		var x_axis = g.append("g")
			.attr("class", "axis axis--x")

  	x_axis.append("line")
    	.attr("x1", -35)
    	.attr("x2", width)
      .attr("y1", 15)
      .attr("y2", 15)
      .attr("stroke-width", 3)
			.attr("stroke", primary_color);

	  x_axis
    	.attr("transform", "translate(0," + height + ")")
      .call(axisBottom(x).tickPadding(20));

    var bar = g.selectAll(".bar").data(data);
    var bar_enter = bar.enter().append("g").attr("class", "bar");

    bar_enter.append("rect");
    bar_enter.append("text").attr("class", "bar-value");

    var bar_update = bar.merge(bar_enter);

    bar_update.attr("transform", function(d) {
      return "translate(" + x(d.station) + ", 0 )";
    });

    bar_update.select("rect")
    		.attr("y", height)
    		.attr("width", x.bandwidth())
        .attr("fill", primary_color)
    		.transition()
        .delay(200)
    		.duration(3000)
    		.attr("y", function(d) { return y(d[series]); })
    		.attr("height", function(d) { return height - y(d[series]); });

    bar_update.select(".bar-value")
      .transition()
      .text(function(d) { return Math.round(d[series]) + opts.suffix; })
      .style("text-anchor", "middle")
      .attr("x", x.bandwidth() / 2)
      .attr("y", function(d) {
        var offset = -5
        return y(d[series]) + offset; })
      .attr("opacity",  0);

    bar_update.on("mouseenter", function(d, i) {
     select(this).select(".bar-value")
      .attr("opacity", "1");
    })

    bar_update.on("mouseleave", function(d, i) {
     select(this).select(".bar-value")
      .attr("opacity", "0");
    })

    var ticks = x_axis.selectAll(".tick");
    
    ticks.each(function() { select(this)
  		.append("circle")
  		.attr("r", 5)
  		.attr("cy", 15)
  		.attr("fill", primary_color)
  		.attr("stroke", background_color)
  		.attr("stroke-width", 1); })

    ticks.selectAll("line").remove();

    ticks.each(function() { select(this)
  		.append("circle")
  		.attr("r", 3.5)
  		.attr("cy", 15)
  		.attr("fill", background_color) })

    x_axis.selectAll("text")
      .attr("class", "barchart-label")
    	.attr("y", 10)
  		.attr("x", -25)
  		.attr("transform", "rotate(-45)")
  		.style("text-anchor", "end");

  	// logo and train
  	var m2_logo = x_axis.append("g")
  		.attr("class", "m2-logo")
  		.attr("transform", "translate(-30, 15)")

  	m2_logo
  		.append("circle")
  		.attr("r", 11)
  		.attr("fill", primary_color)
  	
  	m2_logo
  		.append("g")
  		.attr("fill", background_color)
  		.attr("transform", "translate(-6.5, -4)")

  	m2_logo.select("g")
  		.append("polygon")
  		.attr("points", "6.94 7.86177778 5.46888889 7.86177778 5.46888889 3.46711111 4.028 6.32666667 3.03244444 6.32666667 1.58177778 3.46711111 1.58177778 7.86177778 0.109777778 7.86177778 0.109777778 0.323111111 1.55466667 0.323111111 3.51733333 4.39866667 5.46888889 0.323111111 6.94 0.323111111 6.94 7.86177778")
  	
  	m2_logo.select("g")
  		.append("path")
  		.attr("d", "M13.028,7.86177778 L8.44355556,7.86177778 L8.44355556,6.62266667 L11.2506667,3.35066667 C11.5111111,3.04666667 11.6408889,2.74311111 11.6408889,2.44 C11.6408889,2.15733333 11.5622222,1.93066667 11.4035556,1.75644444 C11.2453333,1.58355556 11.0217778,1.49733333 10.7337778,1.49733333 C10.1222222,1.49733333 9.81555556,1.81822222 9.81555556,2.46044444 L8.44355556,2.46044444 C8.44355556,1.79022222 8.66577778,1.25022222 9.11022222,0.840888889 C9.53422222,0.452888889 10.0773333,0.258666667 10.7408889,0.258666667 C11.4182222,0.258666667 11.9688889,0.456444444 12.3928889,0.851555556 C12.8164444,1.24622222 13.0288889,1.78044444 13.0288889,2.45066667 C13.0288889,2.78977778 12.9582222,3.09288889 12.816,3.36133333 C12.7173333,3.56577778 12.5195556,3.83688889 12.2235556,4.176 L10.1155556,6.62222222 L13.0288889,6.62222222 L13.0288889,7.86177778 L13.028,7.86177778 Z")
  		.style("display", "block")

  	var metro_train = x_axis.append("g")
  		.attr("class", "metro-train")
  		.attr("fill", primary_color)
  		.attr("transform", "translate(0, 3.5)")

  	metro_train.append("path")
  		.style("display", "block")
  		.attr("d", "M19.8316327,0.135714286 L2.80561224,0.135714286 C1.39030612,0.135714286 0.240306122,1.26887755 0.240306122,2.65459184 L0.240306122,8.13571429 C0.240306122,9.55765306 1.41428571,10.7540816 2.80561224,10.7540816 L22.0316327,10.7540816 C23.4239796,10.7540816 24.6045918,9.55765306 24.6045918,8.13571429 L24.6045918,4.85357143 C24.6040816,2.25561224 22.4612245,0.135714286 19.8316327,0.135714286 Z M22.8153061,4.85357143 L22.8153061,7.12091837 L21.4020408,7.12091837 C20.7326531,7.12091837 20.1892857,6.58163265 20.1892857,5.91173469 L20.1892857,4.60561224 L22.8020408,4.60561224 C22.8102041,4.6877551 22.8153061,4.77040816 22.8153061,4.85357143 Z M11.6392857,8.96530612 L9.23571429,8.96530612 L9.23571429,4.60612245 L11.6392857,4.60612245 L11.6392857,8.96530612 L11.6392857,8.96530612 Z M22.0311224,8.96530612 L12.9806122,8.96530612 L12.9806122,3.93571429 C12.9806122,3.56530612 12.6795918,3.26581633 12.3102041,3.26581633 L8.56632653,3.26581633 C8.19540816,3.26581633 7.89642857,3.56581633 7.89642857,3.93571429 L7.89642857,8.96530612 L2.80561224,8.96530612 C2.39795918,8.96530612 2.02908163,8.57193878 2.02908163,8.13520408 L2.02908163,2.65459184 C2.02908163,2.24846939 2.36989796,1.92397959 2.80561224,1.92397959 L19.8316327,1.92397959 C20.880102,1.92397959 21.8015306,2.46020408 22.3336735,3.26530612 L19.5158163,3.26530612 C19.1459184,3.26530612 18.8479592,3.57142857 18.8479592,3.94234694 L18.8479592,5.91173469 C18.8479592,7.32244898 19.9918367,8.46173469 21.4020408,8.46173469 L22.7433673,8.46173469 C22.6158163,8.7505102 22.3336735,8.96530612 22.0311224,8.96530612 Z M6.1627551,3.26530612 L3.87193878,3.26530612 C3.50204082,3.26530612 3.20204082,3.56530612 3.20204082,3.93520408 L3.20204082,6.45102041 C3.20204082,6.82142857 3.50306122,7.12091837 3.87193878,7.12091837 L6.1627551,7.12091837 C6.53418367,7.12091837 6.83316327,6.82040816 6.83316327,6.45102041 L6.83316327,3.93520408 C6.83367347,3.56530612 6.53367347,3.26530612 6.1627551,3.26530612 Z M5.49234694,5.78010204 L4.54285714,5.78010204 L4.54285714,4.60612245 L5.49234694,4.60612245 L5.49234694,5.78010204 Z M17.0596939,3.26530612 L14.7688776,3.26530612 C14.3979592,3.26530612 14.0994898,3.56530612 14.0994898,3.93520408 L14.0994898,6.45102041 C14.0994898,6.82142857 14.3989796,7.12091837 14.7688776,7.12091837 L17.0596939,7.12091837 C17.4306122,7.12091837 17.7295918,6.82040816 17.7295918,6.45102041 L17.7295918,3.93520408 C17.730102,3.56530612 17.430102,3.26530612 17.0596939,3.26530612 Z M16.3887755,5.78010204 L15.4397959,5.78010204 L15.4397959,4.60612245 L16.3887755,4.60612245 L16.3887755,5.78010204 Z M23.7071429,11.3678571 L1.13163265,11.3678571 C0.761734694,11.3678571 0.461734694,11.6683673 0.461734694,12.0387755 C0.461734694,12.4086735 0.762755102,12.7081633 1.13163265,12.7081633 L23.7071429,12.7081633 C24.0785714,12.7081633 24.377551,12.4076531 24.377551,12.0387755 C24.377551,11.6683673 24.077551,11.3678571 23.7071429,11.3678571 Z")

  	metro_train.transition()
      .delay(200)
  		.duration(3000)
  		.attr("transform", "translate(" + width + ", 3.5)")
  	});
}
</script>

</metro-barchart>