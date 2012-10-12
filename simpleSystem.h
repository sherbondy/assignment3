#ifndef SIMPLESYSTEM_H
#define SIMPLESYSTEM_H

#include <vecmath.h>
#include <vector>

#ifdef __APPLE__
# include <GLUT/glut.h>
#else
# include <GL/glut.h>
#endif

#include "particleSystem.h"

using namespace std;

class SimpleSystem: public ParticleSystem
{
public:
	SimpleSystem();
	
	vector<Vector3f> evalF(vector<Vector3f> state);
	
	void draw();
	
};

#endif
