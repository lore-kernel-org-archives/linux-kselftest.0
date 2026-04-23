Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002C3AE18D;
	Thu, 23 Apr 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776968225; cv=none; b=IiZt3MG1pyZO95cDPGAesiEjnp/7ihdX5NCXMEwejAEKl1DTszKk9Duv2bnnIag5J1n9ksL2n1DYSSFLFMId+sORm/Oai2lbwpet3DT7W1/Wcs0rvsiZDrrMVpM3Ke4IO5Gaj8SfxCCpaRGK+nKi+A/MgMNKeitRgk/MJw6w4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776968225; c=relaxed/simple;
	bh=4qOvlqDrSm+dvoL6iDnG+QpMSyleWwbtfWjbjXM+F+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRGxEuLIRr1L6Nb7mng3lo2Zvqf07vv5QIEDFt+nfeCjR3NuYF2pjVCY/gGvaU3GQJUbX8sEptOhrlkMS/NFuLfGhph7D7WurXxO7LpakAArM/jBD1bC2XX5Tl8WR7d5WX/lqxrejZs6DvNV03WaxyaEK38LmJn49W0CPtiUWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr4pw0v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr4pw0v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC1BC2BCB4;
	Thu, 23 Apr 2026 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776968224;
	bh=4qOvlqDrSm+dvoL6iDnG+QpMSyleWwbtfWjbjXM+F+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jr4pw0v7d+Hipr7bpk8MOIqOtWF+6E5tWJWyW+cV8r34U2jOKJdzIonnF3XdsMKVZ
	 u3FrfTZ/+NWUBx4WZokhoPZR5yAffiN3YJCLuKGzwg5NTmNIlSbSvMss978tr0r0p9
	 yVMSds/4imnEYq3RbmaRahiwFnEmsM5tBHL42n8o/gzEa4wG/ZlWCTtfP20u1vpbBb
	 yIb95qaMZfe3uQnbSDNqrD72WsdhylY6NSHF1qBGD+flyCq+o//A7Es+IIVaMby0pb
	 XOwSgAhlbAV8N7korZoBWcYpkdKBBnOcQ3OxeRDvYi6tZcbX7yCgX5Jsl17v/u3H70
	 RjJfJhUwQp6iw==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 23 Apr 2026 14:16:45 -0400
Subject: [PATCH v8 2/2] selftests/firmware: add search path test for
 firmware_class.search_path=
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-fw-path-v8-2-9426735330eb@kernel.org>
References: <20260423-fw-path-v8-0-9426735330eb@kernel.org>
In-Reply-To: <20260423-fw-path-v8-0-9426735330eb@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8166; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=4qOvlqDrSm+dvoL6iDnG+QpMSyleWwbtfWjbjXM+F+8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBp6mIcb05vnjEZJ1xQunv1Jja5Go+Fo+8YMQDvF
 tdx6Oecyh6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaepiHAAKCRAADmhBGVaC
 FVe2EACn5QdGJibYnvSqikc6jf87wOUkHc4KlxQ9SGlwxn22T4h5A05gW4wh1dVmZgLcF/gauYU
 IHk5xbLqFBZqInIEWVQO5gLNNmBBqZvUVZxUv0/ERfKoLKfmjkUKjlRgtliq7sW8inCahyRl5HM
 V/OUe8mv0b5wAC3K906k+/bpk9biiRcYPg7dDwxlYCcI2HULscMpAH2Mi7a9XkMY880HSsP15h8
 eNkoIRnOIkLMztYfdmO2pJHfL937Ur4uQahsEd3BNWtshxWDNvwa159DLPeQY35oFCkwCqAlf1g
 d1cvt80AixWDi75BYD6i54eW/lgEI1pLcZwDJ5zQ00tt4DtfATBvtBJVUQptlUIhWrEo5nFUfTf
 oFT80soFkuula0/K8KEB6yPekXo791JQkRbP5oWl1JleGPyHyorjfGYwdjCetsqM120AmkSIexv
 yXWd1DVk2lBX4bGFMJ2ffwCxJYEQYZdDvKiFKEgSyZuwCCUxN3IC01Dwkr7I4XJEapFhh96I+/I
 4FM1ABrw/Tw7gPFrXsBLkrAuGlPuVboyUUXTG7Yq9tVOu5XSoI4fjgf6Ge4fLN1zJH+7ye+lPg+
 vZqQIa4b8OvLCsH6nQDwCv2ZfjkkO7En1yyPKfqnfiOq9gW98nX+dKiJuvnyBtiEp+5aZckJXTO
 tPoWZWVWjMDG/Nw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Add fw_search.sh, a new selftest to validate the
firmware_class.search_path= module parameter. It covers multiple
scenarios including prioritized path ordering, empty paths, path=
priority over search_path=, sysfs readback, and escaped characters
(colons and backslashes in directory names).

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 217 ++++++++++++++++++++++++++
 2 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/Makefile b/tools/testing/selftests/firmware/Makefile
index 7992969deaa2..42e5bd72886b 100644
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
index 000000000000..c2e1415ac8db
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
+if echo -n "$FW_NAME" >$DIR/trigger_request 2>/dev/null; then
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
+if echo -n "$FW_NAME" >$DIR/trigger_request 2>/dev/null; then
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

