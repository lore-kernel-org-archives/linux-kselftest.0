Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DB126BF7
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981724; cv=none; b=TBMVgyjVx0c+No2i8NLtL3aNAZim6UemCACPw+2U5vihLPpcmEXSH1iTwTN+aJBWYolAN3JNLb2iMH171xvrM2HNjXyRE7SvD1R5x46xPiWCHttOyPCivtuhTGSXaUCIJ5pvpvhzsOgqq+8q85DWTaHTDgd7Fw0aTGyH+sg+tB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981724; c=relaxed/simple;
	bh=E7FMxqLmjEyzIyfwjcpWTYCc+mpqcO9KlrTNgbl8Iso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sYE/3qxg6X67+vS075S9KMwCEk1r/U61Uo6PewjC0ylGayUa4DS88W7LfcFIYS0a7ZHi/RZcQGNCxFTWsioQ50ejPBnDCHgZ+piSemrQ59iDTHd3IJoX81+RL/4khCXrL4qTS+Keul4DNLvWQ0pvfv5MYHuUIKzsm6I3LiW2G3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLzzmtip; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLzzmtip"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so6364717b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771981722; x=1772586522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=489ujtc+QjJVkqcIxKEJ3HrOo19m+cQ5DoTIRelqHg0=;
        b=WLzzmtip/GKgNMGMwQWHGmlx7BgiKtE0xoyAScy7YFdWvqefItygF7uW57rWv02BG6
         k+WmMBQXMaob5BXsBZBUfTzqJsOWQ7JzT1TIV2z7OPcrTcszLBDkP1tK2gq65qYAeMti
         XigeieqSpSmWUclNFiZRYJ01PMn524F6p+yxiiCNUIBUeycpRpsqc00A4IvoauWUI2jy
         Eb1fb0nmKikfk6rPYbKGK2KsyceHMW+74/4sSpA/8D3cSSL6zfKt+rkfFJjd1YCw3T7W
         JTRKhZeSfAp9srB3li41v5FQ/p0Gk0QcMvfrAszpetOWNz8OynO0ufoLgRuho2nt/LRv
         wPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771981722; x=1772586522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=489ujtc+QjJVkqcIxKEJ3HrOo19m+cQ5DoTIRelqHg0=;
        b=Ok9P9DoxrUNn3Tz9BXuaNK38NktRfjwGzQDhnSFBd7TARnHBaiCtCtTGdG3qeadwp/
         WgLioewBb4w7F53k0kglGBV+7wZoVigslIBJU1v0L36qgrkIhJF2n38rqBDHZ/V5qmIT
         SmGuTD5KjthhSbYvsG3GCMPf27YQSufwB49y8GJRmpPtPjwVTGkj2z+toNUkTSb98N0l
         EIfReQl8xUBH0A3UL9cdrugMJ6pS++HgnIQdTCo6bwVYi+/GaKO/Ka1MiQo0llrLomdL
         W5nuCYIhYHYX6lt3hiYA3WcBsm1jYdHbrGzxIl1HYr7fdqCT2KKOCAKerXUzWKAYVt6U
         iNeA==
X-Gm-Message-State: AOJu0YxaxM17xTqrlAHvJZCiiXBlw+a+P48q6aDSwWYM2L4YJiXafFCm
	kD0xjLAqhA7YfVvFn+ZRjSC/VjdsItjtbUozOQkXXckRwvUT0jHr3scoVCu3Z+XC
X-Gm-Gg: ATEYQzyzSh9yUoEtp8RGGAB+ZqOSiF3W8+7RE+KRLrYBD57S2fYvaJQbn+xdRjJY73s
	KfsQO092jekx5vQNdtu0IcTfxixlyEd7x0NpghF0RozFtQt4Txr2cieprw3gTwnQK+hS/imtCR8
	J+lpG6k66lCzJbx/1Fr9PmIOUWtkGPxM0ZCGEhQU8Mak0Mho2DJw8aFylpS2CtyRn8OiUmVVJgW
	3cLmj1Vr8isd/M1z6j39C2w3ckpfKNARgYmvXxfYtnkhsM746o5dUAzTZ/f9ZP5jXbjwyZxU/R2
	gS6Awi5/mEDMGSvnpKbdPgqNPWBZQziKdn2cYS7avt2YR30SzYgFeLJzyWmI2iobc+IrjEU9SDo
	oAefmHjXWFzn16KwnfKxcABBUv8DmG7RWqKmAGJ+8wy6HsBrrjz0ZLiKqeJjaZfsTdhj+thVIMV
	2uKkWONSKcKqEMLYlJ2uRWjsh6yYA=
X-Received: by 2002:a05:6a00:2d90:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82724af179emr445137b3a.50.1771981721821;
        Tue, 24 Feb 2026 17:08:41 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm12310369b3a.14.2026.02.24.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:08:40 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	netdev@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv3] selftests: Use ktap helpers for runner.sh
Date: Wed, 25 Feb 2026 01:08:33 +0000
Message-ID: <20260225010833.11301-1-liuhangbin@gmail.com>
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
does not include the total results, such as how many tests passed or failed.

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

Tested-by: Brendan Jackman <jackmanb@google.com>
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---

v3: use case instead of if/else for the rc checking (Brendan Jackman)
v2: Update commit description and comments in code (Brendan Jackman)

---
 tools/testing/selftests/kselftest/runner.sh | 95 +++++++++++++--------
 tools/testing/selftests/run_kselftest.sh    | 21 +++--
 2 files changed, 73 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..3eeec93c9da4 100644
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
@@ -122,33 +117,38 @@ run_one()
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
-		else
-			report_failure "$test_num $TEST_HDR_MSG # exit=$rc"
-		fi)
+			(read xs; exit $xs)) 4>>"$logfile"
+		rc=$?
+		case "$rc" in
+		"$KSFT_PASS")
+			ktap_test_pass "$test_num $TEST_HDR_MSG";;
+		"$KSFT_SKIP")
+			ktap_test_skip "$test_num $TEST_HDR_MSG";;
+		"$KSFT_XFAIL")
+			ktap_test_xfail "$test_num $TEST_HDR_MSG";;
+		"$timeout_rc")
+			ktap_test_fail "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds";;
+		*)
+			ktap_test_fail "$test_num $TEST_HDR_MSG # exit=$rc";;
+		esac
 		cd - >/dev/null
 	fi
+
+	return $rc
 }
 
 in_netns()
@@ -164,27 +164,34 @@ in_netns()
 
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
@@ -194,10 +201,28 @@ run_many()
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
+		case "$rc" in
+		"$KSFT_PASS")
+			KTAP_CNT_PASS=$((KTAP_CNT_PASS + 1));;
+		"$KSFT_FAIL")
+			KTAP_CNT_FAIL=$((KTAP_CNT_FAIL + 1));;
+		"$KSFT_SKIP")
+			KTAP_CNT_SKIP=$((KTAP_CNT_SKIP + 1));;
+		"$KSFT_XFAIL")
+			KTAP_CNT_XFAIL=$((KTAP_CNT_XFAIL + 1));;
+		*)
+			KTAP_CNT_FAIL=$((KTAP_CNT_FAIL + 1));;
+		esac
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

