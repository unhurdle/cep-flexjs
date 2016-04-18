package com.adobe {
	/**
	 * @author harbs
	 */
	public class GradientStop {
		/**
		 * @class GradientStop
		 * Stores gradient stop information.
		 *
		 * @param offset   The offset of the gradient stop, in the range [0.0 to 1.0].
		 * @param rgbColor The color of the gradient at this point, an \c #RGBColor object.
		 *
		 * @return GradientStop object.
		 */
		function GradientStop(offset : Number = 0, rgbColor : RGBColor = null) {
		}

		public var offset : Number;
		public var rgbColor : RGBColor;
	}
}