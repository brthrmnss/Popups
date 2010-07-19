package com.degrafa.states
{
    import com.degrafa.core.collections.*;

    public interface IDegrafaStateClient extends IEventDispatcher, IStateClient, IGeometry
    {

        public function IDegrafaStateClient();

        function get geometryCollection() : GeometryCollection;

        function get states() : Array;

        function set geometry(param1:Array) : void;

        function get geometry() : Array;

        function get isInitialized() : Boolean;

        function set states(param1:Array) : void;

    }
}
