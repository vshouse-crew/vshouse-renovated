function onEvent(eventEvent) {
if (eventEvent.event.name == "zoominterval") 
    {
        if (eventEvent.event.params[0] == 0)
            {
            }
            else
                {
                    camZoomingStrength = camZoomingStrength + eventEvent.event.params[0];
                }
    }
}