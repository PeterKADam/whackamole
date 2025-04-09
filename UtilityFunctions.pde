void drawScore() {
  fill(0);
  textAlign(LEFT, TOP);
  textSize(24);
  text("Score: " + score, size * cellSize + 10, 10);
}

void drawMessage() {
  if (millis() - messageStartTime < messageDuration) {
    float alpha = map(millis() - messageStartTime, 0, messageDuration, 255, 0);
    if (message.equals("Hit!")) {
      fill(0, 255, 0, alpha);
    } else {
      fill(255, 0, 0, alpha);
    }
    textAlign(CENTER, CENTER);
    textSize(36);
    text(message, messageX, messageY);
  }
}

void handleCellClick() {
  int cellX = mouseX / cellSize;
  int cellY = mouseY / cellSize;

  if (cellX >= 0 && cellX < size && cellY >= 0 && cellY < size) {
    int clickedCell = cellX + cellY * size;
    if (clickedCell == currentCell) {
      score++;
      message = "Hit!";

      cellColors[currentCell % size][currentCell / size] = false;
      currentCell = -1;
      blinksRemaining--;
      if (blinksRemaining <= 0) {
        gameActive = false;
      }
    } else {
      message = "Miss!";
    }
    messageX = mouseX;
    messageY = mouseY;
    messageStartTime = millis();
  }
}
