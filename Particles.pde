class Particles {
  ArrayList<PVector> particles = new ArrayList<PVector>();
  PGraphics pg;
  float scale = 0;

  float rad = 0.0;

  Particles (PGraphics _pg) {
    pg = _pg;
    loadParticles(pg);
  }

  void loadParticles (PGraphics pg) {
    int step = 2;
    pg.loadPixels();
    for(int y = 0; y < pg.height; y+=step) {
      for(int x = 0; x < pg.width; x+=step) {
        int i = x + (y *  pg.width);
        color c = pg.pixels[i];
        if (brightness(c) > 100) {
          particles.add(new PVector(x, y));
        }
      }
    }
    pg.updatePixels();
  }

  void setScale (float n) {
    // scale = n;
    scale = map2(n, 0, width/2, 0, 100, QUINTIC, EASE_IN_OUT);
    println("setScale", scale);
  }

  void update () {
    rad += 0.01;
    scale = cos(rad) * 50;
  }

  void display () {
    // update();
    strokeWeight(3);
    for (int i = 0; i < particles.size(); i++) {
    stroke(0, 25, random(255) );
      PVector p = particles.get(i);
      float x = p.x + randomGaussian() * scale;
      float y = p.y + randomGaussian() * scale;
      point(x, y);
    }
    // image(pg, 0, 0);
  }
}