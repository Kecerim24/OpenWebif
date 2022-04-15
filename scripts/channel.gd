extends ReferenceRect

var url = ""

func _ready():
	pass # Replace with function body.

func set_channel_name(t):
	if t != null: $Control/name.text = t
	

func set_nowplaying(t):
	if t != null:
		$Control/nowplaying.text = t
		$Popup/np.text = t
		
func set_longdesc(t):
	if t != null: $Popup/longdesc.text = t

func get_name():
	return $Control/name.text

func play_pressed():
	var err = OS.execute("vlc", [url], false)
	if err != 0: print("Error opening vlc")

func _on_Control_mouse_entered():
	$Popup.show()

func _on_Control_mouse_exited():
	$Popup.hide()

