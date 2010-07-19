package org.robotlegs.stockchart.controller
{
	import org.robotlegs.demos.helloflex.services.DummyAuthService;
	import org.robotlegs.demos.helloflex.services.IAuthService;
	import org.robotlegs.mvcs.Command;
	
	public class PrepServicesCommand extends Command
	{
		
		override public function execute():void
		{
			injector.bindSingletonOf(IAuthService, DummyAuthService);
		}
	
	}
}