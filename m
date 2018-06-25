From: anders.roxell at linaro.org (Anders Roxell)
Date: Mon, 25 Jun 2018 16:56:05 +0200
Subject: [PATCH] selftests: bpf: enable NET_SCHED
Message-ID: <20180625145605.13726-1-anders.roxell@linaro.org>

CONFIG_NET_SCHED wasn't enabled in arm64's defconfig only for x86.
So bpf/test_tunnel.sh tests fails with:
RTNETLINK answers: Operation not supported
RTNETLINK answers: Operation not supported
We have an error talking to the kernel, -1
Enable NET_SCHED and more tests passes.

Fixes: 3bce593ac06b ("selftests: bpf: config: add config fragments")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 1e0c547caf3c..7a6d92562dc6 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -6,6 +6,7 @@ CONFIG_TEST_BPF=m
 CONFIG_CGROUP_BPF=y
 CONFIG_NETDEVSIM=m
 CONFIG_NET_CLS_ACT=y
+CONFIG_NET_SCHED=y
 CONFIG_NET_SCH_INGRESS=y
 CONFIG_NET_IPIP=y
 CONFIG_IPV6=y
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
