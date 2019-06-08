From: sashal@kernel.org (Sasha Levin)
Date: Sat,  8 Jun 2019 07:46:16 -0400
Subject: [PATCH AUTOSEL 4.14 05/31] selftests: netfilter: missing error check
 when setting up veth interface
In-Reply-To: <20190608114646.9415-1-sashal@kernel.org>
References: <20190608114646.9415-1-sashal@kernel.org>
Message-ID: <20190608114646.9415-5-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190608114616.6HB_cil70RWDR4ACLxCV3VD-12DzedjsC5G4eMXzSVA@z>

From: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>

[ Upstream commit 82ce6eb1dd13fd12e449b2ee2c2ec051e6f52c43 ]

A test for the basic NAT functionality uses ip command which needs veth
device. There is a condition where the kernel support for veth is not
compiled into the kernel and the test script breaks. This patch contains
code for reasonable error display and correct code exit.

Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
Acked-by: Florian Westphal <fw at strlen.de>
Signed-off-by: Pablo Neira Ayuso <pablo at netfilter.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
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
