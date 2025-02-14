package gameObjects;

/**
	The character class initialises any and all characters that exist within gameplay. For now, the character class will
	stay the same as it was in the original source of the game. I'll most likely make some changes afterwards though!
**/
import flixel.FlxG;
import flixel.addons.util.FlxSimplex;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import meta.*;
import meta.data.*;
import meta.data.dependency.FNFSprite;
import meta.state.PlayState;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class Character extends FNFSprite
{
	// By default, this option set to FALSE will make it so that the character only dances twice per major beat hit
	// If set to on, they will dance every beat, such as Skid and Pump
	public var quickDancer:Bool = false;

	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);
		this.isPlayer = isPlayer;

		setCharacter(x, y, character);
	}

	public function setCharacter(x:Float, y:Float, character:String)
	{
		curCharacter = character;
		var tex:FlxAtlasFrames;
		antialiasing = true;
		if(curCharacter == 'bf'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'beta-bf';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'mean-bf';	
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-bf';
			}
		}
		else if(curCharacter == 'bf-pixel'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'beta-bf-pixel';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'mean-bf-pixel';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-bf-pixel';
			}
		}
		else if(curCharacter == 'bf-christmas'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'beta-bf-christmas';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'mean-bf-christmas';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-bf-christmas';
			}
		}
		else if(curCharacter == 'bf-car'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'beta-bf-car';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'mean-bf-car';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-bf-car';
			}
		}
		else if(curCharacter == 'bf-alt'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'beta-bf-alt';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'mean-bf-alt';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-bf-alt';
			}
		}
		else if(curCharacter == 'gf'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'proto-gf';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'smug-gf';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-gf';
			}
		}
		else if(curCharacter == 'gf-car'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'proto-gf-car';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'smug-gf-car';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-gf-car';
			}
		}
		else if(curCharacter == 'gf-christmas'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'proto-gf-christmas';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'smug-gf-christmas';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-gf-christmas';
			}
		}
		else if(curCharacter == 'gf-pixel'){
			if(Init.trueSettings.get('BF Skin') == 'Beta'){
				curCharacter = 'proto-gf-pixel';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Mean'){
				curCharacter = 'smug-gf-pixel';
			}
			else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
				curCharacter = 'chef-gf-pixel';
			}
		}
		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/gf/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
				
				quickDancer = true;

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gf/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gf/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gf/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'gf-tankmen':
				frames = Paths.getSparrowAtlas('characters/gfTankmen');

				animation.addByIndices('sad', 'GF Crying at Gunpoint', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing at Gunpoint', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing at Gunpoint', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				playAnim('danceRight');
			
			case 'proto-gf':
				tex = Paths.getSparrowAtlas('characters/proto-gf/protoGF');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
				
				quickDancer = true;

				playAnim('danceRight');
			case 'proto-gf-pixel':
				tex = Paths.getSparrowAtlas('characters/proto-gf/protoGFPixel');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;
			case 'proto-gf-christmas':
				tex = Paths.getSparrowAtlas('characters/proto-gf/protoGFChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				
				playAnim('danceRight');
			case 'proto-gf-car':
				tex = Paths.getSparrowAtlas('characters/proto-gf/protoGFCar');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');
			case 'smug-gf':
				tex = Paths.getSparrowAtlas('characters/smug-gf/smugGF');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
				
				quickDancer = true;
				
				playAnim('danceRight');
			case 'smug-gf-pixel':
				tex = Paths.getSparrowAtlas('characters/smug-gf/smugGFPixel');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;
			case 'smug-gf-christmas':
				tex = Paths.getSparrowAtlas('characters/smug-gf/smugGFChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				
				playAnim('danceRight');
			case 'smug-gf-car':
				tex = Paths.getSparrowAtlas('characters/smug-gf/smugGFCar');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');
			case 'chef-gf':
				tex = Paths.getSparrowAtlas('characters/chef-gf/chefGF');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				playAnim('danceRight');
				
				quickDancer = true;
			
			case 'chef-gf-car':
				tex = Paths.getSparrowAtlas('characters/chef-gf/chefGFCar');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');
			
			case 'chef-gf-christmas':
				tex = Paths.getSparrowAtlas('characters/chef-gf/chefGFChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				
				playAnim('danceRight');
			case 'chef-gf-pixel':
				tex = Paths.getSparrowAtlas('characters/chef-gf/chefGFpixel');
				frames = tex;
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;
			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/dad/DADDY_DEAREST');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				playAnim('idle');
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByPrefix('yeah', 'spooky kids YEAH!!', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				quickDancer = true;

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/mom/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!

				// maybe youre just dumb for not telling him to name it that
				// dw im also dumb
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/mom/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByIndices('idlePost', 'Mom Idle', [10, 11, 12, 13], "", 24, true);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/monster/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster Right note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster left note', 24, false);
				
				setGraphicSize(Std.int(width * .9));

				playAnim('idle');
			case 'christmas-monster':
				tex = Paths.getSparrowAtlas('characters/monster/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);
				
				setGraphicSize(Std.int(width * .9));

				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/pico/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				playAnim('idle');

				flipX = true;

			case 'bf':
				frames = Paths.getSparrowAtlas('characters/bf/BOYFRIEND');
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);
					
				playAnim('idle');

				flipX = true;
					
			case 'beta-bf':
				frames = Paths.getSparrowAtlas('characters/beta-bf/beta_bf_anims');
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);
					
				playAnim('idle');

				flipX = true;
					
			case 'mean-bf':
				frames = Paths.getSparrowAtlas('characters/mean-bf/mean_bf_anims');
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);

				playAnim('idle');

				flipX = true;
				
			case 'chef-bf':
				frames = Paths.getSparrowAtlas('characters/chef-bf/cheffriend');
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY!!', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking', 24);

				playAnim('idle');

				flipX = true;
				
			/*
				case 'bf-og':
					frames = Paths.getSparrowAtlas('characters/og/BOYFRIEND');

					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
					animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
					animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
					animation.addByPrefix('hey', 'BF HEY', 24, false);
					animation.addByPrefix('scared', 'BF idle shaking', 24);
					animation.addByPrefix('firstDeath', "BF dies", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
					animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

					playAnim('idle');

					flipX = true;
			 */

			case 'bf-dead':
				if(Init.trueSettings.get('BF Skin') == 'Beta'){
					frames = Paths.getSparrowAtlas('characters/beta-bf/beta_bf_dead');
					animation.addByPrefix('firstDeath', "BF dies instance 1", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead Loop instance 1", 24, true);
					animation.addByPrefix('deathConfirm', "BF Dead confirm instance 1", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Mean'){
					frames = Paths.getSparrowAtlas('characters/mean-bf/mean_bf_dead');
					animation.addByPrefix('firstDeath', "BF dies instance 1", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead Loop instance 1", 24, true);
					animation.addByPrefix('deathConfirm', "BF Dead confirm instance 1", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					if(PlayState.SONG.song.toLowerCase() != 'cocoa' && PlayState.SONG.song.toLowerCase() != 'eggnog' && PlayState.SONG.song.toLowerCase() != 'winter-horrorland'){
						frames = Paths.getSparrowAtlas('characters/chef-bf/cheffriend_DEATH');
						animation.addByPrefix('firstDeath', "BF dies", 24, false);
						animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
						animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
					}
					else{
						frames = Paths.getSparrowAtlas('characters/chef-bf/chefbf_XMAS_DEATH');
						animation.addByPrefix('firstDeath', "BF dies", 24, false);
						animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
						animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
					}
				}
				else{
					frames = Paths.getSparrowAtlas('characters/bf/BF_DEATH');
					animation.addByPrefix('firstDeath', "BF dies", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
					animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
				}
				playAnim('firstDeath');

				flipX = true;
			case 'bf-onek-dead':
				frames = Paths.getSparrowAtlas('characters/onek/onekDeath');
				animation.addByPrefix('firstDeath', "onekDeath0", 24, false);
				animation.addByPrefix('deathLoop', "onekDeath wait", 24, true);
				animation.addByPrefix('deathConfirm', "onekDeath confirm", 24, false);
				
				playAnim('firstDeath');
				
				flipX = true;
			case 'bf-holding-gf':
				frames = Paths.getSparrowAtlas('characters/bfAndGF');

				animation.addByPrefix('idle', 'BF idle dance w gf', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				playAnim('idle');

				flipX = true;

			case 'bf-holding-gf-dead':
				frames = Paths.getSparrowAtlas('characters/bfHoldingGF-DEAD');

				animation.addByPrefix('firstDeath', "BF Dies with GF", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead with GF Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY confirm holding gf", 24, false);

				playAnim('firstDeath');

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/bf/bfChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				playAnim('idle');

				flipX = true;
			case 'mean-bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/mean-bf/meanbf_XMAS');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);

				playAnim('idle');

				flipX = true;
			case 'beta-bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/beta-bf/betabf_XMAS');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);

				playAnim('idle');

				flipX = true;
			case 'chef-bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/chef-bf/chefbf_XMAS');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bf/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByIndices('idlePost', 'BF idle dance', [8, 9, 10, 11, 12, 13, 14], "", 24, true);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				playAnim('idle');

				flipX = true;
			case 'beta-bf-car':
		
				var tex = Paths.getSparrowAtlas('characters/beta-bf/betabfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);
				
				playAnim('idle');

				flipX = true;
				
			case 'mean-bf-car':
			
				var tex = Paths.getSparrowAtlas('characters/mean-bf/meanbfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				animation.addByPrefix('hey', 'BF HEY!! instance 1', 24, false);
				animation.addByPrefix('scared', 'BF idle shaking instance 1', 24);
				
				playAnim('idle');

				flipX = true;
				
			case 'chef-bf-car':
			
				var tex = Paths.getSparrowAtlas('characters/chef-bf/chefbf_car');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY!!', 24, false);
				
				playAnim('idle');

				flipX = true;
				
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bf/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'beta-bf-pixel':
				frames = Paths.getSparrowAtlas('characters/beta-bf/betabfPIXEL');
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				
				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'mean-bf-pixel':
				frames = Paths.getSparrowAtlas('characters/mean-bf/meanbfPIXEL');
				animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT instance 1', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT instance 1', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS instance 1', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE LEFT MISS instance 1', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE RIGHT MISS instance 1', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS instance 1', 24, false);
				
				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			
			case 'chef-bf-pixel':
				frames = Paths.getSparrowAtlas('characters/chef-bf/chefbf_pixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);
				
				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			
			case 'bf-pixel-dead':
			
				if(Init.trueSettings.get('BF Skin') == 'Beta'){
					frames = Paths.getSparrowAtlas('characters/beta-bf/betabfPIXEL_DEAD');
				
					animation.addByPrefix('firstDeath', "BF dies instance 1", 24, false);
					animation.addByPrefix('deathLoop', "BF dead loop instance 1", 24, true);
					animation.addByPrefix('deathConfirm', "BF dead confirm instance 1", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Mean'){
					frames = Paths.getSparrowAtlas('characters/mean-bf/meanbfPIXEL_DEAD');
				
					animation.addByPrefix('firstDeath', "BF dies instance 1", 24, false);
					animation.addByPrefix('deathLoop', "BF dead idle instance 1", 24, true);
					animation.addByPrefix('deathConfirm', "BF dead confirm instance 1", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					frames = Paths.getSparrowAtlas('characters/chef-bf/chefbfpixel_DEATH');
				
					animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
					animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
					animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				}
				else{
					frames = Paths.getSparrowAtlas('characters/bf/bfPixelsDEAD');
				
					animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
					animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
					animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				}
				animation.play('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;
				
			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'roses-senpai':
				frames = Paths.getSparrowAtlas('characters/senpai/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/parents-christmas/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				playAnim('idle');
			case 'tankman':
				frames = Paths.getSparrowAtlas('characters/tankmanCaptain');
				animation.addByPrefix('idle', 'Tankman Idle Dance instance', 24, false);

				animation.addByPrefix('singUP', 'Tankman UP note instance', 24, false);
				animation.addByPrefix('singRIGHT', 'Tankman Note Left instance', 24, false);
				animation.addByPrefix('singLEFT', 'Tankman Right Note instance', 24, false);
				animation.addByPrefix('singDOWN', 'Tankman DOWN note instance', 24, false);

				animation.addByPrefix('singUP-alt', 'TANKMAN UGH instance', 24, false);
				animation.addByPrefix('singDOWN-alt', 'PRETTY GOOD tankman instance', 24, false);

				flipX = true;
				playAnim('idle');
			case 'agoti':
				frames = Paths.getSparrowAtlas('characters/agoti/AGOTI');
				//animation.addByIndices('danceLeft', 'Agoti idle', [0, 2, 4, 6, 8], "", 12, false);
				//animation.addByIndices('danceRight', 'Agoti idle', [10, 12, 14, 16, 18], "", 12, false);
				animation.addByIndices('danceLeft', 'Agoti idle', [0, 2, 4, 6, 8], "", 12, false);
				animation.addByIndices('danceRight', 'Agoti idle', [10, 12, 14, 16, 18], "", 12, false);
				animation.addByPrefix('singUP', 'Agoti Up', 24, false);
				animation.addByPrefix('singDOWN', 'Agoti Down', 24, false);
				animation.addByPrefix('singLEFT', 'Agoti Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Agoti Right', 24, false);
				
				quickDancer = true;
				
				playAnim('danceRight');
			case 'ron':
				frames = Paths.getSparrowAtlas('characters/ron/Ron');
				animation.addByPrefix('idle', 'ron idle', 24, false);
				animation.addByPrefix('singUP', 'ron up', 24, false);
				animation.addByPrefix('singDOWN', 'ron down', 24, false);
				animation.addByPrefix('singLEFT', 'ron left', 24, false);
				animation.addByPrefix('singRIGHT', 'ron right', 24, false);
				animation.addByPrefix('bruh', 'ron bruh0', 24, false);
				
				animation.addByPrefix('bruhNOLEAD', 'ron bruh no lead in', 24, false);
				
				playAnim('idle');
			case 'ace':
				frames = Paths.getSparrowAtlas('characters/ace/Ace');
				animation.addByPrefix('idle', 'Ace Idle', 24, false);
				animation.addByPrefix('singUP', 'Ace Up', 24, false);
				animation.addByPrefix('singDOWN', 'Ace Down', 24, false);
				animation.addByPrefix('singLEFT', 'Ace Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Ace Right', 24, false);
				
				playAnim('idle');
			case 'valerie-opera':
				frames = Paths.getSparrowAtlas('characters/valerie/ValerieOpera');
				animation.addByPrefix('idle', 'Valerie Opera IDLE', 24, false);
				animation.addByPrefix('singUP', 'Valerie Opera UP', 24, false);
				animation.addByPrefix('singDOWN', 'Valerie Opera DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Valerie Opera LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Valerie Opera RIGHT', 24, false);
				
				playAnim('idle');
			case 'valerie-popstar':
				frames = Paths.getSparrowAtlas('characters/valerie/ValeriePopstar');
				animation.addByPrefix('idle', 'Valerie Popstar IDLE', 24, false);
				animation.addByPrefix('singUP', 'Valerie Popstar UP', 24, false);
				animation.addByPrefix('singDOWN', 'Valerie Popstar DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Valerie Popstar LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Valerie Popstar RIGHT', 24, false);
				
				playAnim('idle');
			case 'cancer':
				frames = Paths.getSparrowAtlas('characters/cancer/cancer');
				animation.addByPrefix('idle', 'CANCER IDLE', 24, false);
				animation.addByPrefix('singUP', 'CANCER UP', 24, false);
				animation.addByPrefix('singDOWN', 'CANCER DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'CANCER LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'CANCER RIGHT', 24, false);
				animation.addByPrefix('scream', 'CANCER SCREAM', 24, false);
		
				playAnim('idle');
						
			case 'sonic':
				frames = Paths.getSparrowAtlas('characters/sonic/crystal_sonic');
				animation.addByPrefix('idle', "CRYSTAL SONIC IDLE", 24, false);
				animation.addByPrefix('singUP', "CRYSTAL SONIC UP", 24, false);
				animation.addByPrefix('singDOWN', "CRYSTAL SONIC DOWN", 24, false);
				animation.addByPrefix('singLEFT', "CRYSTAL SONIC LEFT", 24, false);
				animation.addByPrefix('singRIGHT', "CRYSTAL SONIC RIGHT", 24, false);

				playAnim('idle');
				
			case 'tricky':	
				frames = Paths.getSparrowAtlas('characters/tricky/tricky');
				animation.addByPrefix('idle', "TRICKY IDLE", 24, false);
				animation.addByPrefix('singUP', "TRICKY UP", 24, false);
				animation.addByPrefix('singDOWN', "TRICKY DOWN", 24, false);
				animation.addByPrefix('singLEFT', "TRICKY LEFT", 24, false);
				animation.addByPrefix('singRIGHT', "TRICKY RIGHT", 24, false);
				
				playAnim('idle');
			
			case 'bf-alt-dead':
				if(Init.trueSettings.get('BF Skin') == 'Beta'){
					frames = Paths.getSparrowAtlas('characters/beta-bf/BETA_CANCER_DEATH');
					animation.addByPrefix('firstDeath', "banned beta", 24, false);
					animation.addByPrefix('deathLoop', "beta banned wait copy", 24, true);
					animation.addByPrefix('deathConfirm', "beta banned wait confirm", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Mean'){
					frames = Paths.getSparrowAtlas('characters/mean-bf/MEAN_CANCER_DEATH');
					animation.addByPrefix('firstDeath', "banned mean", 24, false);
					animation.addByPrefix('deathLoop', "mean banned wait", 24, true);
					animation.addByPrefix('deathConfirm', "mean banned confirm", 24, false);
				}
				else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					frames = Paths.getSparrowAtlas('characters/chef-bf/CHEF_CANCER_DEATH');
					animation.addByPrefix('firstDeath', "banned chef", 24, false);
					animation.addByPrefix('deathLoop', "chef banned wait", 24, true);
					animation.addByPrefix('deathConfirm', "chef banned confirm", 24, false);
				}
				else{
					frames = Paths.getSparrowAtlas('characters/bf/NORMAL_CANCER_DEATH');
					animation.addByPrefix('firstDeath', "banned normal", 24, false);
					animation.addByPrefix('deathLoop', "banned wait", 24, true);
					animation.addByPrefix('deathConfirm', "banned confirm", 24, false);
				}
				playAnim('firstDeath');

				flipX = true;
			case 'bf-alt':
				frames = Paths.getSparrowAtlas('characters/bf/NORMAL_CANCER');
				animation.addByPrefix('idle', 'bf normal IDLE', 24, false);
				animation.addByPrefix('singUP', 'bf normal UP0', 24, false);
				animation.addByPrefix('singDOWN', 'bf normal DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'bf normal LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'bf normal RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'bf normal UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf normal DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf normal LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf normal RIGHT MISS', 24, false);
				
				flipX = true;
				playAnim('idle');
			case 'beta-bf-alt':
				frames = Paths.getSparrowAtlas('characters/beta-bf/BETA_CANCER');
				animation.addByPrefix('idle', 'bf beta IDLE', 24, false);
				animation.addByPrefix('singUP', 'bf beta UP0', 24, false);
				animation.addByPrefix('singDOWN', 'bf beta DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'bf beta LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'bf beta RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'bf beta UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf beta DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf beta LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf beta RIGHT MISS', 24, false);
				
				flipX = true;
				playAnim('idle');
			case 'mean-bf-alt':
				frames = Paths.getSparrowAtlas('characters/mean-bf/MEAN_CANCER');
				animation.addByPrefix('idle', 'bf mean IDLE', 24, false);
				animation.addByPrefix('singUP', 'bf mean UP0', 24, false);
				animation.addByPrefix('singDOWN', 'bf mean DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'bf mean LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'bf mean RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'bf mean UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf mean DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf mean LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf mean RIGHT MISS', 24, false);
				
				flipX = true;
				playAnim('idle');
			case 'chef-bf-alt':
				frames = Paths.getSparrowAtlas('characters/chef-bf/CHEF_CANCER');
				animation.addByPrefix('idle', 'bf chef IDLE', 24, false);
				animation.addByPrefix('singUP', 'bf chef UP0', 24, false);
				animation.addByPrefix('singDOWN', 'bf chef DOWN0', 24, false);
				animation.addByPrefix('singLEFT', 'bf chef LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'bf chef RIGHT0', 24, false);
				animation.addByPrefix('singUPmiss', 'bf chef UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'bf chef DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'bf chef LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'bf beta RIGHT MISS', 24, false);
				
				flipX = true;
				playAnim('idle');
			case 'vtan':
				frames = Paths.getSparrowAtlas('characters/vtan/vTan');
				animation.addByPrefix('idle', 'V IDLE', 24, false);
				animation.addByPrefix('singUP', 'V UP', 24, false);
				animation.addByPrefix('singDOWN', 'V DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'V LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'V RIGHT', 24, false);
				
				playAnim('idle');
			case 'onek':
				frames = Paths.getSparrowAtlas('characters/onek/OnekDate');
				animation.addByPrefix('idle', 'Onek Nervous IDLE', 24, false);
				animation.addByPrefix('singUP', 'Onek Nervous UP', 24, false);
				animation.addByPrefix('singDOWN', 'Onek Nervous DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Onek Nervous LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Onek Nervous RIGHT', 24, false);
				animation.addByPrefix('singUPmiss', 'Onek UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Onek DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Onek LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Onek RIGHT MISS', 24, false);
				
				flipX = true;
				
				playAnim('idle');
				
			case 'onek-happy':
				frames = Paths.getSparrowAtlas('characters/onek/OnekDate');
				animation.addByPrefix('idle', 'Onek Happy IDLE', 24, false);
				animation.addByPrefix('singUP', 'Onek Happy UP', 24, false);
				animation.addByPrefix('singDOWN', 'Onek Happy DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Onek Happy LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Onek Happy RIGHT', 24, false);
				animation.addByPrefix('singUPmiss', 'Onek UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Onek DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Onek LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Onek RIGHT MISS', 24, false);
				
				flipX = true;
				
				playAnim('idle');
				
			case 'onek-inverted':
				frames = Paths.getSparrowAtlas('characters/onek/OnekDate_Inverted');
				animation.addByPrefix('idle', 'Onek Nervous IDLE', 24, false);
				animation.addByPrefix('singUP', 'Onek Nervous UP', 24, false);
				animation.addByPrefix('singDOWN', 'Onek Nervous DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Onek Nervous LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Onek Nervous RIGHT', 24, false);
				animation.addByPrefix('singUPmiss', 'Onek UP MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Onek DOWN MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Onek LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Onek RIGHT MISS', 24, false);
				
				flipX = true;
				
				playAnim('idle');
			case 'maggie':
				frames = Paths.getSparrowAtlas('characters/maggie/MaggieDate');
				animation.addByPrefix('idle', 'Maggie IDLE', 24, false);
				animation.addByPrefix('singUP', 'Maggie UP', 24, false);
				animation.addByPrefix('singDOWN', 'Maggie DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Maggie LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Maggie RIGHT', 24, false);
				
				playAnim('idle');
			case 'maggie-inverted':
				frames = Paths.getSparrowAtlas('characters/maggie/MaggieDate_Inverted');
				animation.addByPrefix('idle', 'Maggie IDLE', 24, false);
				animation.addByPrefix('singUP', 'Maggie UP', 24, false);
				animation.addByPrefix('singDOWN', 'Maggie DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Maggie LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Maggie RIGHT', 24, false);
				
				playAnim('idle');
			case 'pico-speaker':
				frames = Paths.getSparrowAtlas('characters/picoSpeaker');

				animation.addByPrefix('shoot1', 'Pico shoot 1', 24, false);
				animation.addByPrefix('shoot2', 'Pico shoot 2', 24, false);
				animation.addByPrefix('shoot3', 'Pico shoot 3', 24, false);
				animation.addByPrefix('shoot4', 'Pico shoot 4', 24, false);

				playAnim('shoot1');
			default:
				// set up animations if they aren't already

				// fyi if you're reading this this isn't meant to be well made, it's kind of an afterthought I wanted to mess with and
				// I'm probably not gonna clean it up and make it an actual feature of the engine I just wanted to play other people's mods but not add their files to
				// the engine because that'd be stealing assets
				var fileNew = curCharacter + 'Anims';
				if (OpenFlAssets.exists(Paths.offsetTxt(fileNew)))
				{
					var characterAnims:Array<String> = CoolUtil.coolTextFile(Paths.offsetTxt(fileNew));
					var characterName:String = characterAnims[0].trim();
					frames = Paths.getSparrowAtlas('characters/$characterName');
					for (i in 1...characterAnims.length)
					{
						var getterArray:Array<Array<String>> = CoolUtil.getAnimsFromTxt(Paths.offsetTxt(fileNew));
						animation.addByPrefix(getterArray[i][0], getterArray[i][1].trim(), 24, false);
					}
				}
				else
				{
					// DAD ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST');
					frames = tex;
					animation.addByPrefix('idle', 'Dad idle dance', 30, false);
					animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
					animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
					animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

					playAnim('idle');
				}
		}

		// set up offsets cus why not
		if (OpenFlAssets.exists(Paths.offsetTxt('offsets/' + curCharacter + 'Offsets')))
		{
			var characterOffsets:Array<String> = CoolUtil.coolTextFile(Paths.offsetTxt('offsets/' + curCharacter + 'Offsets'));
			for (i in 0...characterOffsets.length)
			{
				var getterArray:Array<Array<String>> = CoolUtil.getOffsetsFromTxt(Paths.offsetTxt('offsets/' + curCharacter + 'Offsets'));
				addOffset(getterArray[i][0], Std.parseInt(getterArray[i][1]), Std.parseInt(getterArray[i][2]));
			}
		}

		dance();

		if (isPlayer) // fuck you ninjamuffin lmao
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf') && !curCharacter.startsWith('onek') && !curCharacter.startsWith('mean-bf-alt') && !curCharacter.startsWith('beta-bf-alt') && !curCharacter.startsWith('chef-bf-alt'))
				flipLeftRight();
			//
		}
		else if (curCharacter.startsWith('bf'))
			flipLeftRight();

		this.x = x;
		this.y = y;
	}

	function flipLeftRight():Void
	{
		// get the old right sprite
		var oldRight = animation.getByName('singRIGHT').frames;

		// set the right to the left
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;

		// set the left to the old right
		animation.getByName('singLEFT').frames = oldRight;

		// insert ninjamuffin screaming I think idk I'm lazy as hell

		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		var curCharSimplified:String = simplifyCharacter();
		switch (curCharSimplified)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
				if ((animation.curAnim.name.startsWith('sad')) && (animation.curAnim.finished))
					playAnim('danceLeft');
		}

		// Post idle animation (think Week 4 and how the player and mom's hair continues to sway after their idle animations are done!)
		if (animation.curAnim.finished && animation.curAnim.name == 'idle')
		{
			// We look for an animation called 'idlePost' to switch to
			if (animation.getByName('idlePost') != null)
				// (( WE DON'T USE 'PLAYANIM' BECAUSE WE WANT TO FEED OFF OF THE IDLE OFFSETS! ))
				animation.play('idlePost', true, false, 0);
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance(?forced:Bool = false)
	{
		if (!debugMode)
		{
			var curCharSimplified:String = simplifyCharacter();
			switch (curCharSimplified)
			{
				case 'gf':
					if ((!animation.curAnim.name.startsWith('hair')) && (!animation.curAnim.name.startsWith('sad')))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight', forced);
						else
							playAnim('danceLeft', forced);
					}
				default:
					// Left/right dancing, think Skid & Pump
					if (animation.getByName('danceLeft') != null && animation.getByName('danceRight') != null)
						playAnim((animation.curAnim.name == 'danceRight') ? 'danceLeft' : 'danceRight', forced);
					// Play normal idle animations for all other characters
					else
						playAnim('idle', forced);
			}
		}
	}

	override public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		super.playAnim(AnimName, Force, Reversed, Frame);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
				danced = true;
			else if (AnimName == 'singRIGHT')
				danced = false;

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
				danced = !danced;
		}
	}

	public function simplifyCharacter():String
	{
		var base = curCharacter;

		if (base.startsWith('gf') || base.startsWith('proto') || base.startsWith('smug') || base == 'chef-gf')
			base = 'gf';
		return base;
	}
}
