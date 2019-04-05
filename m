From: jeffrin at rajagiritech.edu.in (Jeffrin Jose T)
Date: Fri,  5 Apr 2019 22:03:38 +0530
Subject: [PATCH] selftests : netfilter: Wrote a error and exit code for a
 command which needed veth kernel module.
Message-ID: <20190405163338.7361-1-jeffrin@rajagiritech.edu.in>

A test for  the basic NAT functionality uses ip command which
needs veth device.There is a condition where the kernel support
for veth is not compiled into the kernel and the test script
breaks.This patch contains code for reasonable error display
and correct code exit.

Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
---
 tools/testing/selftests/netfilter/nft_nat.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/netfilter/nft_nat.sh b/tools/testing/selftests/netfilter/nft_nat.sh
index 8ec76681605c..f25f72a75cf3 100755
--- a/tools/testing/selftests/netfilter/nft_nat.sh
+++ b/tools/testing/selftests/netfilter/nft_nat.sh
@@ -23,7 +23,11 @@ ip netns add ns0
 ip netns add ns1
 ip netns add ns2
 
-ip link add veth0 netns ns0 type veth peer name eth0 netns ns1
+ip link add veth0 netns ns0 type veth peer name eth0 netns ns1 > /dev/null 2>&1
+if [ $? -ne 0 ];then
+    echo "SKIP: No virtual ethernet pair device support in kernel"
+    exit $ksft_skip
+fi
 ip link add veth1 netns ns0 type veth peer name eth0 netns ns2
 
 ip -net ns0 link set lo up
-- 
2.20.1
