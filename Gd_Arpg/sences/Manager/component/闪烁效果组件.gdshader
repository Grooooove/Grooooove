shader_type canvas_item;

//着色器里面代码变成OpenGL Shader的GLSL语言...而且不支持中文
uniform float lerp_percent : hint_range(0.0, 1.0);


void fragment() {
	vec4 texture_color = texture(TEXTURE,UV);  //获取图片原本的纹理
	vec4 final_color = mix(texture_color, vec4(1.0,1.0,1.0,texture_color.a),lerp_percent);
	COLOR = final_color ;
}