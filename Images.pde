PImage moleImage;
PImage hammerImage;


void loadImages() {
  moleImage = loadImage(moleImagePath);
  hammerImage = loadImage(hammerImagePath);

  moleImage.resize(cellSize, cellSize);
  hammerImage.resize(cellSize, cellSize);
}
void drawCursor() {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(hammerAngle*-1);
  image(hammerImage, -hammerImage.width / 2, -hammerImage.height / 2);
  popMatrix();
}




