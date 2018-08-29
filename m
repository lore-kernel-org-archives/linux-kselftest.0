From: Lei.Yang@windriver.com (Lei Yang)
Date: Wed, 29 Aug 2018 16:06:12 +0800
Subject: [PATCH]] zram: kselftests: correct README
Message-ID: <1535529972-9038-1-git-send-email-Lei.Yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180829080612.03cTQpsPUePxIc-RtSZciAl_oSuhRGR4ljG7F6Rj6qg@z>

CONFIG_ZRAM=y should be CONFIG_ZRAM=m
it obviously uses zram kernel module in the testing

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/zram/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/zram/README b/tools/testing/selftests/zram/README
index 7972cc5..501223a 100644
--- a/tools/testing/selftests/zram/README
+++ b/tools/testing/selftests/zram/README
@@ -12,7 +12,7 @@ Statistics for individual zram devices are exported through sysfs nodes at
 /sys/block/zram<id>/
 
 Kconfig required:
-CONFIG_ZRAM=y
+CONFIG_ZRAM=m
 CONFIG_CRYPTO_LZ4=y
 CONFIG_ZPOOL=y
 CONFIG_ZSMALLOC=y
-- 
1.9.1
