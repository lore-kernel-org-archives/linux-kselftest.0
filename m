Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9933C1B2
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365837; cv=none; b=jxkqojxGE/xbvxTziVwTJO73rumwBpW6/2ChrQUnHeHkcbLWycL75tnrq9e0eAuq2aGdlXZeA1xlV20IYTNNK3nJdbQHhHffQA6kHGAmoGdw9vB/51kesUC89DxK5J61fyhTuKN0gGrIfDAJlCqm1c1idi50z80WbnbUjlAPmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365837; c=relaxed/simple;
	bh=c7PQOE0iMHjHxkRzpLy5wyWcpXy4hEdVWeuqSuOUeEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ODahTZiZFbpqM/dQyJmwfDQY2EpsIEzBU9Z2W3s/GyW7CqqlMZKnnaP7/TnPIQMDDa9J2M8+4aYVIjdYqb/pAEy0JPHgY4FgNCW09SyTuIIIGtolSRymetMmMMMxJC4o29jeABPI9h96OyS1V04UFQXnjiDEYbHi36uYC4jb8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIJpk2s3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIJpk2s3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-352ccc61658so982972a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 00:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770365837; x=1770970637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCT2HUHLs8OeyVWtYlHn7qjboQomP4IpKbaE1KAoCHE=;
        b=NIJpk2s3BuWEugfJ3uNVac7Z1peetzh4UaiRtalaUgYRqOehJX2+WQfNZ6HNVict5X
         ZoBktA9aDwE0Suoz7OMFX3uqdEQp+ackhi4SRNveEKICqOqwOsPe8JYoTVXE5eLE90BX
         HABzf47ZuR4+tB0k9TaWSb+sm1tHz3Qnc8plEt56fQoWNe3USqMVc7mq7GFHjURM9rwW
         91uvLj8LAn4GmAaZcpcp/D4624E8JyS4SkYLnvN9abRjHSACVSP9NpB/fyVqa4FotZf7
         u71Heus0UUw3YT3W9l3z4ppRvc1LoRYFB09OSfNPXjlEZl4dHcxvrF5QAVMilTQBcibP
         EYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365837; x=1770970637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCT2HUHLs8OeyVWtYlHn7qjboQomP4IpKbaE1KAoCHE=;
        b=KuWjz+uKYWxFs10oLqO4qpDZOJkHrWdge0QWLZgsl9cCTPiv9E31irQBK/SRYOjkZH
         zO+Mj8squ8/V5r+Tke4J4yHkEUUd5uEI/1vVyWac9vUaxgUcTJ8uklIFXGiu4O2Uv9vr
         ZXmsAVtLTcNIwkx2skJzTDZ693N7lSs6s/+no0jcOtvQL6NA4AmjZXjQsvn2137D3FdC
         Snbttqa6HlBPqvIREh9boaH0HCD6vFHr5VIBMqDyqlmipbiW2wtS33pXVqhoqbgNsNl2
         3BYwr84jCNJZmtnd/xjdxqVkcpRVWEavwjsi0cO2hnTth/A2Gjo9sGxXVOHNc6IApOEt
         +x4w==
X-Gm-Message-State: AOJu0YyrqgEAnizGOoTHCiW9PTu0aBFJrwAiXS0w0Y6Dm4YPAERQt2Uh
	v38Kfeloyf/t6jQs/f2yUC6AC5ADG2obpDTo2iaXYYQh8gT8p0QTgRvn+pmRkxC2
X-Gm-Gg: AZuq6aKtzUOUO+xqs/+w5QV+YSg4ov2cwMmICEKSeCNpWTHeLDhvxyr0lc0+vcNe+UI
	cqNNmIHS/LQCfeEoOFG4oaEkz+oAn97hL8ctcIf9UJ1taZCWcAU93ZIY92vWWbXrjvC1rCe4OK7
	hDcUigaGHqamocj5+n9/mZdL+eE2fSz5j9Ptz4MlQlLdfbWDU7RS+8h/21fXmcT7p1C/X2ne9t8
	xZv8simgeRzerXTZJ64AbvmeDgeRN+Dw1VVJ+f9R2GbziyuJGLGXP9RGzaYi0TmnRNCpLQAAkE+
	rUqYcKgudMYE0fsH3q4ujXOhozlBsteFleBZfZumcKV5tvWmfTA6ZtaAYu54g8lIp7PRoIrckYh
	rfn2N+3pDtWHIazN8l3Z4u8EYcdBsL9ZyIevKog/uGAfkc8Zsmgwr+DeFbVh5J8DBlX4UBvyzoW
	Aa+KQAJoZ9p5Wp0fY=
X-Received: by 2002:a17:90b:2fc3:b0:354:a1bc:f99b with SMTP id 98e67ed59e1d1-354b3e15243mr1655063a91.37.1770365836747;
        Fri, 06 Feb 2026 00:17:16 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4686dfesm755671a91.11.2026.02.06.00.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:17:15 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	netdev@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH selftests] selftests: Use ktap helpers for runner.sh
Date: Fri,  6 Feb 2026 08:17:04 +0000
Message-ID: <20260206081704.53215-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This has been on my todo list for a long time. We should use ktap
helpers in runner.sh. I saw Brendan did some work in d9e6269e3303
("selftests/run_kselftest.sh: exit with error if tests fail") to make
run_kselftest.sh exit with the correct return value. But we still use a
custom solution in runner.sh. Let's convert all the print messages to use
formal ktap helpers. Here’s what I changed:

  1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
     is the only caller of run_many().
  2. In run_kselftest.sh, call run_many() in main process to count the
     pass/fail numbers.
  3. In run_kselftest.sh, do not generate kselftest_failures_file; just
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
 tools/testing/selftests/kselftest/runner.sh | 83 ++++++++++++---------
 tools/testing/selftests/run_kselftest.sh    | 21 ++++--
 2 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..f3307f2d1f48 100644
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
@@ -194,10 +200,19 @@ run_many()
 		fi
 		if [ -n "$RUN_IN_NETNS" ]; then
 			run_in_netns &
+			pids+=($!)
 		else
 			run_one "$DIR" "$TEST" "$test_num"
 		fi
 	done
 
-	wait
+	# Handle the return values when running in netns.
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
index d4be97498b32..10930d09f2a5 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -110,18 +110,23 @@ if [ -n "$TESTS" ]; then
 	available="$(echo "$valid" | sed -e 's/ /\n/g')"
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

