/*
 * Arduino Telegraph Sounder
 * Code to hook up an old telegraph sounder to an Arduino
 * Copyright Patrick Schless 2011
 */

#ifndef telegraphsounder_h
#define telegraphsounder_h

#include <Wiring.h>

class TelegraphSounder {
  public:
    TelegraphSounder(uint8_t pin);
    void dot();
    void dash();

    void say(char *string, uint8_t size);

  private:
    uint8_t speed, pin;

    void on(uint8_t count);
    void elementGap();
    void letterGap();
    void wordGap();
};

#endif
