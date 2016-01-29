static class Keyboard {
  static boolean down = false;
  static boolean up = false;
  static boolean right = false;
  static boolean left = false;

  static boolean downPressed = false;
  static boolean upPressed = false;
  static boolean rightPressed = false;
  static boolean leftPressed = false;

  static void reset() {
    downPressed = false;
    upPressed = false;
    rightPressed = false;
    leftPressed = false;
  }

  static void isKeyDown(int k) {
    switch (k) {
    case DOWN:
      if (!down) {
        downPressed = true;
      }
      down = true;
      break;
    case UP:
      if (!up) {
        upPressed = true;
      }
      up = true;
      break;
    case RIGHT:
      if (!right) {
        rightPressed = true;
      }
      right = true;
      break;
    case LEFT:
      if (!left) {
        leftPressed = true;
      }
      left = true;
      break;
    default:
      break;
    }
  }

  static void isKeyUp(int k) {
    switch (k) {
    case DOWN:
      down = false;
      break;
    case UP:
      up = false;
      break;
    case RIGHT:
      right = false;
      break;
    case LEFT:
      left = false;
      break;
    default:
      break;
    }
  }

  static boolean isKeyPressed(int k) {
    switch (k) {
    case DOWN:
      if (!down) {
        return true;
      } else {
        return false;
      }
    case UP:
      if (!up) {
        return true;
      } else {
        return false;
      }
    case RIGHT:
      if (!right) {
        return true;
      } else {
        return false;
      }
    case LEFT:
      if (!left) {
        return true;
      } else {
        return false;
      }
    default:
      return false;
    }
  }
}