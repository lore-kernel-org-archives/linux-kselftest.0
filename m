Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C830F80C;
	Fri, 17 Apr 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445109; cv=none; b=ARl8A/Hm6WOb+tY7uz2MjmXaVECPC2tRYv1+rpJw51ToJjyEVi+fdzokDMVEwMpZKlxT2eMZcr4/L28drt2sVHRzdPALvg71UjG5vopd1mBveP/l4Bj/zcKyNIp6eOE6EOaoFpODoT0G7N/uImhuzuHiSwdEWlucBVMdfxQTXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445109; c=relaxed/simple;
	bh=HNMlQyxnS0YkmDkWnL0AKGMMX+yxuqlYKqeWrjkGVhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JNRFf0hCAkjTXFwLY53oOpSYxkwpkwtxOdQ5J8zxgtbTQuwHSDwVP8rLxvWEx849K5hKLJk1q/RND/m2UbaUDJSxljJTrEjU0Pd/sIjUEEdBzgc9CXQeyTMM8HVD5CdRf4pK7GGaoYIlgq+yMU4i9GrLdI7G1eVqwEVYGnqTZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TElW6/XZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TElW6/XZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD47C2BCB5;
	Fri, 17 Apr 2026 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776445109;
	bh=HNMlQyxnS0YkmDkWnL0AKGMMX+yxuqlYKqeWrjkGVhg=;
	h=From:Date:Subject:To:Cc:From;
	b=TElW6/XZi3zAbgBw3Vp0Rq9MM1+Hw1bIQyUCasG2o9vPUbN8SE2bZwz8y9BoiNuPO
	 GkEadRp9TzLBxxDoAK8b/Ws9FAP08HCSfNJjrRZpvPwyjW3iobbBNAXcTpCLlzqaHJ
	 bbUKMg8TRy1+dM/zdoYd9mogVF6BQARP9H57CD3sOtj0iQC0dc6XLaLrAo2trtcSyU
	 o7lycRdGdJ/M97GYQcHLBTX4H+zltU0KWsrI4C05hJjetareOCXzIRjvWA6YWkgumw
	 7aNfF8615dIe/B4olAFdsSA3fEL+yPfm1iD4PkxD+eYl6Q27doFXqFxOeKv/RBCZ1l
	 FWGqFGnwJtVAw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 17 Apr 2026 17:57:50 +0100
Subject: [PATCH] selftests: Fix duplicated test number reporting
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-selftests-fix-double-number-v1-1-1be5d7c36b94@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI1m4mkC/yXMQQrCMBBG4auUWTuQjKLUq4gLp/2jkZpKJhGh9
 O5GXX7weAsZcoTRsVso4xUtzqnBbzoabpd0BcexmcTJ3u38gQ1TKLBiHOKbx7nqBE71ocjc91u
 R4LyoemqHZ0aLfvfT+W+resdQvkta1w+LHmiyfwAAAA==
X-Change-ID: 20260417-selftests-fix-double-number-99322f012bb1
To: Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
 Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3866; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HNMlQyxnS0YkmDkWnL0AKGMMX+yxuqlYKqeWrjkGVhg=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsxHaZtUktoq55xaHuZ19XOJu7uPjucpVpcj5rOft+a+b
 npTym3cyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMxN6Zg6FVSUf87u7/PZZ7
 V/1YO+uffYOSp84d6dcK7KdzY3eXL9V/xa5ZfvGUoEvY/L4V4eXFz+RDmz6dK5zRxS8f4Og9T35
 edOfeB9LuLsw5SpfYmZ6fbknJ1VDTrpk5izHsCafdxpZfmbmWMwq/xOl0pbus5/Xxsp9vMb3h6o
 f53hPNPGJ/7lvTfVVw176MVzcMLj2t65z7+Lz5Kg8du2WmjzUm3H4Wco6N67JnQ+7D1i7RuYVOD
 dmTLNglHq/1FOf7yeb0UyNAv2da7sP7k5ZEeci3PPji5CK+30XjrdXqR1/KfoRW1zo03mxRVfgS
 cFdz5+Jr4lZv1XyUzJqFGvXTKqwP/xZz25Jz2YOt9NxBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh") converted
the prints in runner.sh to use the relevant helpers from ktap_helpers.sh,
not modifying any of the strings printed in the process. This included
converting all the result reports to use the relevant ktap_test_ function.
Since the output was originally KTAP compliant the strings reported for
test names now include test numbers:

  ok 59 59 selftests: arm64: syscall-abi

instead of the expected format:

  ok 59 selftests: arm64: syscall-abi

which causes result parsers to interpret the second number as part of the
test name.

Given the use of the helpers the tracking of test numbers by runner.sh is
now redundant, remove it entirely to restore the expected output format.

Fixes: 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kselftest/runner.sh | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 1115ee7e525c..311811dc55a0 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -51,7 +51,6 @@ run_one()
 {
 	DIR="$1"
 	TEST="$2"
-	local rc test_num="$3"
 
 	BASENAME_TEST=$(basename $TEST)
 
@@ -108,7 +107,7 @@ run_one()
 	echo "# $TEST_HDR_MSG"
 	if [ ! -e "$TEST" ]; then
 		ktap_print_msg "Warning: file $TEST is missing!"
-		ktap_test_fail "$test_num $TEST_HDR_MSG"
+		ktap_test_fail "$TEST_HDR_MSG"
 		rc=$KSFT_FAIL
 	else
 		if [ -x /usr/bin/stdbuf ]; then
@@ -127,7 +126,7 @@ run_one()
 				interpreter=$(head -n 1 "$TEST" | cut -c 3-)
 				cmd="$stdbuf $interpreter ./$BASENAME_TEST"
 			else
-				ktap_test_fail "$test_num $TEST_HDR_MSG"
+				ktap_test_fail "$TEST_HDR_MSG"
 				return $KSFT_FAIL
 			fi
 		fi
@@ -138,15 +137,15 @@ run_one()
 		rc=$?
 		case "$rc" in
 		"$KSFT_PASS")
-			ktap_test_pass "$test_num $TEST_HDR_MSG";;
+			ktap_test_pass "$TEST_HDR_MSG";;
 		"$KSFT_SKIP")
-			ktap_test_skip "$test_num $TEST_HDR_MSG";;
+			ktap_test_skip "$TEST_HDR_MSG";;
 		"$KSFT_XFAIL")
-			ktap_test_xfail "$test_num $TEST_HDR_MSG";;
+			ktap_test_xfail "$TEST_HDR_MSG";;
 		"$timeout_rc")
-			ktap_test_fail "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds";;
+			ktap_test_fail "$TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds";;
 		*)
-			ktap_test_fail "$test_num $TEST_HDR_MSG # exit=$rc";;
+			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
 		esac
 		cd - >/dev/null
 	fi
@@ -161,7 +160,7 @@ in_netns()
 		BASE_DIR=$BASE_DIR
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
-		run_one $DIR $TEST $test_num
+		run_one $DIR $TEST
 	EOF
 }
 
@@ -174,7 +173,7 @@ run_in_netns()
 	ip netns add $netns
 	if [ $? -ne 0 ]; then
 		ktap_print_msg "Warning: Create namespace failed for $BASENAME_TEST"
-		ktap_test_fail "$test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
+		ktap_test_fail "selftests: $DIR: $BASENAME_TEST # Create NS failed"
 	fi
 	ip -n $netns link set lo up
 
@@ -191,13 +190,11 @@ run_in_netns()
 run_many()
 {
 	DIR="${PWD#${BASE_DIR}/}"
-	test_num=0
 	local rc
 	pids=
 
 	for TEST in "$@"; do
 		BASENAME_TEST=$(basename $TEST)
-		test_num=$(( test_num + 1 ))
 		if [ -n "$per_test_logging" ]; then
 			logfile="$per_test_log_dir/$BASENAME_TEST"
 			cat /dev/null > "$logfile"
@@ -206,7 +203,7 @@ run_many()
 			run_in_netns &
 			pids="$pids $!"
 		else
-			run_one "$DIR" "$TEST" "$test_num"
+			run_one "$DIR" "$TEST"
 		fi
 	done
 

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260417-selftests-fix-double-number-99322f012bb1

Best regards,
--  
Mark Brown <broonie@kernel.org>

