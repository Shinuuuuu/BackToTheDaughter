extends Node2D

func _on_area_2d_area_entered(area):
	if(area.get_parent().draggableObject):
		area.get_parent().canBeDropped = true
		area.get_parent().dropArea = $"."
		
func _on_area_2d_area_exited(area):
	if(area.get_parent().draggableObject):
		area.get_parent().canBeDropped = false
		area.get_parent().dropArea = null

