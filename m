From: amit.pundir at linaro.org (Amit Pundir)
Date: Thu,  9 Nov 2017 01:10:34 +0530
Subject: [Linux-kselftest-mirror] [PATCH v2 1/2] selftests: firmware: skip
	unsupported async loading tests
In-Reply-To: <1510170035-31384-1-git-send-email-amit.pundir@linaro.org>
References: <1510170035-31384-1-git-send-email-amit.pundir@linaro.org>
Message-ID: <1510170035-31384-2-git-send-email-amit.pundir@linaro.org>

Ignore async firmware loading tests on older kernel releases,
which do not support this feature.

Fixes: 1b1fe542b6f0 ("selftests: firmware: add empty string and async tests")
Reviewed-by: Sumit Semwal <sumit.semwal at linaro.org>
Acked-by: Luis R. Rodriguez <mcgrof at kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Signed-off-by: Amit Pundir <amit.pundir at linaro.org>
---
v2:
 Changed the display message to make it consistent across all
 the firmware test scripts. Added Fixes tag.

 tools/testing/selftests/firmware/fw_filesystem.sh | 34 ++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
index 62f2d6f54929..b1f20fef36c7 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -70,9 +70,13 @@ if printf '\000' >"$DIR"/trigger_request 2> /dev/null; then
 	exit 1
 fi
 
-if printf '\000' >"$DIR"/trigger_async_request 2> /dev/null; then
-	echo "$0: empty filename should not succeed (async)" >&2
-	exit 1
+if [ ! -e "$DIR"/trigger_async_request ]; then
+	echo "$0: empty filename: async trigger not present, ignoring test" >&2
+else
+	if printf '\000' >"$DIR"/trigger_async_request 2> /dev/null; then
+		echo "$0: empty filename should not succeed (async)" >&2
+		exit 1
+	fi
 fi
 
 # Request a firmware that doesn't exist, it should fail.
@@ -105,17 +109,21 @@ else
 fi
 
 # Try the asynchronous version too
-if ! echo -n "$NAME" >"$DIR"/trigger_async_request ; then
-	echo "$0: could not trigger async request" >&2
-	exit 1
-fi
-
-# Verify the contents are what we expect.
-if ! diff -q "$FW" /dev/test_firmware >/dev/null ; then
-	echo "$0: firmware was not loaded (async)" >&2
-	exit 1
+if [ ! -e "$DIR"/trigger_async_request ]; then
+	echo "$0: firmware loading: async trigger not present, ignoring test" >&2
 else
-	echo "$0: async filesystem loading works"
+	if ! echo -n "$NAME" >"$DIR"/trigger_async_request ; then
+		echo "$0: could not trigger async request" >&2
+		exit 1
+	fi
+
+	# Verify the contents are what we expect.
+	if ! diff -q "$FW" /dev/test_firmware >/dev/null ; then
+		echo "$0: firmware was not loaded (async)" >&2
+		exit 1
+	else
+		echo "$0: async filesystem loading works"
+	fi
 fi
 
 ### Batched requests tests
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
