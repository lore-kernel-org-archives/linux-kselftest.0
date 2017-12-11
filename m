From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Tue, 12 Dec 2017 00:55:23 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests: bpf: Adding config
	fragment CONFIG_CGROUP_BPF=y
Message-ID: <1513020323-29591-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171211192523.zJx8HKKb_fGC6CGjLxWlBABo38h5ipFX_BnKTpR8MAM@z>

CONFIG_CGROUP_BPF=y is required for test_dev_cgroup test case.

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 52d53ed..9d48973 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -3,3 +3,4 @@ CONFIG_BPF_SYSCALL=y
 CONFIG_NET_CLS_BPF=m
 CONFIG_BPF_EVENTS=y
 CONFIG_TEST_BPF=m
+CONFIG_CGROUP_BPF=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
