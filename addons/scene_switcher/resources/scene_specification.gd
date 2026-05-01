class_name SceneSpecification
extends Resource

@export_custom(PROPERTY_HINT_DICTIONARY_TYPE, "String;PackedScene") var scene_specification_entries: Dictionary

func add_entry(scene_name: String, scene_resource: PackedScene) -> bool:
	if (scene_specification_entries.get(scene_name)):
		return false
	else:
		scene_specification_entries[scene_name] = scene_resource
		return true


func remove_entry(scene_name: String) -> bool:
	return scene_specification_entries.erase(scene_name)
