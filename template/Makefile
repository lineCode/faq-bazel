# Copyright 2019 DeepinThink. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 		http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
BAZEL = "./bazelisk.py"

YARN ?= $(BAZEL) run @nodejs//:yarn

include bazel.mk

.PHONY: clean cleanll yarn.lock website-build \
	website-start website-publish

all: $(BAZEL)
	$(SLIENT) $(BAZEL) build

yarn.lock: $(BAZEL)
	$(SLIENT) $(YARN) install

website-build: yarn.lock
	$(SLIENT) $(YARN) run website-build

website-start: website-build
	$(SLIENT) $(YARN) run website-start

website-publish: website-build
	$(SLIENT) $(YARN) run website-publish

clean: bazel-clean

cleanall: bazel-cleanall
	$(SLIENT) rm -f .DS_Store
	$(SLIENT) rm -f .bazelversion
	$(SLIENT) rm -rf node_modules
	$(SLIENT) rm -rf website/website/node_modules
	$(SLIENT) rm -rf website/website/i18n
	$(SLIENT) rm -rf website/website/build/
