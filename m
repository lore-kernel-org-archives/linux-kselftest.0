Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A434CDD
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771906258; cv=none; b=oiw7FGpb0yUobuF3OiwECZVpO5pvw+IMnc1SdZcWdd7kH7bqXWqDTS2OS32M82yeHvPWNjbFkUdMxXEaJiFgwg7ym9VorvAF4TNt4ptzIu6+pdkMFpbZITXPmKbs1ceOKQy6lm9EA+KIVhl80/YdI9QQQX1jQF2EgnIFyoxfe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771906258; c=relaxed/simple;
	bh=zr/bcPLe9uouP9PwhEMP3/FpLnN/SDUM8I/Wgd6JTyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gvtAEXV9uFQ0Ile6DprPcKwlPnkPwHwFVHt/hrjEv7RSaeew1kqy1pvNX+2/YoWK3gNHpul2XcoEHLxKyugfIVor4HYauxdYo0wDNoOyeQ1Fv0ZyikboH5OyHEGFkOc2R8R55KtGO1oHjoIbcWVjIDrKyocc6aXqJUDDC3Fsuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxzOOOpZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxzOOOpZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82418b0178cso2989319b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 20:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771906255; x=1772511055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqIkKFYUe31rOenAwyRKOQnlZ80WMkRSpxM9YLiUBz4=;
        b=bxzOOOpZz9OV6PHI1npCzI57IpoYZ7tcV+6S4kDcDj//dtb0foO+878lWdzbjYi/BL
         PGtfcJLL2WyeBgpC/eGxA8uPd6uENzQ2hRP9t63FJzwdoq6CkS8eqhTxW6D6xSqJfDEi
         AfNV/SPo33Mg0BpP1Ntrvk/X2bpsTgIRp0BaK9j70CMNH2zoVJZANJXGItobLlqUMh+E
         wQ8dg5B1E6GhgMTwcrF77NQGdIA7haHAPDTINnUIS6+k9tWlAgq2D+v/Ehbj4Sc4NrgM
         Gb4uZNpPr1igE6zEftWMGUK0J9oAiJ3lbwF/4wcv39ghUGKzcGy7UroTIs624yFwaKu2
         S6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771906255; x=1772511055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqIkKFYUe31rOenAwyRKOQnlZ80WMkRSpxM9YLiUBz4=;
        b=ZPUHAk6fa7757x3gDhCnxxN86g0iRMOejlrSGlHNo+ux6L4WvvZPH8ayLWGXA/xZCi
         J9NG4Eqf5TQPhpGt4UoQpXd+JqINL++0glBfcMO+RkoxV5BTStGJ4AHGGCN0GIViGzp9
         UmE+AAr4ib3dC+bk6tLt6JZRoAwdbGqRSeWhPN+L06iV/62+VwN9bHcjqR+HnY9VRVmi
         oMhR2ebeLdOVj0UBUCwzvVMa8IGfLYpQWbtGHnQKn3mVx+8Q7TfabT7JqMaZCtlW2crm
         SLk5iI1/MOQ0wBTgLqZQNAyxWPYOzBg9GHgvnt98fqRQJqCXC9oGwu8BD32ZLb9wBTaP
         xy9g==
X-Gm-Message-State: AOJu0YzSc/UPIwDo6zhbS5YWiYpBLwbZtWQfKHLPstTo5YwatYe2GnaW
	JdWRpJT2QUx0GQqyuR/ZH/IeIinRMQU+kf3eFCP0zTz7k4FETTrk/nU4kzqfC2oQ
X-Gm-Gg: ATEYQzwzVdMcWFMwD3tpbMcJ0evw115GZ7KAkXT2DSwXp+oFXMnkliAjZ+iNdP5J9Qp
	wXfNe1i+NJ7uFYskpdIU+kfF6uNxHk4Hi0Y1MmWpN6yZ71YYu147kKpBeC7LX2FN29HDTTEHh+i
	ff00F3xXlR26j10ciwczf461atsIaPn9w7WgOC7lyLrIqmWUUQpVOMWTlqbgjpIyZZ4TcjIhTnZ
	VEnl/xCn8/L2VDwRX48pp3olg1JN87TlzNnFaf/2jaCPCUnJtyqfA0e69yuBh9mqFmbxRfHglgd
	VLvN1xfvzdjL7FRAKBW1g8W0GHDTGnPa9dbTl9LCCMDNWk1UfLdM4KTEJ3+TqSHZj7u5N+xJVLz
	E09uw2xI6u7D21ME7Unl0ZMRX68D/rCZhjh+Y25y9WRbUN5hm8AhAuCvTPEAb+FY1J9QIYyx8tZ
	FZTOsnfJbjCVbf5IF1gM4GaIL0bTw=
X-Received: by 2002:a05:6a00:1f04:b0:824:a1c9:8a30 with SMTP id d2e1a72fcca58-826da907819mr8290551b3a.23.1771906255350;
        Mon, 23 Feb 2026 20:10:55 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd63f1b3sm8805002b3a.3.2026.02.23.20.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:10:54 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	netdev@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv2] selftests: Use ktap helpers for runner.sh
Date: Tue, 24 Feb 2026 04:10:48 +0000
Message-ID: <20260224041048.6570-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of manually writing ktap messages, we should use the formal
ktap helpers in runner.sh. Brendan did some work in d9e6269e3303
("selftests/run_kselftest.sh: exit with error if tests fail") to make
run_kselftest.sh exit with the correct return value. However, the output
does not include the total results, such as how many tests passed or
failed.

Let’s convert all manually printed messages in runner.sh to use the
formal ktap helpers. Here are what I changed:

  1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
     is the only caller of run_many().
  2. In run_kselftest.sh, call run_many() in main process to count the
     pass/fail numbers.
  3. In run_kselftest.sh, do not generate kselftest_failures_file. Just
     use ktap_print_totals to report the result.
  4. In runner.sh run_one(), get the return value and use ktap helpers for
     all pass/fail reporting. This allows counting pass/fail numbers in the
     main process.
  5. In runner.sh run_in_netns(), also return the correct rc, so we can
     count results during wait.

After the change, the printed result looks like:

  not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=1
  # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0

  ]# echo $?
  1

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---

v2: Update commit description and comments in code. (Brendan Jackman)

---
 tools/testing/selftests/kselftest/runner.sh | 84 ++++++++++++---------
 tools/testing/selftests/run_kselftest.sh    | 21 ++++--
 2 files changed, 63 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..dfd6fedf8911 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -1,8 +1,8 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 #
 # Runs a set of tests in a given subdirectory.
-export skip_rc=4
+. $(dirname "$(readlink -e "${BASH_SOURCE[0]}")")/ktap_helpers.sh
 export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
@@ -44,17 +44,11 @@ tap_timeout()
 	fi
 }
 
-report_failure()
-{
-	echo "not ok $*"
-	echo "$*" >> "$kselftest_failures_file"
-}
-
 run_one()
 {
 	DIR="$1"
 	TEST="$2"
-	local test_num="$3"
+	local rc test_num="$3"
 
 	BASENAME_TEST=$(basename $TEST)
 
@@ -102,16 +96,17 @@ run_one()
 	# Command line timeout overrides the settings file
 	if [ -n "$kselftest_override_timeout" ]; then
 		kselftest_timeout="$kselftest_override_timeout"
-		echo "# overriding timeout to $kselftest_timeout" >> "$logfile"
+		ktap_print_msg "overriding timeout to $kselftest_timeout" >> "$logfile"
 	else
-		echo "# timeout set to $kselftest_timeout" >> "$logfile"
+		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
 	fi
 
 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
 	echo "# $TEST_HDR_MSG"
 	if [ ! -e "$TEST" ]; then
-		echo "# Warning: file $TEST is missing!"
-		report_failure "$test_num $TEST_HDR_MSG"
+		ktap_print_msg "Warning: file $TEST is missing!"
+		ktap_test_fail "$test_num $TEST_HDR_MSG"
+		rc=$KSFT_FAIL
 	else
 		if [ -x /usr/bin/stdbuf ]; then
 			stdbuf="/usr/bin/stdbuf --output=L "
@@ -122,33 +117,37 @@ run_one()
 		elif [ -x "./ksft_runner.sh" ]; then
 			cmd="$stdbuf ./ksft_runner.sh ./$BASENAME_TEST"
 		else
-			echo "# Warning: file $TEST is not executable"
+			ktap_print_msg "Warning: file $TEST is not executable"
 
 			if [ $(head -n 1 "$TEST" | cut -c -2) = "#!" ]
 			then
 				interpreter=$(head -n 1 "$TEST" | cut -c 3-)
 				cmd="$stdbuf $interpreter ./$BASENAME_TEST"
 			else
-				report_failure "$test_num $TEST_HDR_MSG"
-				return
+				ktap_test_fail "$test_num $TEST_HDR_MSG"
+				return $KSFT_FAIL
 			fi
 		fi
 		cd `dirname $TEST` > /dev/null
-		((((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
+		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
-			(read xs; exit $xs)) 4>>"$logfile" &&
-		echo "ok $test_num $TEST_HDR_MSG") ||
-		(rc=$?;	\
-		if [ $rc -eq $skip_rc ]; then	\
-			echo "ok $test_num $TEST_HDR_MSG # SKIP"
-		elif [ $rc -eq $timeout_rc ]; then \
-			echo "#"
-			report_failure "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds"
+			(read xs; exit $xs)) 4>>"$logfile"
+		rc=$?
+		if [ "$rc" -eq "$KSFT_PASS" ]; then
+			ktap_test_pass "$test_num $TEST_HDR_MSG"
+		elif [ "$rc" -eq "$KSFT_SKIP" ]; then
+			ktap_test_skip "$test_num $TEST_HDR_MSG"
+		elif [ "$rc" -eq "$KSFT_XFAIL" ]; then
+			ktap_test_xfail "$test_num $TEST_HDR_MSG"
+		elif [ "$rc" -eq "$timeout_rc" ]; then
+			ktap_test_fail "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds"
 		else
-			report_failure "$test_num $TEST_HDR_MSG # exit=$rc"
-		fi)
+			ktap_test_fail "$test_num $TEST_HDR_MSG # exit=$rc"
+		fi
 		cd - >/dev/null
 	fi
+
+	return $rc
 }
 
 in_netns()
@@ -164,27 +163,34 @@ in_netns()
 
 run_in_netns()
 {
-	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
 	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
+	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
+	local rc
+
 	ip netns add $netns
 	if [ $? -ne 0 ]; then
-		echo "# Warning: Create namespace failed for $BASENAME_TEST"
-		echo "not ok $test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
+		ktap_print_msg "Warning: Create namespace failed for $BASENAME_TEST"
+		ktap_test_fail "$test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
 	fi
 	ip -n $netns link set lo up
+
 	in_netns $netns &> $tmplog
+	rc=$?
+
 	ip netns del $netns &> /dev/null
+	# Cat the log at once to avoid parallel netns logs.
 	cat $tmplog
 	rm -f $tmplog
+	return $rc
 }
 
 run_many()
 {
-	echo "TAP version 13"
 	DIR="${PWD#${BASE_DIR}/}"
 	test_num=0
-	total=$(echo "$@" | wc -w)
-	echo "1..$total"
+	local rc
+	pids=()
+
 	for TEST in "$@"; do
 		BASENAME_TEST=$(basename $TEST)
 		test_num=$(( test_num + 1 ))
@@ -194,10 +200,20 @@ run_many()
 		fi
 		if [ -n "$RUN_IN_NETNS" ]; then
 			run_in_netns &
+			pids+=($!)
 		else
 			run_one "$DIR" "$TEST" "$test_num"
 		fi
 	done
 
-	wait
+	# These variables are outputs of ktap_helpers.sh but since we've
+	# run the test in a subprocess we need to update them manually
+	for pid in "${pids[@]}"; do
+		wait "$pid"
+		rc=$?
+		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=$((KTAP_CNT_PASS+1))
+		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=$((KTAP_CNT_FAIL+1))
+		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=$((KTAP_CNT_SKIP+1))
+		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=$((KTAP_CNT_XFAIL+1))
+	done
 }
diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 84d45254675c..3ffd03f1334d 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -121,18 +121,23 @@ if [ -n "$SKIP" ]; then
 	done
 fi
 
-kselftest_failures_file="$(mktemp --tmpdir kselftest-failures-XXXXXX)"
-export kselftest_failures_file
-
+curdir=$(pwd)
+total=$(echo "$available" | wc -w)
 collections=$(echo "$available" | cut -d: -f1 | sort | uniq)
+
+ktap_print_header
+ktap_set_plan "$total"
+
 for collection in $collections ; do
 	[ -w /dev/kmsg ] && echo "kselftest: Running tests in $collection" >> /dev/kmsg
 	tests=$(echo "$available" | grep "^$collection:" | cut -d: -f2)
-	($dryrun cd "$collection" && $dryrun run_many $tests)
+	$dryrun cd "$collection" && $dryrun run_many $tests
+	$dryrun cd "$curdir"
 done
 
-failures="$(cat "$kselftest_failures_file")"
-rm "$kselftest_failures_file"
-if "$ERROR_ON_FAIL" && [ "$failures" ]; then
-	exit 1
+ktap_print_totals
+if "$ERROR_ON_FAIL" && [ "$KTAP_CNT_FAIL" -ne 0 ]; then
+	exit "$KSFT_FAIL"
+else
+	exit "$KSFT_PASS"
 fi
-- 
2.50.1

