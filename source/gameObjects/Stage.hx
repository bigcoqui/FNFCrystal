package gameObjects;

import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import gameObjects.background.*;
import meta.CoolUtil;
import meta.data.Conductor;
import meta.data.dependency.FNFSprite;
import meta.state.PlayState;

using StringTools;

/**
	This is the stage class. It sets up everything you need for stages in a more organised and clean manner than the
	base game. It's not too bad, just very crowded. I'll be adding stages as a separate
	thing to the weeks, making them not hardcoded to the songs.
**/
class Stage extends FlxTypedGroup<FlxBasic>
{
	var halloweenBG:FNFSprite;
	var phillyCityLights:FlxTypedGroup<FNFSprite>;
	var phillyTrain:FNFSprite;
	var trainSound:FlxSound;

	public var limo:FNFSprite;

	public var grpLimoDancers:FlxTypedGroup<BackgroundDancer>;

	var fastCar:FNFSprite;

	var upperBoppers:FNFSprite;
	var bottomBoppers:FNFSprite;
	var santa:FNFSprite;

	var ringbg:FNFSprite;
	var bgGirls:BackgroundGirls;
	var valerieTransform:FNFSprite;
	var cancerScream:FNFSprite;
	var onekSnapBack:FNFSprite;
	var resturantbg:FNFSprite;
	var resturantbg_inv:FNFSprite;
	var table:FNFSprite;
	var table_inv:FNFSprite;

	public var curStage:String;

	var daPixelZoom = PlayState.daPixelZoom;

	public var foreground:FlxTypedGroup<FlxBasic>;

	public function new(curStage)
	{
		super();
		this.curStage = curStage;

		/// get hardcoded stage type if chart is fnf style
		if (PlayState.determinedChartType == "FNF")
		{
			// this is because I want to avoid editing the fnf chart type
			// custom stage stuffs will come with forever charts
			switch (CoolUtil.spaceToDash(PlayState.SONG.song.toLowerCase()))
			{
				case 'spookeez' | 'south' | 'monster':
					curStage = 'spooky';
				case 'pico' | 'blammed' | 'philly-nice':
					curStage = 'philly';
				case 'milf' | 'satin-panties' | 'high':
					curStage = 'highway';
				case 'cocoa' | 'eggnog':
					curStage = 'mall';
				case 'winter-horrorland':
					curStage = 'mallEvil';
				case 'senpai' | 'roses':
					curStage = 'school';
				case 'thorns':
					curStage = 'schoolEvil';
				case 'ebin' | 'kamexmas' | 'voidslave' | 'check-up' | 'bivalve' | 'old-voidslave' | 'sonicool' | 'maddening':
					curStage = 'ring';
				case 'thump-thump':
					curStage = 'resturant';
				case 'rekt':
					curStage = 'alt-ring';
				default:
					curStage = 'stage';
			}

			PlayState.curStage = curStage;
		}

		// to apply to foreground use foreground.add(); instead of add();
		foreground = new FlxTypedGroup<FlxBasic>();

		//
		switch (curStage)
		{
			case 'spooky':
				PlayState.defaultCamZoom = 0.90;
				curStage = 'spooky';
				// halloweenLevel = true;

				var hallowTex = Paths.getSparrowAtlas('backgrounds/' + curStage + '/halloweenie_bg');

				halloweenBG = new FNFSprite(-800, -550);
				halloweenBG.frames = hallowTex;
				halloweenBG.setGraphicSize(Std.int(halloweenBG.width * 0.75));
				halloweenBG.animation.addByPrefix('idle', 'halloweenie bg', 24, true);
				halloweenBG.animation.play('idle');
				halloweenBG.antialiasing = true;
				add(halloweenBG);
				
				var front_table:FNFSprite = new FNFSprite(600, 600).loadGraphic(Paths.image('backgrounds/' + curStage + '/front_obstructor'));
				front_table.setGraphicSize(Std.int(front_table.width * 0.75));
				foreground.add(front_table);

			// isHalloween = true;
			case 'philly':
				PlayState.defaultCamZoom = 0.80;
				curStage = 'philly';
				var bg:FNFSprite = new FNFSprite(-200, -250).loadGraphic(Paths.image('backgrounds/' + curStage + '/sky'));
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);

				var grass:FNFSprite = new FNFSprite(-500, 400).loadGraphic(Paths.image('backgrounds/' + curStage + '/grass'));
				add(grass);
				
				var hallowTex = Paths.getSparrowAtlas('backgrounds/philly/back_trailers');
				var phillyTrailerLight:FNFSprite = new FNFSprite(-180, 75);
				phillyTrailerLight.frames = hallowTex;
				phillyTrailerLight.scrollFactor.set(0.3, 0.3);
				phillyTrailerLight.setGraphicSize(Std.int(phillyTrailerLight.width * 0.75));
				phillyTrailerLight.animation.addByPrefix('idle', 'back trailers instance 10000', 24, true);
				phillyTrailerLight.animation.play('idle');
				phillyTrailerLight.updateHitbox();
				phillyTrailerLight.antialiasing = true;
				add(phillyTrailerLight);
				
				phillyCityLights = new FlxTypedGroup<FNFSprite>();
				add(phillyCityLights);
				
				for (i in 0...4)
				{
					var hallowTex = Paths.getSparrowAtlas('backgrounds/philly/back_trailers');
					var light:FNFSprite = new FNFSprite(-180, 75);
					light.frames = hallowTex;
					light.scrollFactor.set(0.3, 0.3);
					light.visible = false;
					light.setGraphicSize(Std.int(light.width * 0.75));
					light.animation.addByPrefix('idle', 'back trailers instance 1000' + i, 24, true);
					light.animation.play('idle');
					light.updateHitbox();
					light.antialiasing = true;
					phillyCityLights.add(light);
				}
				
				var trailer:FNFSprite = new FNFSprite(-150, -100).loadGraphic(Paths.image('backgrounds/' + curStage + '/lighting_RV'));
				add(trailer);
				
				var foregroundTrailer:FNFSprite = new FNFSprite(-750, 100).loadGraphic(Paths.image('backgrounds/' + curStage + '/trailer_foreground'));
				foregroundTrailer.setGraphicSize(Std.int(foregroundTrailer.width * 0.70));
				foreground.add(foregroundTrailer);
				
			case 'highway':
				curStage = 'highway';
				PlayState.defaultCamZoom = 0.90;

				var skyBG:FNFSprite = new FNFSprite(-120, -50).loadGraphic(Paths.image('backgrounds/' + curStage + '/limoSunset'));
				skyBG.scrollFactor.set(0.1, 0.1);
				add(skyBG);

				var bgLimo:FNFSprite = new FNFSprite(-200, 480);
				bgLimo.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/bgLimo');
				bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
				bgLimo.animation.play('drive');
				bgLimo.scrollFactor.set(0.4, 0.4);
				add(bgLimo);

				grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
				add(grpLimoDancers);

				for (i in 0...5)
				{
					var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
					dancer.scrollFactor.set(0.4, 0.4);
					grpLimoDancers.add(dancer);
				}

				var overlayShit:FNFSprite = new FNFSprite(-500, -600).loadGraphic(Paths.image('backgrounds/' + curStage + '/limoOverlay'));
				overlayShit.alpha = 0.5;
				// add(overlayShit);

				// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

				// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

				// overlayShit.shader = shaderBullshit;

				var limoTex = Paths.getSparrowAtlas('backgrounds/' + curStage + '/limoDrive');

				limo = new FNFSprite(-120, 550);
				limo.frames = limoTex;
				limo.animation.addByPrefix('drive', "Limo stage", 24);
				limo.animation.play('drive');
				limo.antialiasing = true;

				fastCar = new FNFSprite(-300, 160).loadGraphic(Paths.image('backgrounds/' + curStage + '/fastCarLol'));
			// loadArray.add(limo);
			case 'mall':
				curStage = 'mall';
				PlayState.defaultCamZoom = 0.80;

				var bg:FNFSprite = new FNFSprite(-1000, -500).loadGraphic(Paths.image('backgrounds/' + curStage + '/bgWalls'));
				bg.antialiasing = true;
				bg.scrollFactor.set(0.2, 0.2);
				bg.active = false;
				bg.setGraphicSize(Std.int(bg.width * 0.8));
				bg.updateHitbox();
				add(bg);

				upperBoppers = new FNFSprite(-315, -135);
				switch(Init.trueSettings.get('BF Skin')){
					case 'Beta'|'Mean'|'Cheffriend':
						upperBoppers.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/upperBoppers');
						upperBoppers.y += 25;
					default:
						upperBoppers.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/upperBop');
				}
				
				upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
				upperBoppers.antialiasing = true;
				upperBoppers.scrollFactor.set(0.33, 0.33);
				upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 0.85));
				upperBoppers.updateHitbox();
				add(upperBoppers);

				var bgEscalator:FNFSprite = new FNFSprite(-1100, -600).loadGraphic(Paths.image('backgrounds/' + curStage + '/bgEscalator'));
				bgEscalator.antialiasing = true;
				bgEscalator.scrollFactor.set(0.3, 0.3);
				bgEscalator.active = false;
				bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 0.9));
				bgEscalator.updateHitbox();
				add(bgEscalator);

				var tree:FNFSprite = new FNFSprite(370, -250).loadGraphic(Paths.image('backgrounds/' + curStage + '/christmasTree'));
				tree.antialiasing = true;
				tree.scrollFactor.set(0.40, 0.40);
				add(tree);
				
				var stool = new FNFSprite(635, 550).loadGraphic(Paths.image('backgrounds/' + curStage + '/stool'));
				stool.antialiasing = true;
				stool.scrollFactor.set(0.9, 0.9);
				stool.updateHitbox();
				add(stool);

				bottomBoppers = new FNFSprite(-300, 140);
				switch(Init.trueSettings.get('BF Skin')){
					case 'Beta'|'Mean'|'Cheffriend':
						bottomBoppers.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/bottomboppers');
					default:
						bottomBoppers.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/bottomBop');
				}
				bottomBoppers.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
				bottomBoppers.antialiasing = true;
				bottomBoppers.scrollFactor.set(0.9, 0.9);
				bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
				bottomBoppers.updateHitbox();
				add(bottomBoppers);

				var fgSnow:FNFSprite = new FNFSprite(-600, 700).loadGraphic(Paths.image('backgrounds/' + curStage + '/fgSnow'));
				fgSnow.active = false;
				fgSnow.antialiasing = true;
				add(fgSnow);

				santa = new FNFSprite(-840, 150);
				santa.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/santa');
				santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
				santa.antialiasing = true;
				add(santa);
			case 'mallEvil':
				curStage = 'mallEvil';
				var bg:FNFSprite = new FNFSprite(-400, -500).loadGraphic(Paths.image('backgrounds/mall/evilBG'));
				bg.antialiasing = true;
				bg.scrollFactor.set(0.2, 0.2);
				bg.active = false;
				bg.setGraphicSize(Std.int(bg.width * 0.8));
				bg.updateHitbox();
				add(bg);

				var evilTree:FNFSprite = new FNFSprite(300, -300).loadGraphic(Paths.image('backgrounds/mall/evilTree'));
				evilTree.antialiasing = true;
				evilTree.scrollFactor.set(0.2, 0.2);
				add(evilTree);

				var evilSnow:FNFSprite = new FNFSprite(-200, 700).loadGraphic(Paths.image("backgrounds/mall/evilSnow"));
				evilSnow.antialiasing = true;
				add(evilSnow);
			case 'school':
				curStage = 'school';

				// defaultCamZoom = 0.9;

				var bgSky = new FNFSprite().loadGraphic(Paths.image('backgrounds/' + curStage + '/weebSky'));
				bgSky.scrollFactor.set(0.1, 0.1);
				add(bgSky);

				var repositionShit = -200;

				var bgSchool:FNFSprite = new FNFSprite(repositionShit, 0).loadGraphic(Paths.image('backgrounds/' + curStage + '/weebSchool'));
				bgSchool.scrollFactor.set(0.6, 0.90);
				add(bgSchool);

				var bgStreet:FNFSprite = new FNFSprite(repositionShit).loadGraphic(Paths.image('backgrounds/' + curStage + '/weebStreet'));
				bgStreet.scrollFactor.set(0.95, 0.95);
				add(bgStreet);

				var fgTrees:FNFSprite = new FNFSprite(repositionShit + 170, 130).loadGraphic(Paths.image('backgrounds/' + curStage + '/weebTreesBack'));
				fgTrees.scrollFactor.set(0.9, 0.9);
				add(fgTrees);

				var bgTrees:FNFSprite = new FNFSprite(repositionShit - 380, -800);
				var treetex = Paths.getPackerAtlas('backgrounds/' + curStage + '/weebTrees');
				bgTrees.frames = treetex;
				bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
				bgTrees.animation.play('treeLoop');
				bgTrees.scrollFactor.set(0.85, 0.85);
				add(bgTrees);

				var treeLeaves:FNFSprite = new FNFSprite(repositionShit, -40);
				treeLeaves.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/petals');
				treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
				treeLeaves.animation.play('leaves');
				treeLeaves.scrollFactor.set(0.85, 0.85);
				add(treeLeaves);

				var widShit = Std.int(bgSky.width * 6);

				bgSky.setGraphicSize(widShit);
				bgSchool.setGraphicSize(widShit);
				bgStreet.setGraphicSize(widShit);
				bgTrees.setGraphicSize(Std.int(widShit * 1.4));
				fgTrees.setGraphicSize(Std.int(widShit * 0.8));
				treeLeaves.setGraphicSize(widShit);

				fgTrees.updateHitbox();
				bgSky.updateHitbox();
				bgSchool.updateHitbox();
				bgStreet.updateHitbox();
				bgTrees.updateHitbox();
				treeLeaves.updateHitbox();

				bgGirls = new BackgroundGirls(-100, 190);
				bgGirls.scrollFactor.set(0.9, 0.9);

				if (PlayState.SONG.song.toLowerCase() == 'roses')
					bgGirls.getScared();

				bgGirls.setGraphicSize(Std.int(bgGirls.width * daPixelZoom));
				bgGirls.updateHitbox();
				add(bgGirls);
			case 'schoolEvil':
				var posX = 400;
				var posY = 200;
				var bg:FNFSprite = new FNFSprite(posX, posY);
				bg.frames = Paths.getSparrowAtlas('backgrounds/' + curStage + '/animatedEvilSchool');
				bg.animation.addByPrefix('idle', 'background 2', 24);
				bg.animation.play('idle');
				bg.scrollFactor.set(0.8, 0.9);
				bg.scale.set(6, 6);
				add(bg);
				
			case 'ring':
				curStage = 'ring';
				PlayState.defaultCamZoom = .6;
				var hallowTex = Paths.getSparrowAtlas('backgrounds/ring/the_ring');
				ringbg = new FNFSprite(-625, -300);
				ringbg.frames = hallowTex;
				switch(PlayState.SONG.song.toLowerCase())
				{
					case 'ebin':
						ringbg.animation.addByPrefix('idle', 'full ring0000', 24, false);
						ringbg.animation.play('idle');
					case 'kamexmas':
						ringbg.animation.addByPrefix('idle', 'full ring0004', 24, false);
						ringbg.animation.play('idle');
					case 'voidslave' | 'old-voidslave':
						ringbg.animation.addByPrefix('idle', 'full ring0002', 24, false);
						ringbg.animation.play('idle');
					case 'check-up':
						ringbg.animation.addByPrefix('purple', 'full ring0005', 24, false);
						ringbg.animation.addByPrefix('green', 'full ring0000', 24, false);
						ringbg.animation.play('purple');
					case 'bivalve':
						ringbg.animation.addByPrefix('idle', 'full ring0001', 24, false);
						ringbg.animation.play('idle');
						valerieTransform = new FNFSprite(-125, -70);
						valerieTransform.antialiasing = true;
						valerieTransform.frames = Paths.getSparrowAtlas('characters/valerie/ValerieTransform');
						valerieTransform.animation.addByPrefix('transform', 'Valerie Transform', 24, false);
					case 'sonicool':
						ringbg.animation.addByPrefix('idle', 'full ring0001', 24, false);
						ringbg.animation.play('idle');
					case 'maddening':
						ringbg.animation.addByPrefix('idle', 'full ring0002', 24, false);
						ringbg.animation.play('idle');
					default:
						ringbg.animation.addByPrefix('idle', 'full ring0005', 24, false);
						ringbg.animation.play('idle');
				}
				ringbg.antialiasing = true;
				ringbg.scrollFactor.set(1, 1);
				ringbg.active = false;
				
				// add to the final array
				add(ringbg);
			
			case 'alt-ring':
				curStage = 'alt-ring';
				PlayState.defaultCamZoom = .6;
				var bg:FNFSprite = new FNFSprite(-100, -400).loadGraphic(Paths.image('backgrounds/alt-ring/alt_ring'));
				bg.antialiasing = true;
				bg.scrollFactor.set(1,1);
				add(bg);
				cancerScream = new FNFSprite(-525, -325);
				cancerScream.antialiasing = true;
				cancerScream.frames = Paths.getSparrowAtlas('characters/cancer/CancerCrystalSCREAM');
				cancerScream.animation.addByPrefix('scream', 'CANCER SCREAM', 24, false);
			case 'resturant':
				curStage = 'resturant';
				PlayState.defaultCamZoom = .8;
				resturantbg = new FNFSprite(-600, -300);
				resturantbg.frames = Paths.getSparrowAtlas('backgrounds/resturant/resturant');
				resturantbg.animation.addByPrefix('anim', 'resty', 24, true);
				resturantbg.animation.play('anim');
				resturantbg_inv = new FNFSprite(-600, -300);
				resturantbg_inv.frames = Paths.getSparrowAtlas('backgrounds/resturant/resturantInverted');
				resturantbg_inv.animation.addByPrefix('anim', 'resty', 24, true);
				resturantbg_inv.animation.play('anim');
				resturantbg_inv.alpha = 0;
				table = new FNFSprite(250, 900).loadGraphic(Paths.image('backgrounds/resturant/table'));
				table_inv = new FNFSprite(250, 900).loadGraphic(Paths.image('backgrounds/resturant/table_inverted'));
				table_inv.alpha = 0;
				onekSnapBack = new FNFSprite(880, 520);
				onekSnapBack.frames = Paths.getSparrowAtlas('characters/onek/Onek_SnapBack');
				onekSnapBack.antialiasing = true;
				onekSnapBack.animation.addByPrefix('snapbacktoreality', 'Onek SNAP BACK', 24, false);
				onekSnapBack.alpha = 0;
				resturantbg.antialiasing = true;
				resturantbg_inv.antialiasing = true;
				table.antialiasing = true;
				table_inv.antialiasing = true;
				add(resturantbg);
				add(resturantbg_inv);
				foreground.add(onekSnapBack);
				foreground.add(table);
				foreground.add(table_inv);
			default:
				PlayState.defaultCamZoom = 0.9;
				curStage = 'stage';
				var bg:FNFSprite = new FNFSprite(-600, -250).loadGraphic(Paths.image('backgrounds/crystalstage/brick_wall'));
				bg.antialiasing = true;
				bg.scrollFactor.set(0.9, 0.9);
				bg.active = false;

				// add to the final array
				add(bg);
				
				if(PlayState.SONG.song.toLowerCase() == 'test' || PlayState.SONG.song.toLowerCase() == 'tutorial'){
					var stageCurtains:FNFSprite = new FNFSprite(-740, -350).loadGraphic(Paths.image('backgrounds/crystalstage/blue_curtains'));
					stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 1.5));
					stageCurtains.updateHitbox();
					stageCurtains.antialiasing = true;
					stageCurtains.scrollFactor.set(1.3, 1.3);
					stageCurtains.active = false;

					// add to the final array
					add(stageCurtains);
				}
				else{
					var stageCurtains:FNFSprite = new FNFSprite(-580, -350).loadGraphic(Paths.image('backgrounds/crystalstage/curtains'));
					stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 1.3));
					stageCurtains.updateHitbox();
					stageCurtains.antialiasing = true;
					stageCurtains.scrollFactor.set(1, 1);
					stageCurtains.active = false;

					// add to the final array
					add(stageCurtains);
				}
				
				if(PlayState.SONG.song.toLowerCase() == 'test' || PlayState.SONG.song.toLowerCase() == 'tutorial'){
					var stageFront:FNFSprite = new FNFSprite(-650, 600).loadGraphic(Paths.image('backgrounds/stage/stagefront'));
					stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
					stageFront.updateHitbox();
					stageFront.antialiasing = true;
					stageFront.scrollFactor.set(0.9, 0.9);
					stageFront.active = false;
					// add to the final array
					add(stageFront);
				}
				
				else{
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_front');
					var stageFront:FNFSprite = new FNFSprite(-650, 650);
					stageFront.frames = hallowTex;
					switch(PlayState.SONG.song.toLowerCase())
					{
						case 'fresh':
							stageFront.animation.addByPrefix('idle', 'stage0001', 24, false);
							stageFront.animation.play('idle');
						case 'dadbattle':
							stageFront.animation.addByPrefix('idle', 'stage0002', 24, false);
							stageFront.animation.play('idle');
						default:
							stageFront.animation.addByPrefix('idle', 'stage0000', 24, false);
							stageFront.animation.play('idle');
					}
					stageFront.antialiasing = true;
					stageFront.scrollFactor.set(0.9, 0.9);
					stageFront.active = false;
				
					// add to the final array
					add(stageFront);
				}
				
				
				if(PlayState.SONG.song.toLowerCase() == 'bopeebo' || PlayState.SONG.song.toLowerCase() == 'fresh' || PlayState.SONG.song.toLowerCase() == 'dadbattle'){
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_farLeft:FNFSprite = new FNFSprite(-250, 150);
					stageFlame_farLeft.frames = hallowTex;
					stageFlame_farLeft.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_farLeft.animation.play('fire');
					foreground.add(stageFlame_farLeft);
					
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_farRight:FNFSprite = new FNFSprite(1250, 150);
					stageFlame_farRight.frames = hallowTex;
					stageFlame_farRight.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_farRight.animation.play('fire');
					foreground.add(stageFlame_farRight);
				}
				
				if(PlayState.SONG.song.toLowerCase() == 'fresh' || PlayState.SONG.song.toLowerCase() == 'dadbattle'){	
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_midLeft:FNFSprite = new FNFSprite(-150, 185);
					stageFlame_midLeft.frames = hallowTex;
					stageFlame_midLeft.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_midLeft.animation.play('fire');
					foreground.add(stageFlame_midLeft);
					
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_midRight:FNFSprite = new FNFSprite(1150, 185);
					stageFlame_midRight.frames = hallowTex;
					stageFlame_midRight.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_midRight.animation.play('fire');
					foreground.add(stageFlame_midRight);
				}
				
				if(PlayState.SONG.song.toLowerCase() == 'dadbattle'){
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_centerLeft:FNFSprite = new FNFSprite(-50, 210);
					stageFlame_centerLeft.frames = hallowTex;
					stageFlame_centerLeft.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_centerLeft.animation.play('fire');
					foreground.add(stageFlame_centerLeft);
					
					var hallowTex = Paths.getSparrowAtlas('backgrounds/crystalstage/crystal_stage_fire');
					var stageFlame_centerRight:FNFSprite = new FNFSprite(1050, 210);
					stageFlame_centerRight.frames = hallowTex;
					stageFlame_centerRight.animation.addByPrefix('fire', 'full flame', 24, true);
					stageFlame_centerRight.animation.play('fire');
					foreground.add(stageFlame_centerRight);
					
					var leftSpotLight:FNFSprite = new FNFSprite(0, -350).loadGraphic(Paths.image('backgrounds/crystalstage/light'));
					leftSpotLight.antialiasing = true;
					leftSpotLight.scrollFactor.set(1, 1);
					leftSpotLight.active = false;
					
					var rightSpotLight:FNFSprite = new FNFSprite(1000, -350).loadGraphic(Paths.image('backgrounds/crystalstage/light'));
					rightSpotLight.antialiasing = true;
					rightSpotLight.scrollFactor.set(1, 1);
					rightSpotLight.active = false;
					rightSpotLight.flipX = true;

					// add to the final array
					add(leftSpotLight);

					// add to the final array
					add(rightSpotLight);
					
				}
		}
	}

	// return the girlfriend's type
	public function returnGFtype(curStage)
	{
		var gfVersion:String = 'gf';

		switch (curStage)
		{
			case 'highway':
				gfVersion = 'gf-car';
			case 'mall' | 'mallEvil':
				gfVersion = 'gf-christmas';
			case 'school':
				gfVersion = 'gf-pixel';
			case 'schoolEvil':
				gfVersion = 'gf-pixel';
		}

		return gfVersion;
	}

	// get the dad's position
	public function dadPosition(curStage, dad:Character, gf:Character, camPos:FlxPoint, songPlayer2):Void
	{
		switch (songPlayer2)
		{
			case 'gf' | 'smug-gf' | 'proto-gf' | 'chef-gf':
				dad.setPosition(gf.x, gf.y);
				gf.visible = false;
			/*
				if (isStoryMode)
				{
					camPos.x += 600;
					tweenCamIn();
			}*/

			case "spooky":
				dad.y += 200;
			case "monster":
				dad.y += -20;
			case 'christmas-monster':
				dad.y += -20;
			case 'dad':
				camPos.x += 400;
				dad.y -= 150;
			case 'pico':
				camPos.x += 600;
				dad.x += 150;
				dad.y += 300;
				camPos.set(dad.getGraphicMidpoint().x + 150, dad.getGraphicMidpoint().y);
			case 'parents-christmas':
				dad.x -= 500;
				dad.y += -50;
			case 'senpai':
				dad.x += 150;
				dad.y += 360;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'roses-senpai':
				dad.x += 150;
				dad.y += 360;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'spirit':
				dad.x -= 150;
				dad.y += 100;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'tankman':
				dad.x += 50;
				dad.y += 200;
			case 'ron':
				dad.y += 350;
				dad.x += 50;
			case 'ace':
				dad.y -= 0;
			case 'agoti':
				dad.y += -50;
			case 'sonic':
				dad.y += 200;
			case 'tricky':
				dad.y += 200;
			case 'valerie-opera':
				dad.y += 125;
		}
	}

	public function repositionPlayers(curStage, boyfriend:Character, dad:Character, gf:Character):Void
	{
		// REPOSITIONING PER STAGE
		switch (curStage)
		{
			case 'highway':
				boyfriend.y -= 220;
				boyfriend.x += 260;
				if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					boyfriend.x -= 115;
				}

			// resetFastCar();
			// add(fastCar);

			case 'mall':
				boyfriend.x += 200;

			case 'mallEvil':
				boyfriend.x += 320;
				dad.y -= 80;
			case 'school':
				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
				if(Init.trueSettings.get('BF Skin') == 'Beta'){
					boyfriend.y -= 100;
				}
				else if(Init.trueSettings.get('BF Skin') == 'Mean'){
					boyfriend.y -= 100;
				}
				else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					boyfriend.y -= 50;
				}
			case 'schoolEvil':
				// trailArea.scrollFactor.set();

				// var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
				// evilTrail.changeValuesEnabled(false, false, false, false);
				// evilTrail.changeGraphic()
				// add(evilTrail);
				// evilTrail.scrollFactor.set(1.1, 1.1);

				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
				if(Init.trueSettings.get('BF Skin') == 'Beta'){
					boyfriend.y -= 100;
				}
				else if(Init.trueSettings.get('BF Skin') == 'Mean'){
					boyfriend.y -= 100;
				}
				else if(Init.trueSettings.get('BF Skin') == 'Cheffriend'){
					boyfriend.y -= 50;
				}
			case 'philly':
				boyfriend.x += 100;
				dad.x -= 100;
			case 'ring':
				boyfriend.x += 300;
				dad.x -= 150;
			case 'alt-ring':
				dad.y += 200;
			case 'resturant':
				boyfriend.x += 170;
				boyfriend.y -= 35;
				dad.x -= 30;
				dad.y += 110;
		}
	}

	var curLight:Int = 0;
	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;
	var startedMoving:Bool = false;
	var isGreen:Bool = false;

	public function stageUpdate(curBeat:Int, boyfriend:Boyfriend, gf:Character, dadOpponent:Character)
	{
		// trace('update backgrounds');
		switch (PlayState.curStage)
		{
			case 'highway':
				// trace('highway update');
				grpLimoDancers.forEach(function(dancer:BackgroundDancer)
				{
					dancer.dance();
				});
			case 'mall':
				upperBoppers.animation.play('bop', true);
				bottomBoppers.animation.play('bop', true);
				santa.animation.play('idle', true);

			case 'school':
				bgGirls.dance();
				
			case 'ring':
				if(PlayState.SONG.song.toLowerCase() == 'check-up'){
					if (curBeat % 4 == 0)
					{
						if (isGreen){
							ringbg.animation.play('purple');
							isGreen = false;
						}
						else{
							ringbg.animation.play('green');
							isGreen = true;
						}
					}
				}
				if(PlayState.SONG.song.toLowerCase() == 'bivalve'){
					if (curBeat == 112)
					{
						foreground.add(valerieTransform);
						valerieTransform.animation.play('transform');
					}
					if (curBeat == 116){
						valerieTransform.alpha = 0;
						foreground.remove(valerieTransform);
					}
				}
			
			case 'alt-ring':
				if (curBeat == 60 || curBeat == 284){
					cancerScream.alpha = 1;
					foreground.add(cancerScream);
					cancerScream.animation.play('scream');
				}
				
				if (curBeat == 65 || curBeat == 289){
					cancerScream.alpha = 0;
					foreground.remove(cancerScream);
				}
			
			case 'resturant':
				if (curBeat == 264){
					resturantbg.alpha = 0;
					resturantbg_inv.alpha = 1;
					table.alpha = 0;
					table_inv.alpha = 1;
				}
				if (curBeat > 264 && curBeat < 382){
					table_inv.alpha -= 0.0075;
					resturantbg_inv.alpha -= 0.0075;
				}
				if (curBeat == 382){
					resturantbg.alpha = 1;
					resturantbg_inv.alpha = 0;
					table.alpha = 1;
					table_inv.alpha = 0;
					onekSnapBack.alpha = 1;
					onekSnapBack.animation.play('snapbacktoreality');
				}
				if (curBeat == 388){
					onekSnapBack.alpha = 0;
					foreground.remove(onekSnapBack);
				}
				
			case 'philly':
				if (!trainMoving)
					trainCooldown += 1;

				if (curBeat % 4 == 0)
				{
					var lastLight:FlxSprite = phillyCityLights.members[0];

					phillyCityLights.forEach(function(light:FNFSprite)
					{
						// Take note of the previous light
						if (light.visible == true)
							lastLight = light;

						light.visible = false;
					});

					// To prevent duplicate lights, iterate until you get a matching light
					while (lastLight == phillyCityLights.members[curLight])
					{
						curLight = FlxG.random.int(0, phillyCityLights.length - 1);
					}

					phillyCityLights.members[curLight].visible = true;
					phillyCityLights.members[curLight].alpha = 1;

					//FlxTween.tween(phillyCityLights.members[curLight], {alpha: 0}, Conductor.stepCrochet * .016);
				}

				if (curBeat % 8 == 4 && FlxG.random.bool(30) && !trainMoving && trainCooldown > 8)
				{
					trainCooldown = FlxG.random.int(-4, 0);
					trainStart();
				}
		}
	}

	public function stageUpdateConstant(elapsed:Float, boyfriend:Boyfriend, gf:Character, dadOpponent:Character)
	{
		switch (PlayState.curStage)
		{
			case 'philly':
				if (trainMoving)
				{
					/*trainFrameTiming += elapsed;

					if (trainFrameTiming >= 1 / 24)
					{
						updateTrainPos(gf);
						trainFrameTiming = 0;
					}*/
				}
		}
	}

	// PHILLY STUFFS!
	function trainStart():Void
	{
		/*trainMoving = true;
		if (!trainSound.playing)
			trainSound.play(true);*/
	}

	function updateTrainPos(gf:Character):Void
	{
		/*if (trainSound.time >= 4700)
		{
			startedMoving = true;
			gf.playAnim('hairBlow');
		}

		if (startedMoving)
		{
			phillyTrain.x -= 400;

			if (phillyTrain.x < -2000 && !trainFinishing)
			{
				phillyTrain.x = -1150;
				trainCars -= 1;

				if (trainCars <= 0)
					trainFinishing = true;
			}

			if (phillyTrain.x < -4000 && trainFinishing)
				trainReset(gf);
		}*/
	}

	function trainReset(gf:Character):Void
	{
		/*gf.playAnim('hairFall');
		phillyTrain.x = FlxG.width + 200;
		trainMoving = false;
		// trainSound.stop();
		// trainSound.time = 0;
		trainCars = 8;
		trainFinishing = false;
		startedMoving = false;*/
	}

	override function add(Object:FlxBasic):FlxBasic
	{
		if (Init.trueSettings.get('Disable Antialiasing') && Std.isOfType(Object, FlxSprite))
			cast(Object, FlxSprite).antialiasing = false;
		return super.add(Object);
	}
}
