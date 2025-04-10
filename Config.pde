// Grid configuration
int size = 3;
int cellSize = 100;
int scoreWidth = 150;

// Blinking configuration
float blinkIntervalMean = 1000;
float blinkIntervalStdDev = 200;
float litDurationMean = 500;
float litDurationStdDev = 100;

// Message configuration
long messageDuration = 1000;
String message = "";
long messageStartTime = 0;
float messageX, messageY;

// Button configuration
int buttonWidth = 120;
int buttonHeight = 40;
int startButtonX = size * cellSize + 20;
int startButtonY = 50;
int pauseButtonX = size * cellSize + 20;
int pauseButtonY = 100;

// Game configuration
int blinksRemaining = 10;
int score = 0;
boolean gameActive = false;

// Timing and state variables
long lastBlinkTime = 0;
long litStartTime = 0;
int currentCell = -1;
int previousCell = -1;
float litDuration;
float blinkInterval;
boolean[][] cellColors;

// image stuffs
String hammerImagePath = "hammer.png";
String moleImagePath = "mole.png";

// angle variable for the hammer animation
float hammerAngle = 0;
float hammerAngleIncrement = 0.1; // controls the speed of the animation