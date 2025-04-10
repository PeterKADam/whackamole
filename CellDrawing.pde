void drawGrid() {
  for (int y = 0; y < size; y++) {
    for (int x = 0; x < size; x++) {
      int num = x + y * size;
      drawCell(x, y, num);
    }
  }
}

void drawCell(int x, int y, int num) {
  int posX = x * cellSize;
  int posY = y * cellSize;

  stroke(0);
  fill(200);

  rect(posX, posY, cellSize, cellSize);

  if (cellColors[x][y]) {
    image(moleImage, posX + cellSize / 4, posY + cellSize / 4, cellSize / 2, cellSize / 2);
  }
    


}
