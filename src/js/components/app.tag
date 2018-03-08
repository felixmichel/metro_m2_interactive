<metro-app>
    <div class="intro">
        <h1>Les inégalités de Marseille</h1>
        <h2>Les différences arrêt par arrêt</h2>
        <p class="author">Une enquête de <span>Nicolas Bocquet et Félix Michel</span></p>
    </div>
    <div class="container">
        <svg id="map_background"></svg>

        <div class="content">
            <p class="lead">
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
            </p>
            
        </div>


        




    </div>



    <metro-barchart series="age"></metro-barchart>

    <metro-barchart series="revenue"></metro-barchart>

    <script type="text/javascript">
        import { select } from "d3-selection";
        import { transition } from "d3-transition";
        import { easeLinear } from "d3-ease"

        // TODO: make it correctly using enter, append, merge and selections

        // TODO: add max container to svg element in order to optimize for all screen sizes

        var primary_color = "#FF3814";
        var background_color = "#EDE6DE";

        var breakpoint_l = 1800;
        var breakpoint_m = 520;

        this.on("mount", () => {
            console.log(window.location.href)
            drawBackground();

            console.log(opts)
        })

        function drawBackground () {

            var svg_width = Math.max(0, window.innerWidth);
            var svg_height = Math.max(720, window.innerHeight);
            
            var svg = select("#map_background")

            svg.selectAll("*").remove();

            svg.attr("width", svg_width)
                .attr("height", svg_height)
                .style("background-color", "#A0BEC9");

            var marseille_shape = svg.append("g")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(-400, -400)scale(2)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("polygon")
                .attr("points", "1692.40315 458.874539 1672.82957 485.321289 1682.61788 494.612613 1689.65328 515.52062 1699.93433 546.074095 1663.79398 578.235484 1644.22039 620.405643 1613.35308 615.403655 1605.82291 650.424281 1574.9556 641.131999 1565.1683 714.036325 1618.62005 775.503701 1648.73566 910.589973 1685.62671 934.175567 1681.86213 962.051456 1601.3036 962.051456 1585.49359 1015.65665 1644.97008 1088.5581 1611.09191 1189.33543 1585.49359 1179.32858 1579.47087 1184.33153 1579.47087 1197.91315 1564.41458 1197.91315 1551.6134 1179.32858 1551.6134 1172.18097 1519.99236 1168.60812 1491.38318 1160.03041 1443.95112 1155.74203 1391.24905 1129.29816 1358.12258 1129.29816 1315.96053 1129.29816 1285.84491 1112.85826 1304.66679 1160.03041 1318.97138 1168.60812 1337.04156 1175.75669 1337.04156 1181.83197 1315.96053 1179.32858 1304.66679 1172.18097 1282.83507 1165.74792 1267.02303 1157.88574 1250.46031 1157.88574 1221.84911 1138.94725 1176.67519 1138.94725 1182.69993 1157.88574 1163.12432 1155.74203 1072.77951 1117.14951 983.933048 1140.01862 965.863883 1140.01862 930.478266 1150.74004 913.160804 1165.74792 904.126221 1165.74792 889.821634 1161.46051 877.776197 1145.38029 862.718897 1150.74004 850.670429 1150.74004 834.106691 1140.01862 809.262094 1135.7312 800.980225 1131.44187 775.381904 1130.7273 775.381904 1120.71949 788.181064 1114.28644 800.980225 1120.71949 796.463944 1072.83181 809.262094 1042.81509 809.262094 1022.80043 826.579556 1008.50616 856.695168 999.214832 883.798916 918.44928 896.973928 912.017194 918.430809 924.882325 941.771999 899.153023 945.537588 836.970118 924.455548 788.367873 869.493318 764.780361 869.493318 746.913243 818.299707 701.884805 805.499537 706.887752 793.4541 698.310998 782.91207 698.310998 782.91207 683.302158 797.216657 676.869113 797.216657 664.718552 813.780395 646.849515 822.816999 643.990277 825.826842 635.056718 819.805134 626.123159 819.805134 608.254122 825.826842 603.252135 851.426173 612.147328 863.47262 612.147328 875.516036 621.834782 916.173679 608.254122 912.784952 597.531741 865.731771 601.820118 838.627013 582.522901 865.731771 568.226713 869.495339 505.331157 750.536297 338.087333 649.64844 256.60913 654.919456 236.595425 576.616035 190.134971 520.905133 210.150594 501.329531 200.141823 474.978497 229.44877 444.861874 237.308077 437.331708 190.134971 432.814417 163.692058 435.074578 138.674448 444.861874 121.522858 469.705461 106.513059 439.966711 77.9226005 450.131879 55.7671052 484.764782 42.1874047 499.06937 35.7534005 505.844801 20.0299911 541.230418 31.4650235 549.512287 48.9743775 563.817885 48.9743775 576.616035 66.8453324 615.76724 102.223723 615.76724 121.522858 693.313906 121.522858 720.420685 92.2159114 720.420685 84.5340481 727.198137 84.5340481 743.007141 92.2159114 800.226501 96.5071659 807.754646 84.5340481 803.992089 66.8453324 785.921913 48.9743775 870.245021 0.0162864087 902.619784 20.0299911 907.137075 31.4650235 910.401528 52.5385933 894.337915 63.6283303 915.418944 80.7837565 894.337915 106.513059 985.438475 102.223723 1003.50663 106.868905 998.991359 96.5033293 1013.29595 87.9256162 1035.8824 100.075218 1062.98514 75.0595261 1090.84261 82.2061816 1528.54298 78.8059812")

            var frioul_shape_1 = svg.append("g")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(-400, -400)scale(2)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("path")
                .style("display", "block")
                .attr("d", "M659.997171,662.554701 C653.601632,655.860766 650.841346,645.723468 636.475127,646.597258 C619.876026,651.045813 645.573362,669.037622 629.753244,672.125138 C612.503476,660.461827 576.965295,662.56621 559.189133,675.316243 C566.997146,679.603661 584.296422,674.875032 582.710166,688.075867 C559.787262,695.023977 531.723678,697.091913 512.144034,707.215782 C539.98534,726.412288 560.89562,690.746151 589.43306,707.215782 C605.139008,695.53137 617.060171,690.070907 643.19802,694.455199 C650.606944,689.792752 641.222779,669.184372 653.28034,668.934033 C669.415688,676.948723 683.96175,666.915973 686.880662,652.982345 C667.498037,647.940073 671.79204,655.637283 659.997171,662.554701 Z")

            var frioul_shape_2 = svg.append("g")
                .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(-400, -400)scale(2)" } else if (window.innerWidth > breakpoint_m) {
                    return "translate(-300, -300)" } else if (window.innerWidth < breakpoint_m) {
                    return "translate(-625, -200)scale(0.75)"
                    }
                })
                .attr("stroke-width", 2)
                .attr("stroke", "#DBCDBE")
                .attr("fill", background_color)
                .append("path")
                .style("display", "block")
                .attr("d", "M535.67012,771.018698 C538.333412,806.499718 497.142303,800.36401 478.547754,815.676902 C486.410326,831.043506 477.535379,845.346409 488.627042,853.954815 C496.840207,820.282759 531.979298,812.172154 555.831727,793.346841 C541.102791,751.059665 615.893212,770.795215 619.675976,735.928053 C569.739246,714.399845 568.398506,765.664701 535.67012,771.018698 Z")

            var subway_line = svg.append("g")
               .attr("transform", function () { if (window.innerWidth > breakpoint_l) { 
                    return "translate(-400, -400)scale(2)" } else if (window.innerWidth > breakpoint_m) {
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
                .attr("d", "M921.587842,334.25066 C922.535553,339.359114 923.206428,344.729416 924.571416,349.44078 C926.035419,354.495521 928.69669,359.738256 930.161703,363.465528 C931.625705,367.1928 932.757302,368.267052 933.356441,371.804412 C933.955581,375.341771 934.154621,380.712074 933.755531,384.692562 C933.356441,388.673051 931.773217,392.489524 930.960893,395.685425 C930.147558,398.881325 933.493849,406.621697 934.901272,412.790975 C936.308695,418.961212 941.674683,433.211361 941.342277,441.171379 C941.00886,449.131397 935.503443,450.321707 930.960893,452.163282 C926.351659,454.032673 917.052364,458.480269 910.996304,461.639722 C904.940244,464.799175 898.152688,468.84105 894.625543,471.115203 C891.098399,473.389357 885.641479,479.138526 884.643249,481.728241 C883.64502,484.318916 883.511653,487.792971 883.84507,490.825815 C884.177476,493.857701 884.909982,496.195159 886.639708,499.922431 C888.369433,503.649703 892.495718,510.345556 894.226454,513.189447 C895.956179,516.032379 900.149147,522.033805 902.611379,523.801526 C905.074621,525.571164 908.001616,526.3922 911.794483,527.592102 C915.587351,528.792962 929.230157,532.520234 931.759072,532.520234 C934.287987,532.520234 938.080855,531.382678 940.543087,531.003812 C943.005319,530.624946 951.922701,525.633509 954.518299,523.423619 C957.112887,521.21181 959.708486,518.368878 962.104035,516.979064 C964.500593,515.58925 965.896902,515.336993 968.891591,515.083776 C971.886279,514.830559 975.37604,515.039655 978.304045,515.798346 C981.23205,516.556077 983.735707,518.701704 985.399759,520.470384 C987.062801,522.240023 987.595258,524.387569 988.993587,526.914939 C990.391917,529.442309 992.520732,532.537499 993.784684,535.632689 C995.048637,538.729796 995.847827,541.694541 996.580333,545.486076 C997.31284,549.274734 998.705107,552.73632 999.237563,557.534967 C999.77002,562.336491 999.784165,568.465485 1000.83493,573.455003 C1001.8857,578.444522 1002.56466,587.543055 1004.82785,592.408843 C1007.09003,597.270794 1011.88113,597.655414 1014.41004,602.645892 C1016.93896,607.632533 1019.14759,619.352434 1020.00033,622.355545 C1020.85206,625.360574 1019.46787,627.850538 1019.60124,633.725355 C1019.73461,639.600172 1020.53279,650.090438 1020.79952,657.60445 C1021.06524,665.122298 1019.20215,682.621101 1025.59062,698.920962 C1031.97908,715.216027 1051.61026,764.559698 1059.92951,785.722469 C1068.24775,806.883322 1072.37403,818.13036 1075.50209,825.902384 C1078.63014,833.673448 1087.08074,839.295049 1089.87639,843.717708 C1092.67103,848.13653 1093.65208,854.571493 1095.46567,858.880971 C1097.27925,863.183736 1098.85945,872.399286 1102.65332,875.937605 C1106.4472,879.474964 1114.23198,880.169392 1118.22591,880.106087 C1122.21781,880.04662 1122.35118,877.264114 1126.61083,875.55778 C1130.86947,873.8572 1138.98766,872.46259 1143.78078,869.871916 C1148.57188,867.283159 1150.90074,863.050413 1155.35842,860.020446 C1159.81813,856.987602 1165.47408,854.460231 1170.53192,851.680603")

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
                    return "translate(1440, 275)" } else if (window.innerWidth > breakpoint_m) {
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
                .attr("r", window.innerWidth > breakpoint_l ? 16 : 10)
                .attr("cx", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_x * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_x * 2; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_x }

                })
                .attr("cy", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_y * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_y * 2; } else if (window.innerWidth > breakpoint_m) {
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
                    return d.position_x * 2; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_x }
                })
                .attr("cy", function(d) { if (window.innerWidth < breakpoint_m) { 
                    return d.position_y * 0.75; } else if (window.innerWidth > breakpoint_l) {
                    return d.position_y * 2; } else if (window.innerWidth > breakpoint_m) {
                    return d.position_y }

                })
                .attr("r", window.innerWidth > breakpoint_l ? 12 : 6)
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
                    return d.text_x * 2 + 25; } else if (window.innerWidth > breakpoint_m) { 
                        return d.text_x + 15; }
                })
                .attr("y", function(d) { if (window.innerWidth < breakpoint_m) {
                    return d.text_y * 0.75 + 5; } else if (window.innerWidth > breakpoint_l) {
                    return d.text_y * 2 + 5; } else if (window.innerWidth > breakpoint_m) {
                    return d.text_y + 5; }
                })
                .style("opacity", 0)
                .transition()
                .delay(function(d) { return d.animation_time; })
                .style("opacity", 1)
                .text(function(d) { return d.station; })

        var metro_train = subway_line.append("g")
            .attr("class", "metro-train")
            //.attr("fill", "#52412F")
            .attr("fill", primary_color)

        metro_train.append("path")
            .style("display", "block")
            .attr("transform", "translate(7,0)rotate(70)")
            .attr("d", "M19.8316327,0.135714286 L2.80561224,0.135714286 C1.39030612,0.135714286 0.240306122,1.26887755 0.240306122,2.65459184 L0.240306122,8.13571429 C0.240306122,9.55765306 1.41428571,10.7540816 2.80561224,10.7540816 L22.0316327,10.7540816 C23.4239796,10.7540816 24.6045918,9.55765306 24.6045918,8.13571429 L24.6045918,4.85357143 C24.6040816,2.25561224 22.4612245,0.135714286 19.8316327,0.135714286 Z M22.8153061,4.85357143 L22.8153061,7.12091837 L21.4020408,7.12091837 C20.7326531,7.12091837 20.1892857,6.58163265 20.1892857,5.91173469 L20.1892857,4.60561224 L22.8020408,4.60561224 C22.8102041,4.6877551 22.8153061,4.77040816 22.8153061,4.85357143 Z M11.6392857,8.96530612 L9.23571429,8.96530612 L9.23571429,4.60612245 L11.6392857,4.60612245 L11.6392857,8.96530612 L11.6392857,8.96530612 Z M22.0311224,8.96530612 L12.9806122,8.96530612 L12.9806122,3.93571429 C12.9806122,3.56530612 12.6795918,3.26581633 12.3102041,3.26581633 L8.56632653,3.26581633 C8.19540816,3.26581633 7.89642857,3.56581633 7.89642857,3.93571429 L7.89642857,8.96530612 L2.80561224,8.96530612 C2.39795918,8.96530612 2.02908163,8.57193878 2.02908163,8.13520408 L2.02908163,2.65459184 C2.02908163,2.24846939 2.36989796,1.92397959 2.80561224,1.92397959 L19.8316327,1.92397959 C20.880102,1.92397959 21.8015306,2.46020408 22.3336735,3.26530612 L19.5158163,3.26530612 C19.1459184,3.26530612 18.8479592,3.57142857 18.8479592,3.94234694 L18.8479592,5.91173469 C18.8479592,7.32244898 19.9918367,8.46173469 21.4020408,8.46173469 L22.7433673,8.46173469 C22.6158163,8.7505102 22.3336735,8.96530612 22.0311224,8.96530612 Z M6.1627551,3.26530612 L3.87193878,3.26530612 C3.50204082,3.26530612 3.20204082,3.56530612 3.20204082,3.93520408 L3.20204082,6.45102041 C3.20204082,6.82142857 3.50306122,7.12091837 3.87193878,7.12091837 L6.1627551,7.12091837 C6.53418367,7.12091837 6.83316327,6.82040816 6.83316327,6.45102041 L6.83316327,3.93520408 C6.83367347,3.56530612 6.53367347,3.26530612 6.1627551,3.26530612 Z M5.49234694,5.78010204 L4.54285714,5.78010204 L4.54285714,4.60612245 L5.49234694,4.60612245 L5.49234694,5.78010204 Z M17.0596939,3.26530612 L14.7688776,3.26530612 C14.3979592,3.26530612 14.0994898,3.56530612 14.0994898,3.93520408 L14.0994898,6.45102041 C14.0994898,6.82142857 14.3989796,7.12091837 14.7688776,7.12091837 L17.0596939,7.12091837 C17.4306122,7.12091837 17.7295918,6.82040816 17.7295918,6.45102041 L17.7295918,3.93520408 C17.730102,3.56530612 17.430102,3.26530612 17.0596939,3.26530612 Z M16.3887755,5.78010204 L15.4397959,5.78010204 L15.4397959,4.60612245 L16.3887755,4.60612245 L16.3887755,5.78010204 Z M23.7071429,11.3678571 L1.13163265,11.3678571 C0.761734694,11.3678571 0.461734694,11.6683673 0.461734694,12.0387755 C0.461734694,12.4086735 0.762755102,12.7081633 1.13163265,12.7081633 L23.7071429,12.7081633 C24.0785714,12.7081633 24.377551,12.4076531 24.377551,12.0387755 C24.377551,11.6683673 24.077551,11.3678571 23.7071429,11.3678571 Z")
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
