package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.input.Keyboard;

import Player;
import Timer;

class Project {
	public var player:Player;
	public var timer:Timer;
	
	public function new() {
		timer = new Timer();
		player = new Player();
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		timer.update();
		if (player.up){
			player.y -= Math.round(player.speed * timer.delta);
		} else if (player.down){
			player.y += Math.round(player.speed * timer.delta);
		}
		
		if (player.left){
			player.x -= Math.round(player.speed * timer.delta);
		} else if (player.right){
			player.x += Math.round(player.speed * timer.delta);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}
	
	public function onKeyDown(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: player.up = true;
			case KeyCode.Down: player.down = true;
			case KeyCode.Left: player.left = true;
			case KeyCode.Right: player.right = true;
		default: return;
		}
	}
	
	public function onKeyUp(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: player.up = false;
			case KeyCode.Down: player.down = false;
			case KeyCode.Left: player.left = false;
			case KeyCode.Right: player.right = false;
		default: return;
		}
	}
}
