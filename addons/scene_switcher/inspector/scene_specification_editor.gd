extends EditorProperty
class_name SceneSpecificationEditor

var property_control_resource: PackedScene = preload("res://addons/scene_switcher/inspector/scene_specification_editor.tscn")
var property_control_instance: Control
var property_text: String = "Hehehe"
var updating: bool = false

var scene_picker: EditorScenePicker

var current_value = 0

func _init() -> void:
	property_control_instance = property_control_resource.instantiate()
	property_control_instance.theme = EditorInterface.get_editor_theme()
	
	scene_picker = EditorScenePicker.new()
	#scene_picker.resource_changed.connect(func (res: Resource): update_size())
	property_control_instance.get_node("EditorMargin").add_child(scene_picker)
	
	#update_size()

	add_child(property_control_instance)
	add_focusable(property_control_instance)


func _update_property() -> void:
	var new_value: Dictionary = get_edited_object()[get_edited_property()]
	if (new_value == {}):
		return
		
	updating = true
	current_value = new_value.size()
	#property_control_instance.text += "  " + String.num_int64(current_value)
	updating = false
	
	print(EditorInterface.get_inspector().get_child(0).get_child(0).get_children())


func update_size() -> void:
	if (is_instance_valid(scene_picker) && is_instance_valid(property_control_instance)):
		property_control_instance.custom_minimum_size.y = scene_picker.get_minimum_size().y
		#var scene_picker_size = scene_picker.size
		#scene_picker_size.y 
		#property_control_instance.set_deferred("size", Vector2(property_control_instance.size.x, scene_picker.size.y))
