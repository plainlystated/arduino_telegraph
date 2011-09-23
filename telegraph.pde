/*
 * Arduino Telegraph Sounder
 * Code to hook up an old telegraph sounder to an Arduino
 * Copyright Patrick Schless 2011
 */

#define SOUNDER 8

uint8_t speed = 50;

void on(uint8_t count) {
  digitalWrite(SOUNDER, HIGH);
  delay(speed * count);
  digitalWrite(SOUNDER, LOW);
}

void dot() {
  on(1);
  elementGap();
}

void dash() {
  on(3);
  elementGap();
}

void elementGap() {
  delay(speed * 1);
}

void letterGap() {
  delay(speed * 2); // minus 1 for element gap
}

void wordGap() {
  delay(speed * 4); // minus 1 for element gap and 2 for letter gap
}

void say(char *word, uint8_t size) {
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
}


void setup() {
Serial.begin(9600);
  pinMode(SOUNDER, OUTPUT);
  digitalWrite(SOUNDER, LOW);

  say("four score and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and dedicated to the proposition that all men are created equal now we are engaged in a great civil war testing whether that nation or any nation so conceived and so dedicated can long endure we are met on a great battlefield of that war we have come to dedicate a portion of that field as a final resting place for those who here gave their lives that that nation might live it is altogether fitting and proper that we should do this but in a larger sense we can not dedicate we can not consecrate we can not hallow this ground the brave men living and dead who struggled here have consecrated it far above our poor power to add or detract the world will little note nor long remember what we say here but it can never forget what they did here it is for us the living rather to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced it is rather for us to be here dedicated to the great task remaining before us that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion that we here highly resolve that these dead shall not have died in vain that this nation under god shall have a new birth of freedom and that government of the people by the people for the people shall not perish from the earth", 1418);

  digitalWrite(SOUNDER, LOW);
}

void loop() {
}
