From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:09 -0600
Subject: [PATCH 05/24] selftests: efivarfs: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-5-shuah@kernel.org>

When efivarfs test is skipped because of unmet dependencies and/or
unsupported configuration, it returns 0 which is treated as a pass
by the Kselftest framework. This leads to false positive result even
when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index c6d5790575ae..a47029a799d2 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -4,18 +4,21 @@
 efivarfs_mount=/sys/firmware/efi/efivars
 test_guid=210be57c-9849-4fc7-a635-e6382d1aec27
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 check_prereqs()
 {
 	local msg="skip all tests:"
 
 	if [ $UID != 0 ]; then
 		echo $msg must be run as root >&2
-		exit 0
+		exit $ksft_skip
 	fi
 
 	if ! grep -q "^\S\+ $efivarfs_mount efivarfs" /proc/mounts; then
 		echo $msg efivarfs is not mounted on $efivarfs_mount >&2
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
