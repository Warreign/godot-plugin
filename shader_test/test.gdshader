shader_type canvas_item;

uniform float region = 0.2;
uniform sampler2D color;

void fragment() {
	// Called for every pixel the material is visible on.
	if (UV.x < region || UV.y < region || UV.x > 1.0 - region || UV.y > 1.0 - region)
	{
		COLOR = vec4((sin(TIME) + 1.0) / 2.0, (cos(TIME) + 1.0) / 2.0, 0.5, 1.0);
	}
	else
	{
		COLOR = vec4(0.0);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
