#version 330 core
layout (location = 0) in vec3 pPosicion;
layout (location = 1) in vec3 pNormal;

out vec3 Posicion;
out vec3 Normal;

uniform mat4 modelo;
uniform mat4 vista;
uniform mat4 proyeccion;

void main()
{
	Posicion = vec3(modelo * vec4(pPosicion, 1));
	Normal = mat3(transpose(inverse(modelo))) * pNormal;
	gl_Position = proyeccion * vista * modelo * vec4(pPosicion, 1.0);
}