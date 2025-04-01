int size = 3;
int cellSize = 100; // Size of each cell
int scoreWidth = 150; // Width allocated for the score display
boolean[][] cellColors; // Array to keep track of cell colors

float blinkIntervalMean = 1000;
float blinkIntervalStdDev = 200;
float litDurationMean = 500;
float litDurationStdDev = 100;
long lastBlinkTime = 0;
long litStartTime = 0;
int currentCell = -1;
int previousCell = -1;
float litDuration;
float blinkInterval; 
int blinksRemaining = 10;

String message = ""; //  "Hit!" or "Miss!"
long messageStartTime = 0; 
long messageDuration = 1000; 
float messageX, messageY; // Position to display the message

int score = 0;

boolean gameActive = false; 

// Button properties
int buttonWidth = 120;
int buttonHeight = 40;
int startButtonX = size * cellSize + 20;
int startButtonY = 50;
int pauseButtonX = size * cellSize + 20;
int pauseButtonY = 100;

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
}

void draw() {
  background(255);

  // Draw the grid
  for (int y = 0; y < size; y++) {
    for (int x = 0; x < size; x++) {
      int num = x + y * size;
      drawCell(x, y, num);
    }
  }

  // Game logic
  if (gameActive) {
    // Check if the lit duration has passed
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

  // draw score
  fill(0);
  textAlign(LEFT, TOP);
  textSize(24);
  text("Score: " + score, size * cellSize + 10, 10);

  //  hit or miss message
  if (millis() - messageStartTime < messageDuration) {
    float alpha = map(millis() - messageStartTime, 0, messageDuration, 255, 0);
    if (message.equals("Hit!")) {
      fill(0, 255, 0, alpha); // Green 
    } else {
      fill(255, 0, 0, alpha); // Red
    }
    textAlign(CENTER, CENTER);
    textSize(36);
    text(message, messageX, messageY);
  }

  drawStartButton();
  drawPauseButton();
}

void drawCell(int x, int y, int num) {
  int posX = x * cellSize;
  int posY = y * cellSize;

  // Draw the square with toggled color
  stroke(0);
  if (cellColors[x][y]) {
    fill(0); // Black 
  } else {
    fill(200); //  Gray 
  }
  rect(posX, posY, cellSize, cellSize);

  // Draw the number with contrasting color
  if (cellColors[x][y]) {
    fill(255); // White text on black 
  } else {
    fill(0); // Black text on gray 
  }
  textAlign(CENTER, CENTER);
  textSize(20);
  text(num, posX + cellSize / 2, posY + cellSize / 2);
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

  // abs cause randomGauss is mean 0, and no way to change. #derp
  litDuration = abs(litDurationMean + randomGaussian() * litDurationStdDev);
  blinkInterval = abs(blinkIntervalMean + randomGaussian() * blinkIntervalStdDev);

  litStartTime = millis();
  lastBlinkTime = millis();
}

void mousePressed() {
  // Calculate which cell was clicked
  int cellX = mouseX / cellSize;
  int cellY = mouseY / cellSize;

  // Check if the clicked cell is the lit cell
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

  // start button 
  if (mouseX > startButtonX && mouseX < startButtonX + buttonWidth &&
      mouseY > startButtonY && mouseY < startButtonY + buttonHeight) {
    startGame();
  }

  // pause button 
  if (mouseX > pauseButtonX && mouseX < pauseButtonX + buttonWidth &&
      mouseY > pauseButtonY && mouseY < pauseButtonY + buttonHeight) {
    pauseGame();
  }
}

void drawStartButton() {
  fill(200);
  stroke(0);
  rect(startButtonX, startButtonY, buttonWidth, buttonHeight);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Start", startButtonX + buttonWidth / 2, startButtonY + buttonHeight / 2);
}

void drawPauseButton() {
  fill(200);
  stroke(0);
  rect(pauseButtonX, pauseButtonY, buttonWidth, buttonHeight);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Pause", pauseButtonX + buttonWidth / 2, pauseButtonY + buttonHeight / 2);
}

void startGame() {
  gameActive = true;
  score = 0;
  blinksRemaining = 10;
  blinkRandomCell();
}

void pauseGame() {
  gameActive = false;
}
