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

// C standard library
// ==================

#include <stdio.h>
#include <math.h>

// ESP IDF
// =======

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <led_strip.h>
#include <sdkconfig.h>
#include <nvs_flash.h>
#include <led_driver.h>
#include <device.h>

// ESP Matter
// ==========

#define CHIP_HAVE_CONFIG_H 1
#define CHIP_USE_ENUM_CLASS_FOR_IM_ENUM 1
#define CHIP_ADDRESS_RESOLVE_IMPL_INCLUDE_HEADER <lib/address_resolve/AddressResolve_DefaultImpl.h>

// There seems to be assumption in FabricTable.h that strnlen is implicitly available via some other headers, but that
// turns out to not be the case when importing these headers in Swift. Let's manually declare strnlen as a workaround.
//
// connectedhomeip/src/credentials/FabricTable.h:82:69: error: use of undeclared identifier 'strnlen'
extern "C" size_t strnlen(const char *s, size_t maxlen);

#include <esp_matter.h>
#include <esp_matter_cluster.h>
#include <app-common/zap-generated/ids/Clusters.h>
#include <app/server/Server.h>

// Swift Matter interface
// ======================

#include "../Matter/MatterInterface.h"
