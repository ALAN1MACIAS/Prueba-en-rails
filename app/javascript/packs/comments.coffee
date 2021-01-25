$(document).on "ajax:success", "form#comments-form",(data, status, xhr) ->
	console.log data.detail
	console.log status
	console.log xhr

$(document).on "ajax:error", "form#comments-form",(data, status, xhr) ->
	console.log "Error"
	# $("#comments-box").append("<li>#{data.body}</li>");
