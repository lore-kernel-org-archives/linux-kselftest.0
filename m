From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri, 18 May 2018 20:23:24 +0200
Subject: [PATCH] selftests: bpf: config: enable NET_SCH_INGRESS for xdp_meta.sh
Message-ID: <20180518182324.23827-1-anders.roxell@linaro.org>

When running bpf's selftest test_xdp_meta.sh it fails:
./test_xdp_meta.sh
Error: Specified qdisc not found.
selftests: test_xdp_meta [FAILED]

Need to enable CONFIG_NET_SCH_INGRESS and CONFIG_NET_CLS_ACT to get the
test to pass.

Fixes: 22c8852624fc ("bpf: improve selftests and add tests for meta pointer")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 983dd25d49f4..1eefe211a4a8 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -5,3 +5,5 @@ CONFIG_BPF_EVENTS=y
 CONFIG_TEST_BPF=m
 CONFIG_CGROUP_BPF=y
 CONFIG_NETDEVSIM=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_SCH_INGRESS=y
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
