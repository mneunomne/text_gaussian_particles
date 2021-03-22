class Word {
  String text;
  float w; 
  float h; 
  int canvasW;
  int canvasH;
  int padding = 5;
  int size = 40;
  PVector p;
  Particles particles;

  Word (String t) {
    text = t;
    textFont(font, size);
    w = textWidth(text);
    h = size;
    p = new PVector(random(10, width - w),random(h * 2, height - h));
    // p = new PVector(width/2 - w/2, height/2);
    canvasW = int(w + padding);
    canvasH = int(h + padding);
    println("textWidth", text, w);
    PGraphics pg = drawCanvas();
    particles = new Particles(pg);
  }

  PGraphics drawCanvas () {
    PGraphics pg;
    pg = createGraphics(canvasW, canvasH);
    pg.beginDraw();
    pg.fill(255);
    pg.textFont(font, size);
    pg.background(25, 0, 0);
    pg.text(text, 0, size);
    pg.endDraw();
    return pg;
  }
  
  void display () {
    // text(text, p.x , p.y + size);
    // image(pg, p.x , p.y);
    float dist = dist(p.x, p.y, mouseX, mouseY);
    particles.setScale(dist/2);
    pushMatrix();
    translate(p.x, p.y);
    particles.display();
    popMatrix();
  } 
}
