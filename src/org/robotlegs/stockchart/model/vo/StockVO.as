/*
 PureMVC AS3 Demo - Flex Employee Admin 
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.robotlegs.stockchart.model.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class StockVO
	{
		/*public function ChartDataVO ( name_:String=null, desc_ : String=null, 
								 series_:Array=null )
		{
			if( name_ != null ) this.name = name_;
			if( desc_ != null ) this.desc = desc_
			if( series_ != null ) this.series = new ArrayCollection( series_ );
		} */
	/* 	public var username:String = "";
		public var roles:ArrayCollection = new ArrayCollection();
		 */
		public var name : String='Adobe Systems Incorporated';
		public var exchange : String='NASDAQ';		
		public var symbol : String='ADBE';				
		public var desc : String = ''; 
		public var price : Number = 33.72;
		public var diff : Number = -.69;
		public var percentageChange : Number = -2.01;		
		public var range : String = '33.26 - 34.40';		
		public var week52 : String = '25.20 - 38.20';		
		public var open : Number = 34.24;		
		public var volAvg : String = '7.08M';		
		public var mktcap : Number = (17.75*1000);		
		public var pe : Number = 50.17;		
		public var div_yield : Number = -1;		
		public var eps : Number = 0.67;		
		
	}
}