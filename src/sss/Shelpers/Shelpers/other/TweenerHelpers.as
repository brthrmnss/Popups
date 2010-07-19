package  sss.Shelpers.Shelpers.other
{
	import caurina.transitions.Tweener;
	
	import flash.utils.setTimeout;
	
	import mx.core.UIComponent; 
	
	public class TweenerHelpers 
	{
		static public function FadeIn( e : Object, dontAdjustSettings : Boolean = false, delay :  Number = 0  )  : void
		{
			e.visible = true
			e.alpha = 0 //??
			var werwe : Tweener
			Tweener.addTween( e, {alpha:1, time:5, delay:delay, transition:TweenerHelpers.Default});
		}
		 
		static public function FadeIn2( e : Object, time_ : Number=2,dontAdjustSettings : Boolean = false, delay :  Number = 0, maxAlpha : Number = 1  )  : void
		{
			if ( dontAdjustSettings == false )
				e.alpha = 0 //??			
			if ( e.visible == true && e.alpha == maxAlpha ) 
				return; 
			e.visible = true

			if ( e.alpha != maxAlpha )
				Tweener.addTween( e, {alpha:maxAlpha, time:time_, delay:delay, transition:TweenerHelpers.Default});
		}		 
		 
		static public function TProp( e : Object, prop : String , toVal :  Number , 
		time : Number = 3,delay : Number = 0, transistion : String = 'easeoutexpo'     )  : void
		{
			var werwe : Tweener
			
			var f : Object = { time:time, delay:delay, transition:transistion} //new Object()
			f[prop] = toVal
			Tweener.addTween( e, f);
		}		 
		 
		static public function MoveAction( e : Object, prop :  String, delay :  Number = 0  )  : void
		{
			e.visible = true
			e.alpha = 0 //??
			var werwe : Tweener
			Tweener.addTween( e, {alpha:1, time:5, delay:delay, transition:TweenerHelpers.Default});
		}		 
		static public var BouceBack : String = 'easeinoutbounce'
		
		 static public var Default : String = 'easeoutexpo' //easeInExpo'; causes problesm 
		 
		 
		static public function delayedAddChild( e :  UIComponent, child : UIComponent, secsToWait :  Number , i : int   )  : void
		{
				var ms_timeToWait : Number =(  secsToWait*1000*i ) + 200
				//figure out secs to wait, 
				//add the child at that time
				//add a fade in effect
				setTimeout( e.addChild, ms_timeToWait, child )
				TweenerHelpers.FadeIn( child, false, (ms_timeToWait/1000)  )
		}
		  
		  
		static public function tweenAtoB(    a : UIComponent , b : UIComponent  ) : void
		{
			var wer : Tweener
	 		Tweener.addTween( a, {width:b.width, time:2, delay:0, transition:"easeOutExpo"});
	 		Tweener.addTween( a, {height:b.height, time:2, delay:0, transition:"easeOutExpo"});			 
		}					 
	 
		static public function TweenProp(    a :  Object , prop : String, val : Number, time : Number = 2, 
						delay : Number = 0, callFxAtEnd : Function = null , params :  Array = null, _transition : String = 'easeOutExpo') : void
		{
			var obj : Object = {  time:time, delay:delay, transition:_transition  }
			obj[prop] = val
			if ( callFxAtEnd != null )
				obj['onComplete'] = callFxAtEnd
			if ( params != null )
				obj['onCompleteParams'] = params
	 		Tweener.addTween( a, obj);
		}	 
	 
	 static public function removeTweens( fromThis : Object ,  ...props) : Boolean
	 {
		 /*
		 var fx : Function = Tweener.removeTweens
		return x.apply( this, [fromThis].concat( props )  ) */ 
	 	return Tweener.removeTweens( fromThis,  props ); 
	 }
	 
	 static public function tweeenToXY( ui : Object , time : Number,  x : Number, y : Number, transition :  String = 'easeOutExpo' ) :  void
	 {
 				TweenerHelpers.TProp( ui, 'x', x, time , 0, transition )
 				TweenerHelpers.TProp( ui, 'y', y, time , 0, transition )
	 }			
						  
		 

		/**
		 * IF it is visible, fade it out 
		 * @param e
		 * @param time_
		 * @param adjustAlpha
		 * @param delay
		 * @param minAlpha
		 * 
		 */
		static public function FadeOut_Safe( e : Object, time_ : Number=0.5, adjustAlpha : Boolean = false, delay :  Number = 0, minAlpha : Number = 0, removeTweens : Boolean = true  )  : void
		{
			if ( e.visible == false )
				return; 			
			if ( adjustAlpha == true  )
				e.alpha = 1 //??	
			if ( removeTweens ) 		
				TweenerHelpers.removeTweens( e ) 
			TweenerHelpers.TweenProp(  e, 'alpha', 0, time_, delay, TweenerHelpers.HideComponent,  [e] ) 
		}		 		 
		 
		static public function HideComponent ( e : Object  )  : void
		{
			 e.visible = false 
		}		 			
		
		/**
		 * IF it is not  visible, fade it in 
		 * @param e
		 * @param time_
		 * @param adjustAlpha - will reset alpha to create a complete fade, default. false
		 * @param delay
		 * @param minAlpha
		 * 
		 */
		static public function FadeIn_Safe( e : Object, time_ : Number=0.5, adjustAlpha : Boolean = true, delay :  Number = 0, maxAlpha : Number = 1, removeTweens : Boolean = true  )  : void
		{
			//somewhat debatable
			if ( e.visible == true && e.alpha == maxAlpha )
				return; 			
			if ( adjustAlpha == true  )
				e.alpha = 0 //??			
			if ( removeTweens ) 		
				TweenerHelpers.removeTweens( e ) 		
			e.visible = true; 		
			TweenerHelpers.TweenProp(  e, 'alpha', 1, time_, delay  ) 
		}		 		 
 
		 
		 
		 
		 
		 
		  
	 	
	}
}