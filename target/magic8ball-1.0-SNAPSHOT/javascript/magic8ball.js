$(document).ready(function(){
	$('.formM8B').submit(function(){
		var m8bIdentifier = $(this).find('.m8bIdentifier').val();
		var m8bPath = $('#m8bPath_' + m8bIdentifier).val();
		var idInput = '#m8bQuestionInput_' + m8bIdentifier;
		var required = '#required_' + m8bIdentifier;
		var m8bQuestionInput = '#m8bQuestionInput_' + m8bIdentifier;
		var m8bAnswerContainer = '#m8bAnswerContainer_' + m8bIdentifier;
		
		var data = {};
		data["question"] = $(m8bQuestionInput).val();
		
		if($(idInput).val() != ''){
			$.post(m8bPath + '.magic8ballAnswer.do', data, function(result) {
				$(m8bAnswerContainer).html('<p>' + result['answerLabel'] + '</p>');
				$(m8bAnswerContainer).fadeIn('slow').delay(4000).fadeOut('slow');
				$(m8bQuestionInput).val('');
			}, "json");
			return false;
		}
		else{
			$(required).fadeIn('slow').delay(4000).fadeOut('slow');
			return false;
		}
	});
});