extends ReferenceRect

var url = ""

func _ready():
	pass # Replace with function body.

func set_channel_name(t):
	$Control/name.text = t
	

func set_nowplaying(t):
	if t != null:
		$Control/nowplaying.text = t
		$Popup/np.text = t
		
func set_longdesc(t):
	if t != null:
		$Popup/longdesc.text = t

func get_name():
	return $Control/name.text

func play_pressed():
	OS.execute("vlc", [url], false)

func _on_Control_mouse_entered():
	$Popup.show()

func _on_Control_mouse_exited():
	$Popup.hide()

