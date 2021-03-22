PGraphics pg;
ArrayList<Word> words = new ArrayList<Word>();
PFont font; 

void setup () {
  size(400, 400);
  font = createFont("Arial Unicode MS", 96, true);
  words.add(new Word("非常事態宣言"));
  words.add(new Word("تضامن"));
  words.add(new Word("Números"));
  words.add(new Word("격리시설"));
  // noCursor();
}

void draw () {
  background(0);
  for (int i = 0; i < words.size(); i++) {
    words.get(i).display();
  }
  filter(BLUR, 1);
  // saveFrame("filename-####.jpg");
}
