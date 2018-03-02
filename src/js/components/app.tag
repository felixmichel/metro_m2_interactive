<metro-app>
    <div class="container">
        <svg id="map_background"></svg>

    </div>

    <metro-barchart series="age"></metro-barchart>

    <metro-barchart series="revenue"></metro-barchart>

    <script type="text/javascript">
        import { select } from "d3-selection";

        this.on("mount", () => {
            drawBackground();
        })

        function drawBackground () {
            var svg_width = Math.max(0, window.innerWidth);
            var svg_height = Math.max(0, window.innerHeight);
            var svg = select("#map_background").attr("width", svg_width).attr("height", svg_height);

            svg.style("background-color", "red");
        }

        // Redraw based on the new size whenever the browser window is resized.
        window.onresize = function() { drawBackground(); riot.update(); };

    </script>
</metro-app>
