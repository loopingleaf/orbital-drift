package sprites.views;

import sprites.View;

class CommsView extends View
{
	public function new(dashboard:Dashboard, x, y, width, height)
	{
		super(dashboard, ViewName.Comms, x, y, width, height, false);
	}
}
