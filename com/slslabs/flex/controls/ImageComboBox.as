package com.slslabs.flex.controls {
    
    import mx.controls.ComboBox;
    import mx.controls.Image;

    /**
     * ComboBox extended to allow an Image to appear when collapsed.
     * 
     * @langversion ActionScript 3.0
     * @author Greg Jastrab &lt;greg&#64;smartlogicsolutions.com&gt;
     * @date 11/26/08
     * @version 1.0
     */
    public class ImageComboBox extends ComboBox {
        
        /* --- Variables --- */
        
        /**
         * Property on the data object that holds the image location.
         * 
         * @default url
         */
        public var imageDataField:String = "url";
        
        /**
         * Image component.
         */
        protected var image:Image;
        
        /**
         * Measured width of the image.
         */
        protected var imageMeasuredWidth:Number;
        
        /**
         * Measured height of the image.
         */
        protected var imageMeasuredHeight:Number;
        
        /* === Variables === */
        
        /* --- Functions --- */
        
        override protected function createChildren():void {
            super.createChildren();
            
            if(!image) {
                image = new Image();
                image.focusEnabled = false;
                
                addChild(image);
            }
        }
        
        override protected function measure():void {
        	super.measure();
        	
        	imageMeasuredHeight = getExplicitOrMeasuredHeight() - getStyle("paddingTop") - getStyle("paddingBottom");
            imageMeasuredWidth  = getExplicitOrMeasuredWidth() - getStyle("paddingLeft") - getStyle("paddingRight") - getStyle("arrowButtonWidth");
        }
        
        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            
            if(selectedItem) {
            	var imageSourceURL:String;
            	
            	// TODO: allow a String to be the data object, and hide the label so [object Object] doesn't appear
            	if(selectedItem && selectedItem[imageDataField]) {
            		imageSourceURL = selectedItem[imageDataField];
            	}
                
                if(imageSourceURL) {
	                image.source = imageSourceURL;
	                
	                // TODO: include text placement here
	                var leftPadding:Number = getStyle("paddingLeft");
	                
	                image.setActualSize(imageMeasuredWidth, imageMeasuredHeight);
	                image.move(leftPadding, (unscaledHeight - imageMeasuredHeight) / 2);
                }
            }
        }
        
        /* === Functions === */
        
    }
    
}