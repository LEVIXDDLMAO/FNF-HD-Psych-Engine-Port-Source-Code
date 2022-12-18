local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene and dialogueIsStoryMode and dialogueIsDisabled then
		makeLuaSprite('cutsceneImage', 'dialogue2/whitty-dude',0,0);
		setObjectCamera('cutsceneImage','hud')
		addLuaSprite('cutsceneImage', true)

		makeLuaSprite('cutsceneImage2', 'dialogue2/yomama-whitty',0,0);
		setObjectCamera('cutsceneImage2','hud')
		addLuaSprite('cutsceneImage2', true)

		makeLuaSprite('blackBG2', 'dialogue2/black',0,0);
		setObjectCamera('blackBG2','hud')
		addLuaSprite('blackBG2', true)

		makeLuaSprite('blackBG', 'dialogue2/blank',0,0);
		setObjectCamera('blackBG','hud')
		addLuaSprite('blackBG', true)

		setProperty('cutsceneImage.visible', false)
		setProperty('cutsceneImage2.visible', false)
		setProperty('blackBG.visible', true)
		setProperty('blackBG.alpha', 0)
		setProperty('inCutscene', true);
		runTimer('startTween', 0.1)
		runTimer('removeSprites3', 1.2)
		allowCountdown = true;
		return Function_Stop;
	elseif not allowCountdown and not seenCutscene and dialogueIsEverywhere and dialogueIsDisabled then
		makeLuaSprite('cutsceneImage', 'dialogue2/whitty-dude',0,0);
		setObjectCamera('cutsceneImage','hud')
		addLuaSprite('cutsceneImage', true)

		makeLuaSprite('cutsceneImage2', 'dialogue2/yomama-whitty',0,0);
		setObjectCamera('cutsceneImage2','hud')
		addLuaSprite('cutsceneImage2', true)

		makeLuaSprite('blackBG2', 'dialogue2/black',0,0);
		setObjectCamera('blackBG2','hud')
		addLuaSprite('blackBG2', true)

		makeLuaSprite('blackBG', 'dialogue2/blank',0,0);
		setObjectCamera('blackBG','hud')
		addLuaSprite('blackBG', true)

		setProperty('cutsceneImage.visible', false)
		setProperty('cutsceneImage2.visible', false)
		setProperty('blackBG.visible', true)
		setProperty('blackBG.alpha', 0)
		setProperty('inCutscene', true);
		runTimer('startTween', 0.1)
		runTimer('removeSprites3', 1.2)
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('cutsceneImageTween', 'cutsceneImage', 0, 1.2, 'circout')
	doTweenAlpha('cutsceneImageTween2', 'cutsceneImage2', 0, 1.2, 'circout')
	doTweenAlpha('blackBGTween', 'blackBG', 0, 1.2, 'circout')
	onTweenCompleted('blackBGTween')
	onTweenCompleted('cutsceneImageTween')
	onTweenCompleted('cutsceneImageTween2')
	runTimer('removeSprites', 1.2)
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'removeSprites' then
		removeLuaSprite('cutsceneImage', true)
		removeLuaSprite('cutsceneImage2', true)
		removeLuaSprite('blackBG', true)
	end
	if tag == 'removeSprites2' then
		removeLuaSprite('blackBG')
	end
	if tag == 'dialogueEnd' then
		startDialogue('dialogueEnd', 'type', 0.8)
	end
	if tag == 'removeSprites3' then
		removeLuaSprite('blackBG2')
	end
	if tag == 'startTween' then
		startDialogue('dialogue', 'type', 0.8);
		doTweenAlpha('blackBGTween4', 'blackBG', 1, 1, 'circout')
		onTweenCompleted('blackBGTween4')
	end
	if tag == 'spriteAppear' then
		doTweenAlpha('blackBGTween3', 'blackBG2', 1, 0.5, 'circout')
		onTweenCompleted('blackBGTween3')
	end
	if tag == 'spriteAppear2' then
		doTweenAlpha('blackBGTween2', 'blackBG', 1, 1, 'circout')
		onTweenCompleted('blackBGTween2')
	end
end

function onNextDialogue(count)
	if count == 3 then
		playMusic('')
	elseif count == 11 then
		setProperty('blackBG.visible', false)
		setProperty('cutsceneImage.visible', true)
	elseif count == 12 then
		setProperty('cutsceneImage.visible', false)
		setProperty('cutsceneImage2.visible', true)
	end
end

function onSkipDialogue(count)
	
end

local allowEndShit = false
function onEndSong()
	if not allowEndShit and isStoryMode and dialogueIsStoryMode and dialogueIsDisabled then
		makeLuaSprite('blackBG2', 'dialogue2/black',0,0);
		setObjectCamera('blackBG2','hud')
		addLuaSprite('blackBG2', true)
		makeLuaSprite('blackBG', 'dialogue2/blank',0,0);
		setObjectCamera('blackBG','hud')
		addLuaSprite('blackBG', true)
		setProperty('blackBG2.alpha', 0)
		setProperty('blackBG.alpha', 0)
		setProperty('inCutscene', true);
		runTimer('spriteAppear', 0.1)
		runTimer('spriteAppear2', 0.6)
		runTimer('dialogueEnd', 0.6)
		allowEndShit = true;
		return Function_Stop;
	elseif not allowEndShit and dialogueIsEverywhere and dialogueIsDisabled then
		makeLuaSprite('blackBG2', 'dialogue2/black',0,0);
		setObjectCamera('blackBG2','hud')
		addLuaSprite('blackBG2', true)
		makeLuaSprite('blackBG', 'dialogue2/blank',0,0);
		setObjectCamera('blackBG','hud')
		addLuaSprite('blackBG', true)
		setProperty('blackBG2.alpha', 0)
		setProperty('blackBG.alpha', 0)
		setProperty('inCutscene', true);
		runTimer('spriteAppear', 0.1)
		runTimer('spriteAppear2', 0.6)
		runTimer('dialogueEnd', 0.6)
		allowEndShit = true;
		return Function_Stop;
	end
	doTweenAlpha('blackBGTween', 'blackBG', 0, 1.2, 'circout')
	onTweenCompleted('blackBGTween')
	runTimer('removeSprites2', 1.2)
	return Function_Continue;
end