extends Node2D

var draggableObject = true
var selected = false
@export var drag = true

@export var smoothValue = 25
var canBeSelected = true
var canBeDropped = false

var dropArea = null

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && canBeSelected:
		if(drag):
			selected = true
		else:
			selected = !selected

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), smoothValue * delta)

func _input(event):
	if event is InputEventMouseButton && canBeSelected:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			if(drag):
				selected = false
			if(canBeDropped):
				dropIntoDropArea()
		
			
func dropIntoDropArea():
	if(dropArea != null):
		$".".position = dropArea.position
		canBeSelected = false
		canBeDropped = false
		draggableObject = false
		print("Draggable Object Dropped...")

