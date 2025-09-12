// LED code
#include "led.h"

static int state = 0;

void led_on(void) { state = 1; }
void led_off(void) { state = 0; }
int led_status(void) { return state; }
