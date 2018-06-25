From: shannon.nelson at oracle.com (Shannon Nelson)
Date: Mon, 25 Jun 2018 16:41:33 -0700
Subject: [PATCH v2 net-next 1/4] selftests: rtnetlink: clear the return code
 at start of ipsec test
In-Reply-To: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
References: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
Message-ID: <1529970096-23199-2-git-send-email-shannon.nelson@oracle.com>

Following the custom from the other functions, clear the global
ret code before starting the test so as to not have previously
failed tests cause us to thing this test has failed.

Reported-by: Anders Roxell <anders.roxell at linaro.org>
Signed-off-by: Shannon Nelson <shannon.nelson at oracle.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index b33a371..261a981 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -522,6 +522,8 @@ kci_test_macsec()
 #-------------------------------------------------------------------
 kci_test_ipsec()
 {
+	ret=0
+
 	# find an ip address on this machine and make up a destination
 	srcip=`ip -o addr | awk '/inet / { print $4; }' | grep -v "^127" | head -1 | cut -f1 -d/`
 	net=`echo $srcip | cut -f1-3 -d.`
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
