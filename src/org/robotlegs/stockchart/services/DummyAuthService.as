
package org.robotlegs.stockchart.services
{
	import org.robotlegs.stockchart.model.UserProxy;
	import org.robotlegs.mvcs.Actor;
	
	public class DummyAuthService extends Actor implements IAuthService
	{
		[Inject]
		public var userProxy:UserProxy;
		
		public function DummyAuthService()
		{
		}
		
		public function login(username:String, password:String):void
		{
			// This would normally be asynchronous
			userProxy.setUsername(username);
			userProxy.userLoggedIn = true;
		}
		
		public function logout():void
		{
			userProxy.userLoggedIn = false;
		}
	
	}
}