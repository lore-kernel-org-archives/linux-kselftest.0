From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 21 Aug 2018 18:12:12 +0200
Subject: [PATCH] selftests: net: move fragment forwarding/config up a level
Message-ID: <20180821161212.5750-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180821161212.WBQQIxuzD6e8ZyHmfTagZ7duwMIrworFj1PfXL6S6yM@z>

'make kselftest-merge' assumes that the config files for the tests are
located under the 'main' tet dir, like tools/testing/selftests/net/ and
not in a subdir to net.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/config            | 13 +++++++++----
 tools/testing/selftests/net/forwarding/config | 12 ------------
 2 files changed, 9 insertions(+), 16 deletions(-)
 delete mode 100644 tools/testing/selftests/net/forwarding/config

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index cd3a2f1545b5..b344619b34f2 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -2,15 +2,20 @@ CONFIG_USER_NS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_TEST_BPF=m
 CONFIG_NUMA=y
-CONFIG_NET_VRF=y
+CONFIG_NET_VRF=m
 CONFIG_NET_L3_MASTER_DEV=y
 CONFIG_IPV6=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_VETH=y
+CONFIG_VETH=m
 CONFIG_INET_XFRM_MODE_TUNNEL=y
 CONFIG_NET_IPVTI=y
 CONFIG_INET6_XFRM_MODE_TUNNEL=y
 CONFIG_IPV6_VTI=y
 CONFIG_DUMMY=y
-CONFIG_BRIDGE=y
-CONFIG_VLAN_8021Q=y
+CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
+CONFIG_CGROUP_BPF=y
+CONFIG_NET_CLS_FLOWER=m
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_ACT_GACT=m
+CONFIG_BRIDGE_VLAN_FILTERING=y
diff --git a/tools/testing/selftests/net/forwarding/config b/tools/testing/selftests/net/forwarding/config
deleted file mode 100644
index 5cd2aed97958..000000000000
--- a/tools/testing/selftests/net/forwarding/config
+++ /dev/null
@@ -1,12 +0,0 @@
-CONFIG_BRIDGE=m
-CONFIG_VLAN_8021Q=m
-CONFIG_BRIDGE_VLAN_FILTERING=y
-CONFIG_NET_L3_MASTER_DEV=y
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_NET_VRF=m
-CONFIG_BPF_SYSCALL=y
-CONFIG_CGROUP_BPF=y
-CONFIG_NET_CLS_FLOWER=m
-CONFIG_NET_SCH_INGRESS=m
-CONFIG_NET_ACT_GACT=m
-CONFIG_VETH=m
-- 
2.18.0
