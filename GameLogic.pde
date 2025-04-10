void updateGame() {
  if (gameActive) {
    if (currentCell != -1 && millis() - litStartTime >= litDuration) {
      cellColors[currentCell % size][currentCell / size] = false;
      currentCell = -1;
      blinksRemaining--;
      if (blinksRemaining <= 0) {
        gameActive = false;
      }
    }

    if (currentCell == -1 && millis() - lastBlinkTime >= blinkInterval) {
      blinkRandomCell();
    }
  }
}

void blinkRandomCell() {
  if (currentCell != -1) {
    cellColors[currentCell % size][currentCell / size] = false;
  }

  int newCell;
  do {
    newCell = int(random(size * size));
  } while (newCell == previousCell);

  currentCell = newCell;
  cellColors[currentCell % size][currentCell / size] = true;

  previousCell = currentCell;

  litDuration = abs(litDurationMean + randomGaussian() * litDurationStdDev);
  blinkInterval = abs(blinkIntervalMean + randomGaussian() * blinkIntervalStdDev);

  litStartTime = millis();
  lastBlinkTime = millis();
}

void startGame() {
  gameActive = true;
  score = 0;
  blinksRemaining = 10;
  blinkRandomCell();
  //moleRandomCell();
}

void pauseGame() {
  gameActive = false;
}
