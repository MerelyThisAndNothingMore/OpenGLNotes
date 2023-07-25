#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;

uniform float factor;

out vec3 ourColor;

void main()
{

    vec3 startColor = vec3(0.);
    vec3 targetColor = vec3(0.);

    if (factor > 2.0) {
        startColor = aColor.yzx;
        targetColor = aColor.xyz;
    } else if (factor > 1.0) {
        startColor = aColor.zxy;
        targetColor = aColor.yzx;
    } else if (factor >= 0.) {
        startColor = aColor.xyz;
        targetColor = aColor.zxy;
    }

    vec3 step = targetColor - startColor;
    step = step * fract(factor);
    vec3 color = startColor + step;

    gl_Position = vec4(aPos, 1.0);
    ourColor = color;
}