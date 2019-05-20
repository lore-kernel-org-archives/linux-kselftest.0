From: keescook@chromium.org (Kees Cook)
Date: Mon, 20 May 2019 15:37:48 -0700
Subject: [PATCH 1/2] selftests: Remove forced unbuffering for test running
In-Reply-To: <20190520223749.13476-1-keescook@chromium.org>
References: <20190520223749.13476-1-keescook@chromium.org>
Message-ID: <20190520223749.13476-2-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520223748.hMRS6oTV_fPX7UcXm-5QlH6jDCjtsmHshAABA7hFbp0@z>

As it turns out, the "stdbuf" command will actually force all
subprocesses into unbuffered output, and some implementations of "echo"
turn into single-character writes, which utterly wrecks writes to /sys
and /proc files.

Instead, drop the "stdbuf" usage, and for any tests that want explicit
flushing between newlines, they'll have to add "fflush(stdout);" as
needed.

Reported-by: Takashi Iwai <tiwai at suse.de>
Fixes: 5c069b6dedef ("selftests: Move test output to diagnostic lines")
Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest/runner.sh | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index eff3ee303d0d..00c9020bdda8 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -24,16 +24,6 @@ tap_prefix()
 	fi
 }
 
-# If stdbuf is unavailable, we must fall back to line-at-a-time piping.
-tap_unbuffer()
-{
-	if ! which stdbuf >/dev/null ; then
-		"$@"
-	else
-		stdbuf -i0 -o0 -e0 "$@"
-	fi
-}
-
 run_one()
 {
 	DIR="$1"
@@ -54,7 +44,7 @@ run_one()
 		echo "not ok $test_num $TEST_HDR_MSG"
 	else
 		cd `dirname $TEST` > /dev/null
-		(((((tap_unbuffer ./$BASENAME_TEST 2>&1; echo $? >&3) |
+		(((((./$BASENAME_TEST 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
 			(read xs; exit $xs)) 4>>"$logfile" &&
 		echo "ok $test_num $TEST_HDR_MSG") ||
-- 
2.17.1
