Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211943CEFC;
	Wed,  1 Apr 2026 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051024; cv=none; b=YJHv889rIzjRsMZ9Sc6oAWnfbcYKzVBQGJUIzO3ioOKEihxOdlBye4uVc5OuSx63RPpmJ+beidm/U+N7hU/KF0UW6qngVBBtU55oecMFNtfF6H6J4cwCBJWitkJ0gXcXeKGq9zqLKoO1aPykmpU4Wcv4IPh4DLAn3iVQfMNm0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051024; c=relaxed/simple;
	bh=h2TewXUFQQoABq7Mcj2uXgEyBXVxKvWZj5vOBtLRV2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTVsEgLu7IZH1YH3ZgzKAdvClSgwyuUW0eK/RzESf7gJC+zXAR5M654qkf65ROBgnZ2PDYidXMUp1aoDLvYH77/F41LoCXNLh+DYErMd2bhj2/XtaYb0dJTr3eTaB1J9xD1ZjFQlGYmMyYrGR6EUEaGbW1y76O+mDciPuh75JbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT0kSFU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT0kSFU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D8DC116C6;
	Wed,  1 Apr 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775051024;
	bh=h2TewXUFQQoABq7Mcj2uXgEyBXVxKvWZj5vOBtLRV2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IT0kSFU7KN6VScYi/y2Iy6qWbxAQRenSY6Ulrm1cCBCH9whcctI76yfL74TwR6eFu
	 X8mcFACsfdPQ+x47dEIfpA3LwTXb9NpQlK9IV8BIK74kTVoUVkIr9gN3BVzKVbFMC+
	 4O/C+TPJPRqFcWyk2raq5vTkSNRGafBT9KsX6iLMckw4XpnVEB5H8BhKD894rHgvOS
	 8jp0ldZ2PKFmODKH3vsQlsTf+pyLs8RjyRjGERHdstxVktgxBXiRlzJ0OZoTqLqgVS
	 LgW+3pMYfQBvnSC67wPYPIxpqPn5GJGPyVjZhOhK1b1uqg0Ksowr+pTFSafdQpXljG
	 2UnyD00UrNP3Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 01 Apr 2026 09:43:28 -0400
Subject: [PATCH v6 2/2] selftests/firmware: add search path test for
 firmware_class.search_path=
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fw-path-v6-2-4ebe70441839@kernel.org>
References: <20260401-fw-path-v6-0-4ebe70441839@kernel.org>
In-Reply-To: <20260401-fw-path-v6-0-4ebe70441839@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8738; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=h2TewXUFQQoABq7Mcj2uXgEyBXVxKvWZj5vOBtLRV2k=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpzSEMjKW4fxN17my8115BZwXcHgtD6TQboZG08
 ekhjl+I/3iJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCac0hDAAKCRAADmhBGVaC
 FbgiD/9Anx+uuXq/swZP21KphdoVsfz8wm+Bb2ABCQdYXlVz28TsB7cYxXcxQypRlcZBd433NRJ
 E1+aZaEj9QP0bn8WNA5HXOR2lgtzuQJXewNVMgogtOicXb8ylIlm/UCpLAfIJu208F9bOn46FtS
 qqRkiOZUsISPPkGaLBOr8z3qYgk7STfFa6/lyWF8Rb7xkTTlXtvNrxA5nnLiB3Pbg8g3O/a7PyL
 Hh2mtz/d5wMqYwzFJLOGhq13w1vEBbAP88btxiqnguS9gugkZWux+sLGRByJCU8EbMuNcZV54lI
 tfVPcjQAydfqNIC+MW0ShwUVMO0KWipXfhFI0iWcfWjqxkhdyQMmdCQNMZV+/oRaAjabjjC0Yr0
 trAVvUjHFD07tffzr10iQlc3veZ9E0ugyJOG5QZKiOGavekyDwccHi/L8dNVzvWO8OCDmNtaP5o
 jpO31D4R8DLE34eXkCHLcmkRn2+zQyGcOQ+dL96pTLaoQL7lWb7sZJr8tZ33b3JBwMxUzFdOkbU
 8dn4Msr50rWrqzMwvk5EQsbiXxOyuABBTvfhzEGKWSi+mqEzZiK6zty6nmXgcGdrhSG1SAX5EUS
 rZYFmTmsT1LnyrdelID75/ZAhDHMS8r3rxEegLnLQ3myso567o2ClwhOlLijpGSX7SiN/Ojd/oZ
 0fZmnoZzmsLRhmA==
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
index 0000000000000000000000000000000000000000..19a23284c31104c3bad3044a910c50aa71a2a766
--- /dev/null
+++ b/tools/testing/selftests/firmware/fw_search.sh
@@ -0,0 +1,222 @@
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

