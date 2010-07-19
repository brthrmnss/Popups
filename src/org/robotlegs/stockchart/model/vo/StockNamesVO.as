/*
 PureMVC AS3 Demo - Flex Employee Admin 
 Copyright (c) 2007-10 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.robotlegs.stockchart.model.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ChartDataVO
	{
		public function ChartDataVO ( name_:String=null, desc_ : String=null, 
								 series_:Array=null )
		{
			if( name_ != null ) this.name = name_;
			if( desc_ != null ) this.desc = desc_
			if( series_ != null ) this.series = new ArrayCollection( series_ );
		} 
	/* 	public var username:String = "";
		public var roles:ArrayCollection = new ArrayCollection();
		 */
		public var name : String='';
		public var desc : String = ''; 
		public var series : ArrayCollection  = new ArrayCollection();
		
	}
}