function onCreate()
	
	for i = 0, getProperty('unspawnNotes.length')-1 do
		
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alert Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note_warning');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '1.50');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end