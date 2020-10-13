void setup() {
  fullScreen();
  noFill();
  stroke(255);
  strokeWeight(2);
}

float time;

void draw() {
  background(0);
  translate(width/2, height/2);

  beginShape();

  for (float theta = 0; theta <= 2 * PI; theta += 0.01) {
    float rad = rad(
      theta, 
      sin(time) * 0.5 + 0.9, // a - size
      sin(time) * 0.5 + 0.9, // b - size
      7, // m - symmetry

      cos(time) * 0.5 + 0.7, // n1 - smoothness
      sin(time) * 0.5 + 0.5, // n2
      sin(time) * 0.5 + 0.7  // n3
    );
    
    float x = rad * cos(theta) * 50 * displayDensity;
    float y = rad * sin(theta) * 50 * displayDensity;

    vertex(x, y);
  }

  endShape();

  time += 0.1;
}

float rad(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(
    pow(abs(cos(m * theta/4.0)/a), n2) + pow(abs(sin(m * theta/4.0)/b), n3), 
    -1.0/n1
  );
}
