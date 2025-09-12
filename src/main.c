#include "led.h"

int main(void) {
    led_on();
    if (led_status()) {
        // Normally, toggle GPIO here in real embedded code
    }
    led_off();
    return 0;
}

