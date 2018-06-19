From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Tue, 19 Jun 2018 11:20:31 -0500
Subject: [PATCH] selftests/net: Fix permissions for fib_tests.sh
Message-ID: <1529425232-25242-1-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180619162031.wOKmzwXo16rs_Xn24MMjlK14OQh7GL87D_sZ-714pWg@z>

fib_tests.sh became non-executable at some point. This is
what happens:
  selftests: net: fib_tests.sh: Warning: file fib_tests.sh is
  not executable, correct this.
  not ok 1..11 selftests: net: fib_tests.sh [FAIL]

Fixes: d69faad76584 ("selftests: fib_tests: Add prefix route tests with metric")

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/net/fib_tests.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tools/testing/selftests/net/fib_tests.sh

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
old mode 100644
new mode 100755
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
