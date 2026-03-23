Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5073B2FD2;
	Mon, 23 Mar 2026 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276788; cv=none; b=NpfnnAACSOLtjf/Pl5HcAdBoqvHXC5SUcEngZO8LhH5OdMzWXEebDPkapYMmPKJgMAq2ZYw5vcg7RDN21RP742ptbYtIBW18QCTbDxR44Q8BgVtIv61Hi4BvSWlMSwty/y4VkIdC+yanvdqdBK0L/B7jWjrA/jexE0gIQxjd98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276788; c=relaxed/simple;
	bh=n5PwD28reFcmNKZbHa+WcDYNkJJFYigMLc9GUuNvQoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDOSzbRgnmA2O7KyF1/vnsINQadHOx7EJqjt1n7WC7gaGhhFPix2sO58DZV7zQkJJMnwKkSdbj9xEKyT1y4LpgSEU4KSTql1g+aLUHpkEgF98ArFeNogz3HvTH3gngWJxlT3VeabLmULFOq5ETkIN44tnEgyK61ESXMjjDKrIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHdi+yDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHdi+yDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11551C2BCB3;
	Mon, 23 Mar 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276788;
	bh=n5PwD28reFcmNKZbHa+WcDYNkJJFYigMLc9GUuNvQoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KHdi+yDPZPtjtdi0FXUi5t8TmmndezAl94iseM5S9KbjW+5zaxuX4iLc/yHhkYe3c
	 he4h7LoOCv+2R1spJTagYTzgitExfSTFTrereoeWQudGbHiMW5WhRnYIh4qP5frc5T
	 QP/aUmEZ0dCbbhhZFvhXR6/n1ZxW2/G8NDzrQ/4s6p+cwx5kJGlPXfAkkft350BfJd
	 A8lKftExnUJzUX18h+D6TWjLC6/DHvGApiM9UTbEAcGxP6VBCtOMze6IAWFM13g03W
	 InXocLrRDfHxQkiKTKxy6Y7tK617gAgAifIN9j+9LhPRh/ETSNSOJR7vfaOlU46FIn
	 H16IRNlDnE8MA==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 23 Mar 2026 10:39:31 -0400
Subject: [PATCH v5 2/2] selftests/firmware: add search path test for
 firmware_class.search=
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-fw-path-v5-2-e88b2fe145f3@kernel.org>
References: <20260323-fw-path-v5-0-e88b2fe145f3@kernel.org>
In-Reply-To: <20260323-fw-path-v5-0-e88b2fe145f3@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8673; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=n5PwD28reFcmNKZbHa+WcDYNkJJFYigMLc9GUuNvQoo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpwVCw0z/5NmzSwuIaro5cjgT/gp3IrKZovUXg2
 KuWBdfCRX+JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCacFQsAAKCRAADmhBGVaC
 FbzqD/wIzKybdMPw/v1PTnI5rKcO+zEn60Hu5dJW2WpTGvULkVh3UVjPlW5PCDjxLlCRgjSNuWb
 F4rQ9NsVJIOOJ0HkxY8apCJnrctDhaOG1VVUqbxCc5u/JSYRZ/gBY8QjOQhf13wQAnLLRVCwl2Y
 gFxZvO6ZDxx3sv0HYaa4skQs+gd0+mRUoX8J8/ADvN11U23D7zszdJVD5O3vOBG5KG1Led7qX3k
 zgOwHD6eWRnadGp7KmQyVImZnRelLLc5M5bWVAMDvrN30xeq02UYEcM+phiVkc6yhZkqZRNpode
 KfZAsL6DOzCbAlmt5cyiV7cSqcKM4+3eB7n2LcK6i46C7uv3bL0vpS9pEm1KCnXtxjbvzpao6Se
 SedM5oNmmQzk2MNaTpNa5+6TeOnHlai68Hh1JFgRHI94Ui/qZWC22hvGwFMBUmOyH7AWS3UgMGZ
 SqEfjgVEIXD1ergrZVJ2qEWGwzAheVH0ZnYfYo/JnauQD76mMrqEfjYM1NK+/cnExP4B+CBICKM
 IvhaJ3LqDwFIb8W+RlieMG9GPc1JlmPhuFkJsPMSoZVCbBMbJM+cRQUgHv3frd2S93MeM4oOuVC
 cCg0CBAO/evHd7q8FQWjUDEGT+b+L1+x6wbhdMFcqVvp4HeYmmwElNiWWYOWOy5CJ6bV+OszhLh
 pfpBLu7AJ8l1vGQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Add fw_search.sh, a new selftest that validates the firmware_class.search=
module parameter using the existing test_firmware module's sysfs trigger
interface.

The test covers:
  - Firmware found in first/second/third search directory
  - Firmware not found in any search path
  - path= takes priority over search=
  - Empty search= does not break firmware loading
  - Sysfs readback matches what was written
  - Escaped colon (\:) in directory name
  - Escaped backslash (\\) in directory name
  - Escaped colon combined with multiple search paths

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 222 ++++++++++++++++++++++++++
 2 files changed, 223 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/Makefile b/tools/testing/selftests/firmware/Makefile
index 7992969deaa2737ff2a033ffe60136b84ea2f3f0..42e5bd72886b3cd8f62ae42d53c1554e8a1b331c 100644
--- a/tools/testing/selftests/firmware/Makefile
+++ b/tools/testing/selftests/firmware/Makefile
@@ -3,7 +3,7 @@
 CFLAGS = -Wall \
          -O2
 
-TEST_PROGS := fw_run_tests.sh
+TEST_PROGS := fw_run_tests.sh fw_search.sh
 TEST_FILES := fw_fallback.sh fw_filesystem.sh fw_upload.sh fw_lib.sh
 TEST_GEN_FILES := fw_namespace
 
diff --git a/tools/testing/selftests/firmware/fw_search.sh b/tools/testing/selftests/firmware/fw_search.sh
new file mode 100755
index 0000000000000000000000000000000000000000..ec6873e54a4cc381771311be11203083b2531bf6
--- /dev/null
+++ b/tools/testing/selftests/firmware/fw_search.sh
@@ -0,0 +1,222 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test the firmware_class.search= module parameter, which allows
+# specifying multiple colon-separated firmware search directories.
+
+set -e
+
+TEST_REQS_FW_SYSFS_FALLBACK="no"
+TEST_REQS_FW_SET_CUSTOM_PATH="no"
+TEST_DIR=$(dirname $0)
+source $TEST_DIR/fw_lib.sh
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+SEARCH_SYSFS="/sys/module/firmware_class/parameters/search"
+PATH_SYSFS="/sys/module/firmware_class/parameters/path"
+
+check_mods
+check_setup
+verify_reqs
+
+if [ ! -f "$SEARCH_SYSFS" ]; then
+	echo "$0: search= parameter not available, skipping"
+	exit $ksft_skip
+fi
+
+# Save original values
+OLD_SEARCH="$(cat $SEARCH_SYSFS)"
+OLD_PATH="$(cat $PATH_SYSFS)"
+
+# Create temp directories for firmware
+FWDIR1=$(mktemp -d)
+FWDIR2=$(mktemp -d)
+FWDIR3=$(mktemp -d)
+
+FW_NAME="test-search-fw.bin"
+FW_CONTENT1="SEARCH_PATH_1"
+FW_CONTENT2="SEARCH_PATH_2"
+FW_CONTENT3="SEARCH_PATH_3"
+
+DIR=/sys/devices/virtual/misc/test_firmware
+
+cleanup()
+{
+	# Restore original values
+	if [ "$OLD_PATH" = "" ]; then
+		printf '\000' >$PATH_SYSFS
+	else
+		echo -n "$OLD_PATH" >$PATH_SYSFS
+	fi
+	if [ "$OLD_SEARCH" = "" ]; then
+		printf '\000' >$SEARCH_SYSFS
+	else
+		echo -n "$OLD_SEARCH" >$SEARCH_SYSFS
+	fi
+	rm -rf "$FWDIR1" "$FWDIR2" "$FWDIR3"
+}
+trap cleanup EXIT
+
+# Clear path= so search= is consulted
+printf '\000' >$PATH_SYSFS
+
+# Test 1: firmware found in first search path
+echo -n "$FW_CONTENT1" >"$FWDIR1/$FW_NAME"
+echo -n "$FWDIR1:$FWDIR2" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 1" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR1/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 1" >&2
+	exit 1
+fi
+echo "$0: search path - first directory: OK"
+
+# Test 2: firmware found in second search path (not in first)
+rm -f "$FWDIR1/$FW_NAME"
+echo -n "$FW_CONTENT2" >"$FWDIR2/$FW_NAME"
+echo -n "$FWDIR1:$FWDIR2" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 2" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR2/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 2" >&2
+	exit 1
+fi
+echo "$0: search path - second directory: OK"
+
+# Test 3: firmware not found in any search path
+rm -f "$FWDIR2/$FW_NAME"
+echo -n "$FWDIR1:$FWDIR2" >$SEARCH_SYSFS
+
+if echo -n "nonexistent-$FW_NAME" >$DIR/trigger_request 2>/dev/null; then
+	echo "$0: FAIL - firmware should not have been found in test 3" >&2
+	exit 1
+fi
+echo "$0: search path - not found: OK"
+
+# Test 4: path= takes priority over search=
+echo -n "$FW_CONTENT1" >"$FWDIR1/$FW_NAME"
+echo -n "$FW_CONTENT2" >"$FWDIR2/$FW_NAME"
+echo -n "$FWDIR1" >$PATH_SYSFS
+echo -n "$FWDIR2" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 4" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR1/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - path= should take priority over search= in test 4" >&2
+	exit 1
+fi
+echo "$0: search path - path= priority over search=: OK"
+
+# Clear path= again for remaining tests
+printf '\000' >$PATH_SYSFS
+
+# Test 5: three search paths, firmware in third
+rm -f "$FWDIR1/$FW_NAME" "$FWDIR2/$FW_NAME"
+echo -n "$FW_CONTENT3" >"$FWDIR3/$FW_NAME"
+echo -n "$FWDIR1:$FWDIR2:$FWDIR3" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 5" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR3/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 5" >&2
+	exit 1
+fi
+echo "$0: search path - third directory: OK"
+
+# Test 6: empty search= should not break anything
+rm -f "$FWDIR3/$FW_NAME"
+printf '\000' >$SEARCH_SYSFS
+
+if echo -n "nonexistent-$FW_NAME" >$DIR/trigger_request 2>/dev/null; then
+	echo "$0: FAIL - empty search= should not find firmware" >&2
+	exit 1
+fi
+echo "$0: search path - empty search=: OK"
+
+# Test 7: verify sysfs readback matches what was written
+echo -n "$FWDIR1:$FWDIR2:$FWDIR3" >$SEARCH_SYSFS
+READBACK="$(cat $SEARCH_SYSFS)"
+EXPECTED="$FWDIR1:$FWDIR2:$FWDIR3"
+if [ "$READBACK" != "$EXPECTED" ]; then
+	echo "$0: FAIL - sysfs readback mismatch: '$READBACK' != '$EXPECTED'" >&2
+	exit 1
+fi
+echo "$0: search path - sysfs readback: OK"
+
+# Test 8: escaped colon in directory name (\: -> literal ':')
+FWDIR_COLON=$(mktemp -d)/fw:dir
+mkdir -p "$FWDIR_COLON"
+echo -n "$FW_CONTENT1" >"$FWDIR_COLON/$FW_NAME"
+# Write the path with the colon escaped as \:
+ESCAPED_COLON="${FWDIR_COLON//:/\\:}"
+echo -n "$ESCAPED_COLON" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 8" >&2
+	rm -rf "$(dirname "$FWDIR_COLON")"
+	exit 1
+fi
+if ! diff -q "$FWDIR_COLON/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 8" >&2
+	rm -rf "$(dirname "$FWDIR_COLON")"
+	exit 1
+fi
+rm -rf "$(dirname "$FWDIR_COLON")"
+echo "$0: search path - escaped colon in directory: OK"
+
+# Test 9: escaped backslash in directory name (\\ -> literal '\')
+FWDIR_BS=$(mktemp -d)/fw\\dir
+mkdir -p "$FWDIR_BS"
+echo -n "$FW_CONTENT2" >"$FWDIR_BS/$FW_NAME"
+# Write the path with backslashes escaped as \\
+ESCAPED_BS="${FWDIR_BS//\\/\\\\}"
+echo -n "$ESCAPED_BS" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 9" >&2
+	rm -rf "$(dirname "$FWDIR_BS")"
+	exit 1
+fi
+if ! diff -q "$FWDIR_BS/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 9" >&2
+	rm -rf "$(dirname "$FWDIR_BS")"
+	exit 1
+fi
+rm -rf "$(dirname "$FWDIR_BS")"
+echo "$0: search path - escaped backslash in directory: OK"
+
+# Test 10: escaped colon with multiple search paths
+FWDIR_COLON2=$(mktemp -d)/has:colon
+mkdir -p "$FWDIR_COLON2"
+echo -n "$FW_CONTENT3" >"$FWDIR_COLON2/$FW_NAME"
+ESCAPED_COLON2="${FWDIR_COLON2//:/\\:}"
+# First path is normal (no firmware), second has escaped colon (has firmware)
+echo -n "$FWDIR1:$ESCAPED_COLON2" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 10" >&2
+	rm -rf "$(dirname "$FWDIR_COLON2")"
+	exit 1
+fi
+if ! diff -q "$FWDIR_COLON2/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 10" >&2
+	rm -rf "$(dirname "$FWDIR_COLON2")"
+	exit 1
+fi
+rm -rf "$(dirname "$FWDIR_COLON2")"
+echo "$0: search path - escaped colon with multiple paths: OK"
+
+echo "$0: all search path tests passed"
+exit 0

-- 
2.53.0

