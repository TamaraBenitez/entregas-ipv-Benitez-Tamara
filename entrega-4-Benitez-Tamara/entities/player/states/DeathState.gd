extends "res://entities/AbstractState.gd"


# Initialize the state. E.g. change the animation
func enter():
	parent._remove()
	return


func update(delta:float):
	parent._apply_movement()
