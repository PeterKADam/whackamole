void drawButtons() {
  drawStartButton();
  drawPauseButton();
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

void handleButtonClick() {
  if (mouseX > startButtonX && mouseX < startButtonX + buttonWidth &&
      mouseY > startButtonY && mouseY < startButtonY + buttonHeight) {
    startGame();
  }

  if (mouseX > pauseButtonX && mouseX < pauseButtonX + buttonWidth &&
      mouseY > pauseButtonY && mouseY < pauseButtonY + buttonHeight) {
    pauseGame();
  }
}
