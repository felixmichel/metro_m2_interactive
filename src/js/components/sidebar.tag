<metro-sidebar>
	<span class="close">×</span>
	<h1>{ opts.data.station }</h1>
	<p class="sidebar-intro">{ opts.data.intro }</p>
	<!-- <hr> -->
	<div class="poster">
		<div>
			<img width="15%" src="img/pop.svg" class="poster-icon"><h2 class="poster-label">{ opts.data.data_point1 }</h2>
		</div>
		<div class="poster-container">
			<img  width="15%" src="img/money.svg" class="poster-icon"><h2 class="poster-label">35% moins de 18 ans</h2>
		</div>
		<div>
			<img  width="15%" src="img/bakery.svg" class="poster-icon"><h2 class="poster-label">35% moins de 18 ans</h2>
		</div>

		<div class="videoWrapper">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/hi4pzKvuEQM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</div>

	</div>

	<script type="text/babel">
	this.on('updated', function() {
		this.update()
	})
	</script>

</metro-sidebar>