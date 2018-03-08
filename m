From: anders.roxell@linaro.org (Anders Roxell)
Date: Thu,  8 Mar 2018 11:17:23 +0100
Subject: [PATCH] selftests/net: enable fragments for fib-onlink-tests
Message-ID: <20180308101723.19721-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180308101723.peBw4irz1VAR82FfPzzNXtDxgM9_VHCqJYslrs4ah-s@z>

We miss CONFIG_* fragments so test fib-onlink-tests.sh can do:
ip li add lisa type vrf table 1101
ip li add veth1 type veth peer name veth2

And the follow message occurs if it isn't enabled:
Configuring interfaces
RTNETLINK answers: Operation not supported

This enables for NET_NRF (and friends) and VETH so we can create a vrf
table and veth.

Fixes: 153e1b84f477 ("selftests: Add FIB onlink tests")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 7177bea1fdfa..6a75a3ea44ad 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -2,3 +2,8 @@ CONFIG_USER_NS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_TEST_BPF=m
 CONFIG_NUMA=y
+CONFIG_NET_VRF=y
+CONFIG_NET_L3_MASTER_DEV=y
+CONFIG_IPV6=y
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_VETH=y
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
