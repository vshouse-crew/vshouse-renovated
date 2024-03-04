function onEvent(eventEvent) {
	var types = switch(eventEvent.event.params[0]){
        case "On":
            lockedIn = false;
        case "Off":
            lockedIn = true;
    };
}