Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0636C9CC;
	Thu,  2 Apr 2026 19:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157799; cv=none; b=ltbyxjXgoWaoy1msICUjnqFm1tcJJREtlNP+3oQN7Sr2Ae56NuOND9ALkb4zLSrcjvnWFwNCnjRDl+n8YpbcmdXvb1xe2RrqbIJ0LldAXZJiS86kGht7rtl9WTNJOsybQQItdZpe+FGARNjWGpN5BNqzFoDBlJVdTtC1MOSSu5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157799; c=relaxed/simple;
	bh=CX5Zg8UaUOqAXyggxlY61Y+AHoFP7AKYXNrajI0glkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwUpFbOrCr45WUGyhclNuNbpUG60/FhDJrHzW92d1JdHqm1zcG7al+gpRf20G81R71GBOQrCVxe54plzzm4Wd3kjP27ZW5SGIJY87A6iUrqE5DQ0c1thUDQZwD4S6n8mKMxw4txLXoZ2c/AvJzm2A+J6m7At/27R1kn18ilsLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5Mq/uw3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5Mq/uw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A995BC2BC9E;
	Thu,  2 Apr 2026 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775157798;
	bh=CX5Zg8UaUOqAXyggxlY61Y+AHoFP7AKYXNrajI0glkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J5Mq/uw3rXDiTW0+ZAkNUTxlhx4xY68BKtIE43rpjTeMoQ5RACIhTKhAVJpc7Tcpu
	 Ld3NMo2/T7fI4CdkVXSri6q1m6t+bnAIPS5S/4nBK7ySkao4Gun0AbtjYNs/eW5Z1u
	 ZeDyA5pMNvo+s9/JBFYMt5GZjQbRH3TVEL+XMR47K3V9CdEtyiiY5ueCqdFhfGSphp
	 3AA0P1omyeOl4enFcPKODJCS9PF9/hGJ+IRKi+AEaoGCel9/Qh2olqQqHF5h+YLRnO
	 rilDtKLtx27RdfJhI7xDClxwApvKrQhOxX8BUuV9V61dd0BE+5URVCZxnn4z+SFrdQ
	 ns/GW+AsRtz8A==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 02 Apr 2026 15:23:09 -0400
Subject: [PATCH v7 2/2] selftests/firmware: add search path test for
 firmware_class.search_path=
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-fw-path-v7-2-5b7e9c41a8c0@kernel.org>
References: <20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org>
In-Reply-To: <20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8582; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=CX5Zg8UaUOqAXyggxlY61Y+AHoFP7AKYXNrajI0glkM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpzsIiHKnQ9whBItl0+oK+296WUjlITYfDG5uer
 sCurGUP8FyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCac7CIgAKCRAADmhBGVaC
 FfSCD/9H2AY08QY2WVut4A1X8nYzl+js5e1bgxQSQLbAJh9v0fjgBj6kRgShtOzRmJsdoFt2MSi
 NLqp93ZHB4ITdYcenovX5c3CamzsYvqraaA6UTnmDYS+buzgNFPx4V0wNVsNxnuuTBrFvoKEwdM
 I/s0BtKyqhYERbP72OVkrLWeBUIz/cVCXXGPEg5x6wsyBv0+75UXVSZeFyzm8jzQTqYgzG/VjO6
 Oq7Ge899GzeJlYyTeu3mXh9Kk6p9/zmQUsRSSlJUhzJ7PyEBtL3xEdKBryl8TkNeSP5JCBrSdQl
 oPP+yEyWVyTjXYSywWq2QBCC0tYdQvrNZaXYZV7ZDfWNNtl5Rfes82QHzoO2pdF/pV7sPGHBwLh
 +5veZwbVDvfrihQYzApJ2jvdMvH42CYBxczOlrtH2gcWkNHqEeJQk1is0FoY3Keri5c7csf9yW0
 z41dp1p/fRrxyzcaXHZqIP4XfNH1SUDjznFVjqVtZtXzB2Bev0BLQnxlqW4iZN1pT4q+wNsVGFQ
 QDBfH3JHmhUBzjQNtuHnCDFqqR3yTKHAq+i5amiyFWl2fLu1mc/pnzklevIZtUunvW2rifEWBfk
 gNc6E4Cha6hhywfon5vDqJxfZGWrdY9q+hAOudFF/CD0FgCN0gPQ2trS1IgMmu5A1zBfcL1wvhT
 JR/9ww76nEEcVyw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Add fw_search.sh, a new selftest that validates the firmware_class.search_path=
module parameter using the existing test_firmware module's sysfs trigger
interface.

The test covers:
  - Firmware found in first/second/third search directory
  - Firmware not found in any search path
  - path= takes priority over search_path=
  - Empty search_path= does not break firmware loading
  - Sysfs readback matches what was written
  - Escaped colon (\:) in directory name
  - Escaped backslash (\\) in directory name
  - Escaped colon combined with multiple search paths

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 217 ++++++++++++++++++++++++++
 2 files changed, 218 insertions(+), 1 deletion(-)

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
index 0000000000000000000000000000000000000000..9714e9c10c627fc710fb14e5b0ae70537bc78623
--- /dev/null
+++ b/tools/testing/selftests/firmware/fw_search.sh
@@ -0,0 +1,217 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test the firmware_class.search_path= module parameter, which allows
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
+SEARCH_SYSFS="/sys/module/firmware_class/parameters/search_path"
+PATH_SYSFS="/sys/module/firmware_class/parameters/path"
+
+check_mods
+check_setup
+verify_reqs
+
+if [ ! -f "$SEARCH_SYSFS" ]; then
+	echo "$0: search_path= parameter not available, skipping"
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
+FWDIR_COLON_BASE=$(mktemp -d)
+FWDIR_BS_BASE=$(mktemp -d)
+FWDIR_COLON2_BASE=$(mktemp -d)
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
+	rm -rf "$FWDIR1" "$FWDIR2" "$FWDIR3" \
+	       "$FWDIR_COLON_BASE" "$FWDIR_BS_BASE" "$FWDIR_COLON2_BASE"
+}
+trap cleanup EXIT
+
+# Clear path= so search_path= is consulted
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
+# Test 4: path= takes priority over search_path=
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
+	echo "$0: FAIL - path= should take priority over search_path= in test 4" >&2
+	exit 1
+fi
+echo "$0: search path - path= priority over search_path=: OK"
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
+# Test 6: empty search_path= should not break anything
+rm -f "$FWDIR3/$FW_NAME"
+printf '\000' >$SEARCH_SYSFS
+
+if echo -n "nonexistent-$FW_NAME" >$DIR/trigger_request 2>/dev/null; then
+	echo "$0: FAIL - empty search_path= should not find firmware" >&2
+	exit 1
+fi
+echo "$0: search path - empty search_path=: OK"
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
+FWDIR_COLON=$FWDIR_COLON_BASE/fw:dir
+mkdir -p "$FWDIR_COLON"
+echo -n "$FW_CONTENT1" >"$FWDIR_COLON/$FW_NAME"
+# Write the path with the colon escaped as \:
+ESCAPED_COLON="${FWDIR_COLON//:/\\:}"
+echo -n "$ESCAPED_COLON" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 8" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR_COLON/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 8" >&2
+	exit 1
+fi
+echo "$0: search path - escaped colon in directory: OK"
+
+# Test 9: escaped backslash in directory name (\\ -> literal '\')
+FWDIR_BS=$FWDIR_BS_BASE/fw\\dir
+mkdir -p "$FWDIR_BS"
+echo -n "$FW_CONTENT2" >"$FWDIR_BS/$FW_NAME"
+# Write the path with backslashes escaped as \\
+ESCAPED_BS="${FWDIR_BS//\\/\\\\}"
+echo -n "$ESCAPED_BS" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 9" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR_BS/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 9" >&2
+	exit 1
+fi
+echo "$0: search path - escaped backslash in directory: OK"
+
+# Test 10: escaped colon with multiple search paths
+FWDIR_COLON2=$FWDIR_COLON2_BASE/has:colon
+mkdir -p "$FWDIR_COLON2"
+echo -n "$FW_CONTENT3" >"$FWDIR_COLON2/$FW_NAME"
+ESCAPED_COLON2="${FWDIR_COLON2//:/\\:}"
+# First path is normal (no firmware), second has escaped colon (has firmware)
+echo -n "$FWDIR1:$ESCAPED_COLON2" >$SEARCH_SYSFS
+
+if ! echo -n "$FW_NAME" >$DIR/trigger_request; then
+	echo "$0: FAIL - could not trigger request for test 10" >&2
+	exit 1
+fi
+if ! diff -q "$FWDIR_COLON2/$FW_NAME" /dev/test_firmware >/dev/null; then
+	echo "$0: FAIL - firmware content mismatch in test 10" >&2
+	exit 1
+fi
+echo "$0: search path - escaped colon with multiple paths: OK"
+
+echo "$0: all search path tests passed"
+exit 0

-- 
2.53.0

