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
  if (cellColors[x][y]) {
    fill(0);
  } else {
    fill(200);
  }
  rect(posX, posY, cellSize, cellSize);

  if (cellColors[x][y]) {
    fill(255);
  } else {
    fill(0);
  }
  textAlign(CENTER, CENTER);
  textSize(20);
  text(num, posX + cellSize / 2, posY + cellSize / 2);
}
