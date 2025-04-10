void settings() {
  size(size * cellSize + scoreWidth, size * cellSize);
}

void setup() {
  cellColors = new boolean[size][size];
  for (int y = 0; y < size; y++) {
    for (int x = 0; x < size; x++) {
      cellColors[x][y] = false;
    }
  }
  loadImages();
}

void draw() {
  background(255);
  drawGrid();
  updateGame();
  drawScore();
  drawMessage();
  drawButtons();
  drawCursor();
}

void mousePressed() {
  handleCellClick();
  handleButtonClick();
}
