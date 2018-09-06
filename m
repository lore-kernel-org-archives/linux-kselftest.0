From: Lei.Yang@windriver.com (Lei Yang)
Date: Thu, 6 Sep 2018 18:22:54 +0800
Subject: [PATCH v2] sysctl: kselftests: fix test_modprobe issue
Message-ID: <1536229374-25699-1-git-send-email-Lei.Yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180906102254.p4em1g_lcV8ctm4r7Pp4H4V_7v4R3WbDhsU2dTLyc9E@z>

when CONFIG_TEST_SYSCTL=y, there is no "/sys/module/test_sysctl/"
when CONFIG_TEST_SYSCTL=m, checking /sys/module/test_sysctl/ is
before kernel module loading

you'll get below error message
root at intel-x86-64:/tmp/sysctl# ./sysctl.sh
Checking production write strict setting ... ok
./sysctl.sh: /sys/module/test_sysctl/ not present
You must have the following enabled in your kernel:

This patch will fix this issue.
when CONFIG_TEST_SYSCTL=y, it has no chance to check "/sys/module/test_sysctl/"
when CONFIG_TEST_SYSCTL=m, it will load kernel module first before checking sys
interface.

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 584eb8e..08dc995 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -120,6 +120,7 @@ test_reqs()
 
 function load_req_mod()
 {
+        trap "test_modprobe" EXIT
 	if [ ! -d $DIR ]; then
 		if ! modprobe -q -n $TEST_DRIVER; then
 			echo "$0: module $TEST_DRIVER not found [SKIP]"
@@ -770,7 +771,6 @@ function parse_args()
 test_reqs
 allow_user_defaults
 check_production_sysctl_writes_strict
-test_modprobe
 load_req_mod
 
 trap "test_finish" EXIT
-- 
1.9.1
