extends ListViewEntry

@export
var button: Button
@export
var panel_container: PanelContainer
@export
var animation_player: AnimationPlayer

func _ready() -> void:
	print($PanelContainer.get_theme_stylebox("panel"))


func _set_item_data(data: Object):
	button.set_text(data.text)
	pass


func _on_button_pressed() -> void:
	prints(button.get_text(), "pressed")
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	set_hovered_look(true)


func _on_mouse_exited() -> void:
	set_hovered_look(false)


func set_hovered_look(hovered: bool) -> void:
	assert(panel_container)
	if hovered:
		$AnimationPlayer.play("appear")
	else:
		$AnimationPlayer.play_backwards("appear")

func get_text():
	return button.text
