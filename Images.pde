PImage moleImage;
PImage hammerImage;


void loadImages() {
  moleImage = loadImage(moleImagePath);
  hammerImage = loadImage(hammerImagePath);

  moleImage.resize(cellSize, cellSize);
  hammerImage.resize(cellSize, cellSize);
}
void drawCursor(){
  image(hammerImage, mouseX - moleImage.width / 2, mouseY - moleImage.height / 2);
}




