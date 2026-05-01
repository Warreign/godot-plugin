extends Control

@export var scene_spec_resource: Resource = preload("res://scene_specification_test.tres")

class LabelData extends Object:
	var text: String

func _ready() -> void:
	#SceneSwitcher.load_scene_specification(scene_spec_resource)
	$TextureRect.get_material()
	pass


func _on_start_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	pass # Replace with function body.


func _test_add_items() -> void:
	var texts: Array[String] = [ "Item1", "Item2", "Item3", "Item4" ]
	var datas: Array[Object]
	for text in texts:
		var data: LabelData = LabelData.new()
		data.text = text
		datas.append(data)
	$ListView.set_items(datas)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test_add_items"):
		_test_add_items()


func _on_list_view_item_hover_changed(item: ListViewEntry, is_hovered: bool) -> void:
	if is_hovered:
		prints(item.get_text(), "hovered")
	pass # Replace with function body.
