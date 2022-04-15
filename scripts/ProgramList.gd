extends VBoxContainer

func clear():
	for item in $ScrollList/List.get_children(): item.queue_free()

func add_item(name, np, url, longdesc):
	var c = preload("res://scenes/channel.tscn").instance()
	c.set_channel_name(name)
	c.set_nowplaying(np)
	c.set_longdesc(longdesc)
	c.url = url
	
	$ScrollList/List.add_child(c)
	
func get_at(idx):
	return $ScrollList/List.get_child(idx).text

func has_items():
	return $ScrollList/List.get_child_count() != 0

func search_for(text):
	for item in $ScrollList/List.get_children():
		if text == "":
			item.get_child(0).show()
			continue
			
		if not (text.to_lower() in item.get_name().to_lower()): 
			item.get_child(0).hide()
		else: 
			item.get_child(0).show()
