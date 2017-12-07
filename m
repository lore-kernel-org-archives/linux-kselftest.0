From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Fri,  8 Dec 2017 00:53:59 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests: net: Adding config
	fragment CONFIG_CGROUP_BPF=y
Message-ID: <1512674639-13764-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171207192359.clk1cImeWVzNFoWYpeeHXsRDHNjLFLcp5KL_CplCdr8@z>

CONFIG_CGROUP_BPF=y is required for test_dev_cgroup test case.

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/net/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index e57b4ac..02301c6 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -1,3 +1,4 @@
 CONFIG_USER_NS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_TEST_BPF=m
+CONFIG_CGROUP_BPF=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
