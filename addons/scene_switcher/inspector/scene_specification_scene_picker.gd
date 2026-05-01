class_name EditorScenePicker
extends EditorResourcePicker

func _ready() -> void:
	base_type = "PackedScene"

func _set_create_options(menu_node: Object) -> void:
	print(menu_node)
	pass
