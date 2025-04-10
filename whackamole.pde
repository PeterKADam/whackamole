void settings() {
  size(size * cellSize + scoreWidth, size * cellSize);
}

void setup() {
  frameRate(60);
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

  // Update the hammer angle for animation
  if (hammerAngle > 0) {
    hammerAngle -= hammerAngleIncrement;
  } else {
    hammerAngle = 0;
  }
}

void mousePressed() {
  handleCellClick();
  handleButtonClick();

  // Start the hammer animation
  hammerAngle = PI / 4; // Set the initial angle for the animation
}