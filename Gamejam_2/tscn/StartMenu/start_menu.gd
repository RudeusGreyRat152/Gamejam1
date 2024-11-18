extends Node2D
@onready var black: Sprite2D = $CanvasLayer/Black
@onready var menu_1: Control = $CanvasLayer/Menu1
@onready var setting_panel: Panel = $CanvasLayer/SettingPanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	black.modulate = Color(1, 1, 1, 0)
	setting_panel.visible = false
	black.visible = true

func _on_quit_pressed() -> void:
	for alpha in range(0, 101):
		black.modulate = Color(1, 1, 1, alpha / 100.0)
		menu_1.modulate = Color(1, 1, 1, 1.0 - alpha / 100.0)
		await get_tree().create_timer(0.01).timeout
	get_tree().quit()


func _on_start_pressed() -> void:
	for alpha in range(0, 101):
		black.modulate = Color(1, 1, 1, alpha / 100.0)
		menu_1.modulate = Color(1, 1, 1, 1.0 - alpha / 100.0)
		await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://tscn/Main/main.tscn")
	

func _on_settings_pressed() -> void:
	setting_panel.visible = true
