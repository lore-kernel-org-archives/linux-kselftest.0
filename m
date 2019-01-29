From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Tue, 29 Jan 2019 06:28:35 +0000
Subject: [PATCH] selftests/netfilter: fix config fragment CONFIG_NF_TABLES_INET
Message-ID: <20190129062835.31122-1-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190129062835.w44gceOViHS7lph0jWnXE68dPaaZVHjsGD-sS8rGb4s@z>

In selftests the config fragment for netfilter was added as
NF_TABLES_INET=y and this patch correct it as CONFIG_NF_TABLES_INET=y

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/netfilter/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/netfilter/config b/tools/testing/selftests/netfilter/config
index 1017313e41a8..59caa8f71cd8 100644
--- a/tools/testing/selftests/netfilter/config
+++ b/tools/testing/selftests/netfilter/config
@@ -1,2 +1,2 @@
 CONFIG_NET_NS=y
-NF_TABLES_INET=y
+CONFIG_NF_TABLES_INET=y
-- 
2.17.1
