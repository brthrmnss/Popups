/*
 PureMVC AS3 Demo - Flex Employee Admin 
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.robotlegs.stockchart.model.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class TickerVO
	{
		 public function TickerVO ( name_:String=null, price_ : Number=0, 
									percentageChange_:Number=0 )
		{
			if( name_ != null ) this.name = name_;
			/*if( price_ != 0 )*/ this.price = price_
			/*if( percentageChange_ != 0 ) */this.percentageChange = percentageChange_
		}  
 
		public var name : String='NASDAQ';
		public var price :  Number= 0;		
		public var percentageChange :  Number = 2.9; 
	 
		
	}
}