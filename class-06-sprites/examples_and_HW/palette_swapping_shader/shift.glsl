uniform sampler2D tile;
uniform sampler2D palette;
uniform float paletteIndex;
varying vec4 vertTexCoord;

void main() {
	vec2 st = vertTexCoord.st;
	vec3 color = texture2D(tile, st).rgb;
	vec2 index = vec2((color.r + paletteIndex), 0.0);
	vec4 indexedColor = texture2D(palette,index);
	gl_FragColor = indexedColor;

	// gl_FragColor = vec4(color.r, color.r, color.r, 1.0);
}