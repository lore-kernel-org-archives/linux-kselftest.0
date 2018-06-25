From: shannon.nelson at oracle.com (Shannon Nelson)
Date: Mon, 25 Jun 2018 16:41:36 -0700
Subject: [PATCH v2 net-next 4/4] selftests: rtnetlink: add ipsec offload API
 test
In-Reply-To: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
References: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
Message-ID: <1529970096-23199-5-git-send-email-shannon.nelson@oracle.com>

Using the netdevsim as a device for testing, try out the XFRM commands
for setting up IPsec hardware offloads.

Signed-off-by: Shannon Nelson <shannon.nelson at oracle.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index 15948cf..9e1a82e 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -608,6 +608,119 @@ kci_test_ipsec()
 	echo "PASS: ipsec"
 }
 
+#-------------------------------------------------------------------
+# Example commands
+#   ip x s add proto esp src 14.0.0.52 dst 14.0.0.70 \
+#            spi 0x07 mode transport reqid 0x07 replay-window 32 \
+#            aead 'rfc4106(gcm(aes))' 1234567890123456dcba 128 \
+#            sel src 14.0.0.52/24 dst 14.0.0.70/24
+#            offload dev sim1 dir out
+#   ip x p add dir out src 14.0.0.52/24 dst 14.0.0.70/24 \
+#            tmpl proto esp src 14.0.0.52 dst 14.0.0.70 \
+#            spi 0x07 mode transport reqid 0x07
+#
+#-------------------------------------------------------------------
+kci_test_ipsec_offload()
+{
+	ret=0
+	algo="aead rfc4106(gcm(aes)) 0x3132333435363738393031323334353664636261 128"
+	srcip=192.168.123.3
+	dstip=192.168.123.4
+	dev=simx1
+	sysfsd=/sys/kernel/debug/netdevsim/$dev
+	sysfsf=$sysfsd/ipsec
+
+	# setup netdevsim since dummydev doesn't have offload support
+	modprobe netdevsim
+	check_err $?
+	if [ $ret -ne 0 ]; then
+		echo "FAIL: ipsec_offload can't load netdevsim"
+		return 1
+	fi
+
+	ip link add $dev type netdevsim
+	ip addr add $srcip dev $dev
+	ip link set $dev up
+	if [ ! -d $sysfsd ] ; then
+		echo "FAIL: ipsec_offload can't create device $dev"
+		return 1
+	fi
+	if [ ! -f $sysfsf ] ; then
+		echo "FAIL: ipsec_offload netdevsim doesn't support IPsec offload"
+		return 1
+	fi
+
+	# flush to be sure there's nothing configured
+	ip x s flush ; ip x p flush
+
+	# create offloaded SAs, both in and out
+	ip x p add dir out src $srcip/24 dst $dstip/24 \
+	    tmpl proto esp src $srcip dst $dstip spi 9 \
+	    mode transport reqid 42
+	check_err $?
+	ip x p add dir out src $dstip/24 dst $srcip/24 \
+	    tmpl proto esp src $dstip dst $srcip spi 9 \
+	    mode transport reqid 42
+	check_err $?
+
+	ip x s add proto esp src $srcip dst $dstip spi 9 \
+	    mode transport reqid 42 $algo sel src $srcip/24 dst $dstip/24 \
+	    offload dev $dev dir out
+	check_err $?
+	ip x s add proto esp src $dstip dst $srcip spi 9 \
+	    mode transport reqid 42 $algo sel src $dstip/24 dst $srcip/24 \
+	    offload dev $dev dir in
+	check_err $?
+	if [ $ret -ne 0 ]; then
+		echo "FAIL: ipsec_offload can't create SA"
+		return 1
+	fi
+
+	# does offload show up in ip output
+	lines=`ip x s list | grep -c "crypto offload parameters: dev $dev dir"`
+	if [ $lines -ne 2 ] ; then
+		echo "FAIL: ipsec_offload SA offload missing from list output"
+		check_err 1
+	fi
+
+	# use ping to exercise the Tx path
+	ping -I $dev -c 3 -W 1 -i 0 $dstip >/dev/null
+
+	# does driver have correct offload info
+	diff $sysfsf - << EOF
+SA count=2 tx=3
+sa[0] tx ipaddr=0x00000000 00000000 00000000 00000000
+sa[0]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
+sa[0]    key=0x34333231 38373635 32313039 36353433
+sa[1] rx ipaddr=0x00000000 00000000 00000000 037ba8c0
+sa[1]    spi=0x00000009 proto=0x32 salt=0x61626364 crypt=1
+sa[1]    key=0x34333231 38373635 32313039 36353433
+EOF
+	if [ $? -ne 0 ] ; then
+		echo "FAIL: ipsec_offload incorrect driver data"
+		check_err 1
+	fi
+
+	# does offload get removed from driver
+	ip x s flush
+	ip x p flush
+	lines=`grep -c "SA count=0" $sysfsf`
+	if [ $lines -ne 1 ] ; then
+		echo "FAIL: ipsec_offload SA not removed from driver"
+		check_err 1
+	fi
+
+	# clean up any leftovers
+	ip link del $dev
+	rmmod netdevsim
+
+	if [ $ret -ne 0 ]; then
+		echo "FAIL: ipsec_offload"
+		return 1
+	fi
+	echo "PASS: ipsec_offload"
+}
+
 kci_test_gretap()
 {
 	testns="testns"
@@ -862,6 +975,7 @@ kci_test_rtnl()
 	kci_test_encap
 	kci_test_macsec
 	kci_test_ipsec
+	kci_test_ipsec_offload
 
 	kci_del_dummy
 }
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
