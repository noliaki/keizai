float tProgress = clamp(uProgress - aDelayDuration.x, 0.0, aDelayDuration.y) / aDelayDuration.y;
tProgress = easeCircInOut(tProgress);
vec4 tQuat = quatFromAxisAngle(aAxisAngle.xyz, radians(aAxisAngle.w) + (uTime / 10.0));
vec3 color = hsv(cos(uTime / 80.0) + aColor.x, aColor.y, aColor.z);
float lat = (uTime / aStaggerTime.y) + aStagger.x;
float lng = (uTime / aStaggerTime.z) + aStagger.y;
float phi = lat * (PI / 180.0);
float theta = (lng - 180.0) * (PI / 180.0);
float staggerDistance = sin((uTime + aStaggerTime.w) / aStaggerTime.x);
float xDist = -(aStagger.w * staggerDistance) * cos(theta) * cos(phi);
float yDist = (aStagger.w * staggerDistance) * sin(phi);
float zDist = (aStagger.w * staggerDistance) * cos(phi) * sin(theta);
float staggerTrans = 1.0 / max(1.0, uStrLen * tProgress * 5.0);