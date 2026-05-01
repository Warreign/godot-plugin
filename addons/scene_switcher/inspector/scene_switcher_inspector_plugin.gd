extends EditorInspectorPlugin
class_name SceneSwitcherInspectorPlugin

const SCENE_ENTRIES_PROPERTY: String = "scene_specification_entries"

func _can_handle(object: Object) -> bool:
	return is_instance_of(object, SceneSpecification)
	
func _parse_begin(object: Object) -> void:
	pass
	
func _parse_category(object: Object, category: String) -> void:
	pass
	
func _parse_property(object: Object, 
					type: Variant.Type, 
					name: String, 
					hint_type: PropertyHint, 
					hint_string: String, 
					usage_flags: int, 
					wide: bool) -> bool:
	
	if (type == TYPE_DICTIONARY) && (name == SCENE_ENTRIES_PROPERTY):
		var editor: SceneSpecificationEditor = SceneSpecificationEditor.new()
		add_property_editor(SCENE_ENTRIES_PROPERTY, editor, true, "Scenes")
		print(editor.get_parent_control())
		print(EditorInterface.get_inspector().get_child(0).get_child(0).get_children())
		return false
	
	return false
	
func _parse_end(object: Object) -> void:
	pass
