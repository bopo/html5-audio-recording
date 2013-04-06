navigator.getUserMedia  = navigator.getUserMedia ||
	navigator.webkitGetUserMedia ||
	navigator.mozGetUserMedia ||
	navigator.msGetUserMedia

window.recorder =
	init: ->
		@context = new webkitAudioContext()
		$(document).on 'click', '#start-recording', =>
			navigator.getUserMedia {audio: true}, @onSuccess.bind(@), @onFail.bind(@)
		$(document).on 'click', '#playback', @playback.bind(@)

	onSuccess: (stream) ->
		console.log "Streaming!", stream
		@mediaStreamSource = @context.createMediaStreamSource(stream)

	onFail: (e) -> console.log "fail!", e

	playback: -> @mediaStreamSource.connect(@context.destination);

recorder.init()