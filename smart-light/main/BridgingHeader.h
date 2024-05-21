//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#define CHIP_HAVE_CONFIG_H 1
#define CHIP_USE_ENUM_CLASS_FOR_IM_ENUM 1
#define CHIP_ADDRESS_RESOLVE_IMPL_INCLUDE_HEADER <lib/address_resolve/AddressResolve_DefaultImpl.h>

#include <stdio.h>
#include <math.h>

extern "C"
size_t strnlen(const char *s, size_t maxlen);

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <led_strip.h>
#include <sdkconfig.h>
#include <nvs_flash.h>

#include <esp_matter.h>
#include <esp_matter_cluster.h>

#include <app-common/zap-generated/ids/Clusters.h>

#include <app/server/Server.h>

#include <led_driver.h>
#include <device.h>

// GNU C++ interfaces do not jive with the swift importer for certain types... so we have some simple shims...
// the uint32_t gets imported as UInt and not CUnsignedLong (how it is defined by esp-idf)

namespace esp_matter {
  namespace attribute {
    
    typedef esp_err_t (*callback_t_shim)(callback_type_t type, uint16_t endpoint_id, unsigned int cluster_id, unsigned int attribute_id,
                                    esp_matter_attr_val_t *val, void *priv_data);

    esp_err_t set_callback_shim(callback_t_shim callback);
  }

  namespace cluster {
    cluster_t *get_shim(endpoint_t *endpoint, unsigned int cluster_id);
  }

  namespace attribute {
    attribute_t *get_shim(cluster_t *cluster, unsigned int attribute_id);
  }
}

// Recomissioning causes failures with reference semantics so this is done as an inline function
// ideally this would be done via changing some of the headers in the esp-matter to have proper swift annotations
void recomissionFabric();
