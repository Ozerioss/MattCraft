#version 330 core

layout ( location = 0 ) in vec3 vertexPosition;
layout ( location = 1 ) in vec2 texturePosition;

out vec2 textureCoords;

out float vis;

uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform mat4 projectionMatrix;

const float density     = 0.0035;
const float gradient    = 2.82;

void calculateFog ( vec4 vertRelToCamera )
{
    float dist = length ( vertRelToCamera.xyz );
    vis = exp( -pow ( dist * density , gradient ) );
    vis = clamp ( vis, 0.0, 1.0 );
}

void main()
{
    vec4 worldPosition = modelMatrix * vec4 ( vertexPosition, 1.0f );
    vec4 vertRelToCamera = viewMatrix * worldPosition;
    gl_Position = projectionMatrix * vertRelToCamera;

    calculateFog( vertRelToCamera );


    textureCoords = texturePosition;
        //gl_Position.y -= (vertRelToCamera.z * vertRelToCamera.z) / 1000;
}
