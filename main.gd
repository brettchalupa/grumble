extends Node

@export var controller_scene: PackedScene
var controller_children = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed", _on_joy_connection_changed)
	_render_controllers()

func _on_joy_connection_changed(_id, _connected):
	_render_controllers()

func _render_controllers():
	for child in controller_children:
		remove_child(child)
		
	for id in Input.get_connected_joypads():
		var controller = controller_scene.instantiate()
		controller.jid = id
		controller.position.x = id * 320
		controller_children.append(controller)
		add_child(controller)
