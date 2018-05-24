From: sbrivio at redhat.com (Stefano Brivio)
Date: Thu, 24 May 2018 16:10:12 +0200
Subject: [PATCH net] selftests/net: Add missing config options for PMTU tests
Message-ID: <53b70df32d1d92df98a9c8deaae90e9e7ad37fbc.1527170629.git.sbrivio@redhat.com>

PMTU tests in pmtu.sh need support for VTI, VTI6 and dummy
interfaces: add them to config file.

Reported-by: Naresh Kamboju <naresh.kamboju at linaro.org>
Fixes: d1f1b9cbf34c ("selftests: net: Introduce first PMTU test")
Signed-off-by: Stefano Brivio <sbrivio at redhat.com>
---
 tools/testing/selftests/net/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 6a75a3ea44ad..7ba089b33e8b 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -7,3 +7,8 @@ CONFIG_NET_L3_MASTER_DEV=y
 CONFIG_IPV6=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_VETH=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_NET_IPVTI=y
+CONFIG_INET6_XFRM_MODE_TUNNEL=y
+CONFIG_IPV6_VTI=y
+CONFIG_DUMMY=y
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
