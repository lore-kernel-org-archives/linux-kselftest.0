From: po-hsu.lin@canonical.com (Po-Hsu Lin)
Date: Tue, 12 Mar 2019 17:58:45 +0800
Subject: [PATCH] selftests: cpu-hotplug: check hotplug dir for the
 CONFIG_HOTPLUG_CPU
Message-ID: <20190312095845.17541-1-po-hsu.lin@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190312095845.uP5rE1WARY8dVy4Kxv7VoFnvSwjgHqRbbLuMKkma4bY@z>

When the CONFIG_HOTPLUG_CPU is not set, there won't be a "hotplug"
directory in /sys/devices/system/cpu/. Make use of this fact to check
if we need to skip this test.

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 0d26b5e..27275a1 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -23,6 +23,11 @@ prerequisite()
 		exit $ksft_skip
 	fi
 
+	if [ ! -d $SYSFS/devices/system/cpu/hotplug/ ]; then
+		echo $msg CONFIG_HOTPLUG_CPU needs to be enabled >&2
+		exit $ksft_skip
+	fi
+
 	if ! ls $SYSFS/devices/system/cpu/cpu* > /dev/null 2>&1; then
 		echo $msg cpu hotplug is not supported >&2
 		exit $ksft_skip
-- 
2.7.4
