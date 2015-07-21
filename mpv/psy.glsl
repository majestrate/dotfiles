

// psy.glsl
// copywrong you're mom 2015
// > still having software licenses

// do psy effect on 1 value
float psy(float val, float mag, float thresh)
{
  return sin(val * mag + frame ) + thresh;
}

vec4 sample(sampler2D tex, vec2 pos, vec2 tex_size)
{
    vec4 color = texture(tex, pos);
    float mag = 20.0;
    float t = 0.5;
    float r = psy(color.r, mag, t);
    float g = psy(color.g, mag, t);
    float b = psy(color.b, mag, t);
    float a = psy(color.a, mag, t);
    
    return vec4(r, g, b, a);
}
