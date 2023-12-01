extends Node2D

var player_scr = 0
var opponent_scr = 0

@onready var ball = $pong_ball
@onready var plyr_pdl = $player_paddle
@onready var enmy_pdl = $opponent_paddle

@onready var player_scr_lbl = $table_ui/player_score
@onready var enemy_scr_lbl = $table_ui/opponent_score

@onready var cnt_dwn_timer = $countdown_timer
@onready var timer_text = $table_ui/countdown

func _process(delta):
	timer_text.text = str(int(cnt_dwn_timer.time_left + 1))

func _on_out_bounds_right_body_entered(body):
	resetTable()
	player_scr += 1
	updateTable()

func _on_out_bounds_left_body_entered(body):
	resetTable()
	opponent_scr += 1
	updateTable()
	

func _on_countdown_timer_timeout():
	get_tree().call_group("ball_group", "restart_ball")
	timer_text.visible = false


func updateTable():
	timer_text.visible = true
	player_scr_lbl.text = str(player_scr)
	enemy_scr_lbl.text = str(opponent_scr)
	get_tree().call_group("ball_group", "stop_ball")
	cnt_dwn_timer.start()

func resetTable():
	ball.position = Vector2(640, 360)
	plyr_pdl.position.x = 265
	enmy_pdl.position.x = 1280 - 265
	
