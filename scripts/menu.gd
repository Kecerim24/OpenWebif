extends Control

var services
var specifics

func _ready():
	pass



func allservices_request_completed(result, response_code, headers, body):
	services = JSON.parse(body.get_string_from_utf8()).result.services
	for service in services:
		$groups.add_item(service.servicename)
	


func group_selected(index):
	$programs.clear()
	var groupname = $groups.get_at(index)
	for service in services:
		if service.servicename == groupname:
			print(service.servicereference)
			$nowplaying.request(Global.ip + "/api/epgnow?bRef=" + service.servicereference.percent_encode())		
			break
	$programs.show()



func nowplaying_completed(result, response_code, headers, body):
	var now = JSON.parse(body.get_string_from_utf8()).result.events
	for chan in now:
		$programs.add_item(chan.sname, chan.title, Global.ip + "/web/stream.m3u?ref=" + chan.sref.percent_encode() + "&name=" + chan.sname.percent_encode(), chan.longdesc)


func ipset_pressed():
	Global.ip = "http://" + $ip.text
	$allservices.request(Global.ip + "/api/getallservices")
