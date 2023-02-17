#
# Copyright (C) 2022-2023 The ShirayukiProject (formerly ProjectAkari) && SuzuNetwork
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

OFFICIAL_MAINTAINER = $(shell cat official-maintainer/maintainers.list | awk '{ print $$1 }')

ifdef ALRIGHT_MAINTAINER
ifeq ($(filter $(ALRIGHT_MAINTAINER), $(OFFICIAL_MAINTAINER)), $(ALRIGHT_MAINTAINER))
$(warning "AlrightAndroid: $(ALRIGHT_MAINTAINER) is verified as official maintainer, build as official build.")
    ALRIGHT_OFFICIAL = true
else
$(warning "AlrightAndroid: Unofficial maintainer detected, building as unofficial build.")
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.aos.maintainer=$(ALRIGHT_MAINTAINER)
else
$(warning "AlrightAndroid: No maintainer name detected, building as unofficial build.")
   ALRIGHT_MAINTAINER := Unofficial Maintainer? We cannot recognize the maintainer
   ro.aos.maintainer=$(ALRIGHT_MAINTAINER)
endif
