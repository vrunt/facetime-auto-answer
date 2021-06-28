set contacts to {"foo"}

repeat
	repeat while application "FaceTime" is running
		log "FT running"
		tell application "System Events"
			delay 1
			set acceptButton to a reference to button "Accept" of group 1 of UI element 1 of scroll area 1 of window "Notification Center" of application process "NotificationCenter"
			set callerId to value of static text 2 of group 1 of UI element 1 of scroll area 1 of window "Notification Center" of application process "NotificationCenter"
			log callerId
			if acceptButton exists then
				if contacts contains callerId then
					click acceptButton
					delay 2
					set fullscreenButton to a reference to button "FullScreen" of window 1 of application process "FaceTime"
					click fullscreenButton
					repeat while exists (window 1 of process "FaceTime")
						delay 30
					end repeat
				end if
			end if
		end tell
		delay 2
	end repeat
	delay 5
end repeat
