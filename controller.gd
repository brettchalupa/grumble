extends Node

@export var jid: int # joystick id

# Called when the node enters the scene tree for the first time.
func _ready():
	$ID.text = "ID:\n%s" % jid
	$Name.text = "NAME:\n" + Input.get_joy_name(jid)
	$GUID.text = "UID:\n" + Input.get_joy_guid(jid)

func _on_rumble_button_pressed():
	Input.start_joy_vibration(jid, 0.25, 0.25, 1.0)
