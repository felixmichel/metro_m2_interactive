<metro-sidebar>
	<h1>{ opts.data.station }</h1>
	<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
	<div class="poster">
		<div>
			<img src="img/pop.svg" class="poster-icon"><h2 class="poster-label">35% moins de 18 ans</h2>
		</div>
		<div class="poster-container">
			<img src="img/money.svg" class="poster-icon"><h2 class="poster-label">35% moins de 18 ans</h2>
		</div>
		<div>
			<img src="img/bakery.svg" class="poster-icon"><h2 class="poster-label">35% moins de 18 ans</h2>
		</div>
	</div>

	<iframe width="100%" height="236" src="https://www.youtube.com/embed/Y9ni0CghN4s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

	<script type="text/babel">

	this.on("updated", () => {
		console.log(opts)
	});

	</script>

</metro-sidebar>