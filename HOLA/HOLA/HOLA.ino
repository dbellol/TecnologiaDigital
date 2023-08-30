#include <TM1637Display.h>

// Define segment symbols
const int CLK = 2;
const int DIO = 3;
#define TEST_DELAY   2000

const uint8_t HOLA[] = {
  SEG_F | SEG_E | SEG_B | SEG_C | SEG_G,           // H
	SEG_A | SEG_F | SEG_E | SEG_D | SEG_C | SEG_B,   // o
	SEG_D | SEG_E | SEG_F,                   // L
	SEG_A | SEG_F | SEG_E | SEG_G | SEG_B | SEG_C    // A
	};

const uint8_t HOLAA[] = {
  SEG_F | SEG_E | SEG_C | SEG_G,           // h
	SEG_E | SEG_D | SEG_C | SEG_G,   // o
	SEG_E | SEG_F,                   // L
	SEG_A | SEG_D | SEG_E | SEG_G | SEG_B | SEG_C    // a
	};
const uint8_t HOLAAA[] = {
  SEG_F | SEG_E | SEG_B | SEG_C | SEG_G,           // H
	SEG_E | SEG_D | SEG_C | SEG_G,   // o
	SEG_E | SEG_F,                   // L
	SEG_A | SEG_D | SEG_E | SEG_G | SEG_B | SEG_C    // a
	};
const uint8_t HOLAAAA[] = {
  SEG_F | SEG_E | SEG_B | SEG_C | SEG_G,           // H
	SEG_E | SEG_D | SEG_C | SEG_G,   // o
	SEG_E | SEG_F,                   // L
	SEG_A | SEG_F | SEG_E | SEG_G | SEG_B | SEG_C    // A
	};

TM1637Display display(CLK, DIO);

void setup() {
  display.setBrightness(0x0f); // Set display brightness (0x00 to 0x07)
}

void loop() {
  display.setSegments(HOLAAA);
}

