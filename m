From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 19 Jun 2018 18:41:11 +0200
Subject: [PATCH] selftests: net: add config fragments
Message-ID: <20180619164111.30785-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180619164111.dZwP0sAWVuaaurUzWz2hrEWvReUGBwHJtFTiAyrO45I@z>

Add fragments to pass bridge and vlan tests.

Fixes: 33b01b7b4f19 ("selftests: add rtnetlink test script")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---

Hi,

net/rtnetlink.sh still fails on tc hbt hierarchy, addrlabel and ipsec:
Error: Specified qdisc not found.
RTNETLINK answers: No such file or directory
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Parent Qdisc doesn't exists.
We have an error talking to the kernel, -1
Error: Invalid handle.
FAIL: tc htb hierarchy

FAIL: ipv6 addrlabel

FAIL: can't add fou port 7777, skipping test
RTNETLINK answers: Operation not supported
FAIL: can't add macsec interface, skipping test
RTNETLINK answers: Protocol not supported
RTNETLINK answers: No such process
RTNETLINK answers: No such process
./rtnetlink.sh: line 527:  5356 Terminated              ip x m >
$tmpfile
FAIL: ipsec


I'm using iproute2 tag: 4.17 and tried the qdisc command from the
function kci_test_tc in net/rtnetlink.sh:
$ tc qdisc add dev lo root handle 1: htb
Error: Specified qdisc not found.

For kci_test_addrlabel it fails on this row:
ip addrlabel list |grep -q "prefix dead::/64 dev lo label 1"

Any idea why these three fails?

Cheers,
Anders

 tools/testing/selftests/net/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 7ba089b33e8b..cd3a2f1545b5 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -12,3 +12,5 @@ CONFIG_NET_IPVTI=y
 CONFIG_INET6_XFRM_MODE_TUNNEL=y
 CONFIG_IPV6_VTI=y
 CONFIG_DUMMY=y
+CONFIG_BRIDGE=y
+CONFIG_VLAN_8021Q=y
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
