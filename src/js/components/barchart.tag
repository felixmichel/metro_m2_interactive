<metro-barchart>
	<svg width="960" height="500"></svg>

<script type="text/javascript">
	import { csv } from 'd3-fetch';
    import { select, selectAll } from 'd3-selection';
    import { scaleBand, scaleLinear } from 'd3-scale';
    import { min, max } from 'd3-array';
    import { axisBottom, axisLeft } from 'd3-axis';

    this.on('updated', () => {
    	var svg = select("svg"),
    	margin = {top: 20, right: 20, bottom: 30, left: 40},
    	width = svg.attr("width") - margin.left - margin.right,
    	height = svg.attr("height") - margin.top - margin.bottom;
    	
    	var x = scaleBand().rangeRound([0, width]).padding(0.1),
    	y = scaleLinear().rangeRound([height, 0]);

    	var g = svg.append("g")
    		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    	csv("/data/content.csv").then(function(data) {
    		x.domain(data.map(function(d) { return d.station; }));
    		y.domain([0, max(data, function(d) { return d.revenue; })]);

    	g.append("g")
  			.attr("class", "axis axis--x")
      		.attr("transform", "translate(0," + height + ")")
      		.call(axisBottom(x));

      	g.append("g")
    		.attr("class", "axis axis--y")
    		.call(axisLeft(y).ticks(10, "%"))
    		.append("text")
      		.attr("transform", "rotate(-90)")
      		.attr("y", 6)
      		.attr("dy", "0.71em")
      		.attr("text-anchor", "end")
      		.text("Revenue");

  		g.selectAll(".bar")
    		.data(data)
    		.enter().append("rect")
      		.attr("class", "bar")
      		.attr("x", function(d) { return x(d.station); })
      		.attr("y", function(d) { return y(d.revenue); })
      		.attr("width", x.bandwidth())
      		.attr("height", function(d) { return height - y(d.revenue); });
    });

    });


  	

  	

</script>

</metro-barchart>