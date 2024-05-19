class_name PiscisIntroMovementPattern
extends MovementPattern

var tween: Tween

func move():
    tween = boss.create_tween()
    await tween.tween_property(boss, "position", Vector2(200, 200), 2).finished
    animator.play("stage_01")
    on_finished.emit()
    