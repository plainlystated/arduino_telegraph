/*
 * Arduino Telegraph Sounder
 * Code to hook up an old telegraph sounder to an Arduino
 * Copyright Patrick Schless 2011
 */

#include "TelegraphSounder.h"

TelegraphSounder::TelegraphSounder(uint8_t p) {
  speed = 50;

  pin = p;
  pinMode(pin, OUTPUT);
  digitalWrite(pin, LOW);
}

void TelegraphSounder::on(uint8_t count) {
  digitalWrite(pin, HIGH);
  delay(speed * count);
  digitalWrite(pin, LOW);
}

void TelegraphSounder::dot() {
  on(1);
  elementGap();
}

void TelegraphSounder::dash() {
  on(3);
  elementGap();
}

void TelegraphSounder::elementGap() {
  delay(speed * 1);
}

void TelegraphSounder::letterGap() {
  delay(speed * 2); // minus 1 for element gap
}

void TelegraphSounder::wordGap() {
  delay(speed * 4); // minus 1 for element gap and 2 for letter gap
}

void TelegraphSounder::say(char *word, uint8_t size) {
  for(uint8_t i=0; i<size; i++) {
    switch(word[i]) {
      case('a'):
        dot(); dash();
        break;
      case('b'):
        dash(); dot(); dot(); dot();
        break;
      case('c'):
        dash(); dot(); dash(); dot();
        break;
      case('d'):
        dash(); dot(); dot();
        break;
      case('e'):
        dot();
        break;
      case('f'):
        dot(); dot(); dash(); dot();
        break;
      case('g'):
        dash(); dash(); dot();
        break;
      case('h'):
        dot(); dot(); dot(); dot();
        break;
      case('i'):
        dot(); dot();
        break;
      case('j'):
        dot(); dash(); dash(); dash();
        break;
      case('k'):
        dash(); dot(); dash();
        break;
      case('l'):
        dot(); dash(); dot(); dot();
        break;
      case('m'):
        dash(); dash();
        break;
      case('n'):
        dash(); dot();
        break;
      case('o'):
        dash(); dash(); dash();
        break;
      case('p'):
        dot(); dash(); dash(); dot();
        break;
      case('q'):
        dash(); dash(); dot(); dash();
        break;
      case('r'):
        dot(); dash(); dot();
        break;
      case('s'):
        dot(); dot(); dot();
        break;
      case('t'):
        dash();
        break;
      case('u'):
        dot(); dot(); dash();
        break;
      case('v'):
        dot(); dot(); dot(); dash();
        break;
      case('w'):
        dot(); dash(); dash();
        break;
      case('x'):
        dash(); dot(); dot(); dash();
        break;
      case('y'):
        dash(); dot(); dash(); dash();
        break;
      case('z'):
        dash(); dash(); dot(); dot();
        break;
      case(' '):
        wordGap();
        break;
    }
    if (word[i] != ' ') letterGap();
  }
  digitalWrite(pin, LOW);
}
