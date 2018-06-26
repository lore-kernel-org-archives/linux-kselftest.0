From: shannon.nelson@oracle.com (Shannon Nelson)
Date: Tue, 26 Jun 2018 10:07:53 -0700
Subject: [PATCH v3 net-next 2/4] selftests: rtnetlink: use dummydev as a test
 device
In-Reply-To: <1530032875-30482-1-git-send-email-shannon.nelson@oracle.com>
References: <1530032875-30482-1-git-send-email-shannon.nelson@oracle.com>
Message-ID: <1530032875-30482-3-git-send-email-shannon.nelson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626170753.37l6ZCu2nmxXdpMz_gsocS3fd9_VpuxW4qwkBgtv4dQ@z>

We really shouldn't mess with local system settings, so let's
use the already created dummy device instead for ipsec testing.
Oh, and let's put the temp file into a proper directory.

Signed-off-by: Shannon Nelson <shannon.nelson at oracle.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index 261a981..15948cf 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -523,21 +523,19 @@ kci_test_macsec()
 kci_test_ipsec()
 {
 	ret=0
-
-	# find an ip address on this machine and make up a destination
-	srcip=`ip -o addr | awk '/inet / { print $4; }' | grep -v "^127" | head -1 | cut -f1 -d/`
-	net=`echo $srcip | cut -f1-3 -d.`
-	base=`echo $srcip | cut -f4 -d.`
-	dstip="$net."`expr $base + 1`
-
 	algo="aead rfc4106(gcm(aes)) 0x3132333435363738393031323334353664636261 128"
+	srcip=192.168.123.1
+	dstip=192.168.123.2
+	spi=7
+
+	ip addr add $srcip dev $devdummy
 
 	# flush to be sure there's nothing configured
 	ip x s flush ; ip x p flush
 	check_err $?
 
 	# start the monitor in the background
-	tmpfile=`mktemp ipsectestXXX`
+	tmpfile=`mktemp /var/run/ipsectestXXX`
 	mpid=`(ip x m > $tmpfile & echo $!) 2>/dev/null`
 	sleep 0.2
 
@@ -601,6 +599,7 @@ kci_test_ipsec()
 	check_err $?
 	ip x p flush
 	check_err $?
+	ip addr del $srcip/32 dev $devdummy
 
 	if [ $ret -ne 0 ]; then
 		echo "FAIL: ipsec"
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
