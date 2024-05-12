class_name FiniteStateMachine
extends Node

@export var current_state: State
var node: Node2D
signal state_name

var states: Array[State]

func _ready():
	setup_parent()
	setup_states()
	set_state_name()

func setup_parent():
	node = get_parent()

func setup_states():
	for child in get_children():
		if child is State:
			child.node = node
			states.append(child)
		else:
			push_warning("Child ", child.name, " is not a State for StateMachine")

func set_state_name():
	state_name.emit(current_state.name)

func _process(delta):
	if current_state.next_state != null:
		switch_states(current_state.next_state)
	current_state.state_process(delta)

func switch_states(new_state: State):
	if current_state != null:
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	
	current_state.on_enter()
	set_state_name()

func can_move():
	return current_state.can_move

func _input(event: InputEvent):
	current_state.state_input(event)
