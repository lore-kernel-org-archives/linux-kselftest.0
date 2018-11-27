From: dan.rue at linaro.org (Dan Rue)
Date: Mon, 26 Nov 2018 21:12:15 -0600
Subject: [PATCH 1/2] selftests: firmware: remove use of non-standard diff -Z
 option
In-Reply-To: <20181127031218.24419-1-dan.rue@linaro.org>
References: <20181127031218.24419-1-dan.rue@linaro.org>
Message-ID: <20181127031218.24419-2-dan.rue@linaro.org>

diff -Z is used to trim the trailing whitespace when comparing the
loaded firmware file with the source firmware file. However, per the
comment in the source code, -Z should not be necessary. In testing, the
input and output files are identical.

Additionally, -Z is not a standard option and is not available in
environments such as busybox. When -Z is not supported, diff fails with
a usage error, which is suppressed, but then causes read_firmwares() to
exit with a false failure message.

Signed-off-by: Dan Rue <dan.rue at linaro.org>
---
 tools/testing/selftests/firmware/fw_filesystem.sh | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
index a4320c4b44dc..466cf2f91ba0 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -155,11 +155,8 @@ read_firmwares()
 {
 	for i in $(seq 0 3); do
 		config_set_read_fw_idx $i
-		# Verify the contents are what we expect.
-		# -Z required for now -- check for yourself, md5sum
-		# on $FW and DIR/read_firmware will yield the same. Even
-		# cmp agrees, so something is off.
-		if ! diff -q -Z "$FW" $DIR/read_firmware 2>/dev/null ; then
+		# Verify the contents match
+		if ! diff -q "$FW" $DIR/read_firmware 2>/dev/null ; then
 			echo "request #$i: firmware was not loaded" >&2
 			exit 1
 		fi
@@ -171,7 +168,7 @@ read_firmwares_expect_nofile()
 	for i in $(seq 0 3); do
 		config_set_read_fw_idx $i
 		# Ensures contents differ
-		if diff -q -Z "$FW" $DIR/read_firmware 2>/dev/null ; then
+		if diff -q "$FW" $DIR/read_firmware 2>/dev/null ; then
 			echo "request $i: file was not expected to match" >&2
 			exit 1
 		fi
-- 
2.19.1
