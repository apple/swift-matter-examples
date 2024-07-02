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
  let minimum_duty: UInt32 = 1
  let blinkDelayMs: UInt32 = 500
  
  pwm0.setDuty (duty: minimum_duty)
  pwm0.updateDuty()
  while true {
      vTaskDelay(blinkDelayMs / (1000 / UInt32(configTICK_RATE_HZ)))

  }
}
