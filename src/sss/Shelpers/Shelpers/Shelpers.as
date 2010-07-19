package sss.Shelpers.Shelpers 
{
	import mx.controls.Alert;
	

public class Shelpers 
{
		public static var Debug : Boolean = false 
 		/*
			public static function traceS ( msg : String, ... args) : void
		{
			for each ( var s : String in args )
			{
				msg = msg + ' ' + s
			}
			trace(msg)
		} 
		*/
		public static function traceS ( msg :  Object, ... args) :  String 
		{
			//var eee : ServerLocator
			if ( Debug )
				return ''
			//
			if ( msg is Boolean && msg == false )
			{
				///trace('sdfsds')
				return '';
			}
			/*
			if ( msg  == false && args.length > 0 )
			{
				//probaly doesn't want to debug
				return;
			}
			*/
			for each ( var s : String in args )
			{
				msg = msg.toString() + ' ' + s
			}
			trace(msg)
			return msg.toString()
		} 	
		
		public static function tEach ( arr : Object, meth : String, listName : String = '', space : String = '')  : void
		{
	 		var count : int = 0 ; 
			for each ( var s :  Object in arr )
			{
				count++
				if ( s != null )
					var val :  Object = s[meth]
				trace(space+' '+count+'. '+val )
			}
			
		} 			
		
		public static function compactEach ( arr : Object, meth : String, listName : String = '', space : String = '')  :  String
		{
	 		var count : int = 0 ; 
	 		var str : String = ''
			for each ( var s :  Object in arr )
			{
				count++
				if ( s != null )
					var val :  Object = s[meth]
				str += (space+' '+count+'. '+val )
			}
			trace( str )
			return str
		} 					
		
		public static function stringify ( msg : String, ... args) :  String
		{
			for each ( var s : String in args )
			{
				msg = msg + ' ' + s
			}
			//trace(msg)
			return msg ; 
		} 		
		
		public static function stringify2 ( msg : String, ... args) :  String
		{
			//more of a formatter than debug tool
			//drops null or empty values
			//if beings iwth punctuation, will drop space
			for each ( var s : String in args )
			{
				if ( s == '' || s == null )
					continue
				if ( s.indexOf('.') != 0 )
					msg += ' '
					
				msg = msg   + s
			}
			//trace(msg)
			return msg ; 
		} 		
	
		static public function toggleBoolean(  val : Boolean) :  Boolean
		{
			if ( val )
				return false;
			return true
		}
		
	static public function alert_ifIdEqZero ( num : int, msg : String ) :  Boolean
	{
			if ( num == 0 ) 
			{
				Shelpers.alert(msg);
				return true
			}
			return false		
	}
	
	static public function alert_ifINotSaved ( num : int, msg : String ='' ) :  Boolean
	{
			if ( num < 1 ) 
			{
				if ( msg != '' ) Shelpers.alert(msg);
				return true
			}
			return false		
	}	
	
	static public function alert_ifIdEqNil ( str :  String, msg : String ) :  Boolean
	{
			if ( str == '' ) 
			{
				Shelpers.alert(msg);
				return true
			}
			return false		
	}	
	
	
	
	static public function alert_ifTrue ( bol :   Boolean, msg : String ) :  Boolean
	{
			if ( bol ) 
			{
				Shelpers.alert(msg);
				return true
			}
			return false		
	}	
	static public var AlertFx :  Function = null; // = false; 	
	static public var AlertNonModal : Boolean = false; 
	static public function alert ( str :  String, title : String = ''  ) :  void
	{
			if( Shelpers.AlertFx != null ) 
			{
				Shelpers.AlertFx( str, title ) 
				return;
			}
			 if ( Shelpers.AlertNonModal ) 
			 {
			 	Alert.show(str, title, Alert.NONMODAL );
			 }
			 else
				Alert.show(str, title  );
	}	
	
		
	
	
	static public function copyWHofAtoB (a : Object, b : Object) : void
	{
		b.height = a.height
		b.width = a.width
		
	}		
		
	
	static public function ifFxNotNullSendData (a :  Function, data : Object = null) :  Object
	{
		if ( a == null ) return null; 
		if ( data != null )
		{
			return a( data ) 
		}	
		else
		{
			return a()
		}
	}		
	
	
			
	static public function ifFormNotNullCallFxAndSendData (a :    Object,  fx : String, data : Object = null) : void
	{
		
		if ( a == null ) return; 
		if ( a.hasOwnProperty(fx ) == false ) return; 
		if ( data != null )
		{
			a[fx]( data ) 
		}	
		else
		{
			a[fx]()
		}
	}		
		
	static public function callFxOnMany (fx:String,  ...args) : void
	{
		
		for each ( var j : Object in args )
		{
			if ( j.hasOwnProperty(fx) ) 
			{
				j[fx]()
			}
		}
		
	}
				
		
	static public function formResult ( fxPrefix : String, ok:Boolean,form:Object=null, msg:String='') :void // fx : String, data : Object = null) : void
	{
		//must send messages
		if ( form == null ) return; 
		var okFx : String = fxPrefix+'Ok'
		var failFx : String = fxPrefix+'Failed'
		var failFx2 : String = fxPrefix+'Fail'
		if ( form.hasOwnProperty(okFx ) == false || ( form.hasOwnProperty(failFx ) == false && form.hasOwnProperty(failFx2 )) ) 
		{	
			Shelpers.traceS('form', form, 'does not have required properties', okFx,'or',  failFx )
			return; 
		}
		var callFx : String = okFx
		if ( ok == false ){
			callFx = failFx
			if( form.hasOwnProperty(failFx ) == false )
				callFx=failFx2
		} 
			
		form[callFx]( msg ) 
	}		
			
	
	
	
	}
	/*
package sss.Shelpers.Shelpers 
{
	import mx.controls.Alert;
	
	import sss2.ServerLocator;

public class Shelpers 
{
 
		public static function traceS ( msg :  Object, ... args) :  String 
		{
			//var eee : ServerLocator
			if ( ServerLocator.liveMode )
				return ''
			//
			if ( msg is Boolean && msg == false )
			{
				///trace('sdfsds')
				return '';
			}
 
			for each ( var s : String in args )
			{
				msg = msg.toString() + ' ' + s
			}
			trace(msg)
			return msg.toString()
		} 	
		
		public static function tEach ( arr : Object, meth : String, listName : String = '', space : String = '')  : void
		{
	 		var count : int = 0 ; 
			for each ( var s :  Object in arr )
			{
				count++
				if ( s != null )
					var val :  Object = s[meth]
				trace(space+' '+count+'. '+val )
			}
			
		} 			
		
		public static function compactEach ( arr : Object, meth : String, listName : String = '', space : String = '')  :  String
		{
	 		var count : int = 0 ; 
	 		var str : String = ''
			for each ( var s :  Object in arr )
			{
				count++
				if ( s != null )
					var val :  Object = s[meth]
				str += (space+' '+count+'. '+val )
			}
			trace( str )
			return str
		} 					
		
		public static function stringify ( msg : String, ... args) :  String
		{
			for each ( var s : String in args )
			{
				msg = msg + ' ' + s
			}
			//trace(msg)
			return msg ; 
		} 		
		
		public static function stringify2 ( msg : String, ... args) :  String
		{
			//more of a formatter than debug tool
			//drops null or empty values
			//if beings iwth punctuation, will drop space
			for each ( var s : String in args )
			{
				if ( s == '' || s == null )
					continue
				if ( s.indexOf('.') != 0 )
					msg += ' '
					
				msg = msg   + s
			}
			//trace(msg)
			return msg ; 
		} 		
	
		static public function toggleBoolean(  val : Boolean) :  Boolean
		{
			if ( val )
				return false;
			return true
		}
		
	static public function alert_ifIdEqZero ( num : int, msg : String ) :  Boolean
	{
			if ( num == 0 ) 
			{
				Alert.show(msg);
				return true
			}
			return false		
	}
	
	static public function alert_ifINotSaved ( num : int, msg : String ='' ) :  Boolean
	{
			if ( num < 1 ) 
			{
				if ( msg != '' ) Alert.show(msg);
				return true
			}
			return false		
	}	
	
	static public function alert_ifIdEqNil ( str :  String, msg : String ) :  Boolean
	{
			if ( str == '' ) 
			{
				Alert.show(msg);
				return true
			}
			return false		
	}	
	
	
	
	static public function alert_ifTrue ( bol :   Boolean, msg : String ) :  Boolean
	{
			if ( bol ) 
			{
				Alert.show(msg);
				return true
			}
			return false		
	}	
		
	static public var AlertNonModal : Boolean = false; 
	static public function alert ( str :  String  ) :  void
	{
			 if ( Shelpers.AlertNonModal ) 
			 {
			 	Alert.show(str, '', Alert.NONMODAL );
			 }
			 else
				Alert.show(str  );
	}	
	
		
	
	
	static public function copyWHofAtoB (a : Object, b : Object) : void
	{
		b.height = a.height
		b.width = a.width
		
	}		
		
	
	static public function ifFxNotNullSendData (a :  Function, data : Object = null) :  Object
	{
		if ( a == null ) return null; 
		if ( data != null )
		{
			return a( data ) 
		}	
		else
		{
			return a()
		}
	}		
	
	
			
	static public function ifFormNotNullCallFxAndSendData (a :    Object,  fx : String, data : Object = null) : void
	{
		
		if ( a == null ) return; 
		if ( a.hasOwnProperty(fx ) == false ) return; 
		if ( data != null )
		{
			a[fx]( data ) 
		}	
		else
		{
			a[fx]()
		}
	}		
		
	static public function callFxOnMany (fx:String,  ...args) : void
	{
		
		for each ( var j : Object in args )
		{
			if ( j.hasOwnProperty(fx) ) 
			{
				j[fx]()
			}
		}
		
	}
				
		
	static public function formResult ( fxPrefix : String, ok:Boolean,form:Object=null, msg:String='') :void // fx : String, data : Object = null) : void
	{
		//must send messages
		if ( form == null ) return; 
		var okFx : String = fxPrefix+'Ok'
		var failFx : String = fxPrefix+'Failed'
		var failFx2 : String = fxPrefix+'Fail'
		if ( form.hasOwnProperty(okFx ) == false || ( form.hasOwnProperty(failFx ) == false && form.hasOwnProperty(failFx2 )) ) 
		{	
			Shelpers.traceS('form', form, 'does not have required properties', okFx,'or',  failFx )
			return; 
		}
		var callFx : String = okFx
		if ( ok == false ){
			callFx = failFx
			if( form.hasOwnProperty(failFx ) == false )
				callFx=failFx2
		} 
			
		form[callFx]( msg ) 
	}		
			
	
	
	
	}
	
	
}
*/

	
}
