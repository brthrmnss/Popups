
package org.robotlegs.stockchart.services
{
	import flash.events.Event;
	
	public interface IAuthService
	{
		function login(username:String, password:String):void;
		function logout():void;
	}

}