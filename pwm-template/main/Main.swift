//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

@_cdecl("app_main")
func app_main() {
  print("🏎️   Hello, Embedded Swift! (LEDC PWM)")

  let pwm0 = PWM ( freq: 1000, timernum:LEDC_TIMER_0, channel: LEDC_CHANNEL_0 ,gpio_num: 10) 
//   var ledc_timer = ledc_timer_config_t( 
//    speed_mode: LEDC_LOW_SPEED_MODE,
//    duty_resolution: LEDC_TIMER_13_BIT,
//    timer_num:  LEDC_TIMER_0,
//    freq_hz: 1000, 
//    clk_cfg: LEDC_AUTO_CLK,
//    deconfigure: false 
//  )
// pwm frequency 1kHz
//  ledc_timer_config(&ledc_timer);

 //  var ledc_channel = ledc_channel_config_t(
 //       gpio_num:   10,
 //       speed_mode: LEDC_LOW_SPEED_MODE,
 //       channel:    LEDC_CHANNEL_0,
 //       intr_type:  LEDC_INTR_DISABLE,
 //       timer_sel:  LEDC_TIMER_0,
 //      duty:       0, 
  //      hpoint:     0,
 //       flags:      .init(output_invert: 0) 
 // )

 // ledc_channel_config(&ledc_channel); falta

// set duty value to 1  
//  ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, 1); 
 // ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
  let minimum_duty: UInt32 = 1
  let blinkDelayMs: UInt32 = 500
  
  pwm0.setDuty (duty: minimum_duty)
  pwm0.updateDuty()
  while true {
      vTaskDelay(blinkDelayMs / (1000 / UInt32(configTICK_RATE_HZ)))

  }
}
