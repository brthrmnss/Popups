package com.degrafa.core
{
    import com.degrafa.transform.*;

    public interface ITransformablePaint extends IDegrafaObject, IGraphicsFill
    {

        public function ITransformablePaint();

        function set transform(param1:ITransform) : void;

        function get transform() : ITransform;

    }
}
