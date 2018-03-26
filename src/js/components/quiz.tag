<metro-quiz>
	<div id={ opts.quizid } class="quiz-overlay">
		<span class="headline">Ce préjugé est-il vrai ?</span>
  		<span class="stereotype">{ opts.headline }</span>
  		<button class="quiz-button yes" onclick="{ yesanswer }">C'est vrai</button>
  		<button class="quiz-button no" onclick="{ noanswer }">Pas vrai !</button>
  		<span class="resolution right">{ opts.right }</span>
  		<span class="resolution wrong">{ opts.wrong }</span>
  	</div>

<script type="text/javascript">
	import { select } from 'd3-selection'

	this.yesanswer = function (e) {
		var quiz = select('#' + opts.quizid)
		//.style('pointer-events', 'none')
		quiz.select('.question-mark').style('display', 'none')
	    opts.onanswerclick(opts.quizid)
	    quiz.select('.right').style('display', 'block').transition().style('opacity', 1)
	    if(opts.truthvalue == 'yes') {
	    	quiz.select('.yes').transition()
	    		.style('background-color', '#00B268')
	    		.style('color', '#EDE6DE')
	    	quiz.select('.no').transition()
	    		.style('border', 'none')
	    		.style('text-decoration', 'line-through')
	    } else {
	    	quiz.select('.no').transition()
	    		.style('background-color', '#FF3814')
	    		.style('color', '#EDE6DE')
	    	quiz.select('.yes').transition()
	    		.style('border', 'none')
	    		.style('text-decoration', 'line-through')
	    }
	 }

	 this.noanswer = function (e) {
		var quiz = select('#' + opts.quizid)
		//.style('pointer-events', 'none')
		quiz.select('.question-mark').style('display', 'none')
	    opts.onanswerclick(opts.quizid)
	    quiz.select('.wrong').style('display', 'block').transition().style('opacity', 1)
	    if(opts.truthvalue == 'yes') {
	    	quiz.select('.yes').transition()
	    		.style('background-color', '#00B268')
	    		.style('color', '#EDE6DE')
	    	quiz.select('.no').transition()
	    		.style('border', 'none')
	    		.style('text-decoration', 'line-through')
	    } else {
	    	quiz.select('.no').transition()
	    		.style('background-color', '#FF3814')
	    		.style('color', '#EDE6DE')
	    	quiz.select('.yes').transition()
	    		.style('border', 'none')
	    		.style('text-decoration', 'line-through')
	    }
	 }



</script>

</metro-quiz>