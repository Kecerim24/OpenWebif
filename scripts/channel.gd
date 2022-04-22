extends Control

var url = ""

func _ready():
	pass # Replace with function body.

func set_channel_name(t):
	if t != null: 
		$detail/name.text = t
		$name.text = t

func set_nowplaying(t):
	if t != null:
		$nowplaying.text = t
		$detail/nowplaying.text = t

func set_longdesc(t):
	if t != null: $detail/epgtext.text = t

func get_name():
	return $name.text

func play_pressed():
	OS.execute("vlc", [url], false)
	
func _on_updown_toggled(button_pressed):	
	if button_pressed:
		$detail/detailscroll.max_value = $detail/epgtext.get_line_count() - 10
		$detail.show()
	else:
		$detail.hide()

func detailscroll_value_changed(value):
	$detail/epgtext.lines_skipped = value
