package;

import flixel.FlxSprite;
import flixel.math.FlxMath;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public var isPlayer:Bool = false;

	
	public var noAaChars:Array<String> = [
		'dave-angey'
	];

	public var charPublic:String = 'bf';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		charPublic = char;

		if(char != 'bandu-origin')
		{
			loadGraphic(Paths.image('iconGrid'), true, 150, 150);
	
			addIcon('face', 58);
	
			addIcon('bf', 0);

			addIcon('black', 4);

			addIcon('white', 6);

			addIcon('bf-old', 2);
		
			addIcon('gf', 57, true);
	
			animation.play('face');
		}
		else
		{
			frames = Paths.getSparrowAtlas('bandu_origin_icon');
			animation.addByPrefix(char, char, 24, false, isPlayer, false);
		}

		antialiasing = true;

		animation.play(char);

		if (noAaChars.contains(char))
		{
			antialiasing = false;
		}
		scrollFactor.set();
	}

	function addIcon(char:String, startFrame:Int, singleIcon:Bool = false) {
		animation.add(char, !singleIcon ? [startFrame, startFrame + 1] : [startFrame], 0, false, isPlayer);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
