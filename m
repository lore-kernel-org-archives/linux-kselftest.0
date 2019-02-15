From: f.fainelli at gmail.com (Florian Fainelli)
Date: Fri, 15 Feb 2019 10:14:52 -0800
Subject: [PATCH net-next] selftests: forwarding: Add some missing
 configuration symbols
Message-ID: <20190215181457.21101-1-f.fainelli@gmail.com>

For the forwarding selftests to work, we need network namespaces when
using veth/vrf otherwise ping/ping6 commands like these:

ip vrf exec vveth0 /bin/ping 192.0.2.2 -c 10 -i 0.1 -w 5

will fail because network namespaces may not be enabled.

Signed-off-by: Florian Fainelli <f.fainelli at gmail.com>
---
 tools/testing/selftests/net/forwarding/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/config b/tools/testing/selftests/net/forwarding/config
index 5cd2aed97958..da96eff72a8e 100644
--- a/tools/testing/selftests/net/forwarding/config
+++ b/tools/testing/selftests/net/forwarding/config
@@ -10,3 +10,5 @@ CONFIG_NET_CLS_FLOWER=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_ACT_GACT=m
 CONFIG_VETH=m
+CONFIG_NAMESPACES=y
+CONFIG_NET_NS=y
-- 
2.17.1
