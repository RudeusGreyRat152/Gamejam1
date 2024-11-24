extends Control
@onready var ori_button: Button = $Ori_Button
@onready var collapsible_container: CollapsibleContainer = $CollapsibleContainer
@onready var button: Button = $CollapsibleContainer/VBoxContainer/Button
@onready var button_2: Button = $CollapsibleContainer/VBoxContainer/Button2

var ori = 0
var window = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	collapsible_container.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ori_button_pressed() -> void:
	if ori == 0:	
		collapsible_container.open()
		ori = 1
	elif ori == 1:
		collapsible_container.close()
		ori = 0


func _on_button_pressed() -> void:
	window = 1
	ori_button.text = "窗口化"	
	collapsible_container.close()
	# 设置窗口为窗口化模式
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	# 设置窗口为有边框模式
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	# 设置窗口大小为 800x600
	DisplayServer.window_set_size(Vector2i(800, 600))
	# 将窗口居中
	DisplayServer.window_set_position(DisplayServer.window_get_position() + (DisplayServer.screen_get_size() - Vector2i(800, 600)) / 2)
func _on_button_2_pressed() -> void:
	window = 0
	ori_button.text = "无边框窗口"
	collapsible_container.close()
	# 设置窗口为无边框模式
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	# 设置窗口为全屏模式
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
