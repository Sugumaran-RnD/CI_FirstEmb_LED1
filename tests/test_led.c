// test led
#include <assert.h>
#include "led.h"

int main(void) {
    led_on();
    assert(led_status() == 1);

    led_off();
    assert(led_status() == 0);

    return 0;
}
