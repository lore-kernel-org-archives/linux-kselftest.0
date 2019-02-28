From: sashal@kernel.org (Sasha Levin)
Date: Thu, 28 Feb 2019 10:15:07 -0500
Subject: [PATCH AUTOSEL 4.9 11/19] selftests: netfilter: fix config fragment
 CONFIG_NF_TABLES_INET
In-Reply-To: <20190228151517.12705-1-sashal@kernel.org>
References: <20190228151517.12705-1-sashal@kernel.org>
Message-ID: <20190228151517.12705-11-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228151507.HlUhGdshsI9ggd-FrtmMV_N5PeMlvl4cfshRZeQAtCc@z>

From: Naresh Kamboju <naresh.kamboju@linaro.org>

[ Upstream commit 952b72f89ae23b316da8c1021b18d0c388ad6cc4 ]

In selftests the config fragment for netfilter was added as
NF_TABLES_INET=y and this patch correct it as CONFIG_NF_TABLES_INET=y

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
Acked-by: Florian Westphal <fw at strlen.de>
Signed-off-by: Pablo Neira Ayuso <pablo at netfilter.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/netfilter/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/netfilter/config b/tools/testing/selftests/netfilter/config
index 1017313e41a85..59caa8f71cd80 100644
--- a/tools/testing/selftests/netfilter/config
+++ b/tools/testing/selftests/netfilter/config
@@ -1,2 +1,2 @@
 CONFIG_NET_NS=y
-NF_TABLES_INET=y
+CONFIG_NF_TABLES_INET=y
-- 
2.19.1
