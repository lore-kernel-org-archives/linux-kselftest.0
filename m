From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:26 -0600
Subject: [PATCH 22/24] selftests: memory-hotplug: return Kselftest Skip code
 for skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-22-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011326.bEpPyUwCZCGl3I24mKZyHgUwr4QLRK-YM3GGDk0W0oY@z>

When memory-hotplug test is skipped because of unmet dependencies and/or
unsupported configuration, it returns non-zero value hich is treated as a
fail by the Kselftest framework. This leads to false negative result even
when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/memory-hotplug/mem-on-off-test.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index ff4991704d07..b37585e6aa38 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -3,30 +3,33 @@
 
 SYSFS=
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 prerequisite()
 {
 	msg="skip all tests:"
 
 	if [ $UID != 0 ]; then
 		echo $msg must be run as root >&2
-		exit 0
+		exit $ksft_skip
 	fi
 
 	SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
 
 	if [ ! -d "$SYSFS" ]; then
 		echo $msg sysfs is not mounted >&2
-		exit 0
+		exit $ksft_skip
 	fi
 
 	if ! ls $SYSFS/devices/system/memory/memory* > /dev/null 2>&1; then
 		echo $msg memory hotplug is not supported >&2
-		exit 0
+		exit $ksft_skip
 	fi
 
 	if ! grep -q 1 $SYSFS/devices/system/memory/memory*/removable; then
 		echo $msg no hot-pluggable memory >&2
-		exit 0
+		exit $ksft_skip
 	fi
 }
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
