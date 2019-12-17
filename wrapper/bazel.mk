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
BAZEL ?=
SLIENT ?= @
BAZEL_VERSION ?= 0.25.0

.PHONY: .bazelversion $(BAZEL) bazel-clean bazel-cleanall

.bazelversion:
	$(SLIENT) echo $(BAZEL_VERSION) > .bazelversion

$(BAZEL): .bazelversion
	$(SLIENT) chmod +x $(BAZEL)

bazel-clean: $(BAZEL)
	$(SLIENT) $(BAZEL) clean

bazel-cleanall: $(BAZEL)
	$(SLIENT) $(BAZEL) clean --expunge
	$(SLIENT) rm -f .bazelversion
