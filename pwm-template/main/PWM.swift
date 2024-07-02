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

// A simple class to provide access to LEDC PWM API in Swift
class PWM {

  init(freq: UInt32, timernum: ledc_timer_t, channel: ledc_channel_t, gpio_num: Int32){
    self.ledc_timer.freq_hz = freq
    self.ledc_timer.timer_num = timernum
    self.ledc_channel.gpio_num = gpio_num
    self.ledc_channel.channel = channel
    
    ledc_timer_config(&ledc_timer)
    ledc_channel_config(&ledc_channel)
  }

  var ledc_timer = ledc_timer_config_t( 
   speed_mode: LEDC_LOW_SPEED_MODE,
   duty_resolution: LEDC_TIMER_13_BIT,
   timer_num:  LEDC_TIMER_0,
   freq_hz: 1000, 
   clk_cfg: LEDC_AUTO_CLK,
   deconfigure: false
  )
  
  var ledc_channel = ledc_channel_config_t(
        gpio_num:   10,
        speed_mode: LEDC_LOW_SPEED_MODE,
        channel:    LEDC_CHANNEL_0,
        intr_type:  LEDC_INTR_DISABLE,
        timer_sel:  LEDC_TIMER_0,
        duty:       0, 
        hpoint:     0,
        flags:      .init(output_invert: 0) 
  )
// esp_err_t ledc_set_duty(ledc_mode_t speed_mode, ledc_channel_t channel, uint32_t duty)
 //   guard led_strip_new_spi_device(&stripConfig, &spiConfig, &handle) == ESP_OK else {
 //     fatalError("cannot configure spi device")
  //  }
//  func setDuty (mode: ledc_mode_t ,channel: ledc_channel_t , duty: UInt32) {
  func setDuty (duty: UInt32) {
 // 	ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, duty);
    guard ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, duty) == ESP_OK else {
      fatalError("cannot set ledc duty")
    }
  }
//  // ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
  func updateDuty() {
      guard ledc_update_duty( ledc_channel.speed_mode ,ledc_channel.channel) == ESP_OK else {
        fatalError("cannot update ledc duty")
      }
  }
}
