From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri,  4 May 2018 18:47:25 +0200
Subject: [PATCH] selftests: net: use TEST_PROGS_EXTENDED
Message-ID: <20180504164725.13516-1-anders.roxell@linaro.org>

When a script file that isn't generated uses the variable
TEST_GEN_PROGS_EXTENDED and a 'make -C tools/testing/selftests clean' is
performed the script file gets removed and git shows the file as
deleted. For script files that isn't generated TEST_PROGS_EXTENDED
should be used.

Fixes: 9faedd643fd9 ("selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 44895de1a0c4..eee47a4bc675 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -7,7 +7,7 @@ CFLAGS += -I../../../../usr/include/
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh rtnetlink.sh
 TEST_PROGS += fib_tests.sh fib-onlink-tests.sh pmtu.sh udpgso.sh
 TEST_PROGS += udpgso_bench.sh
-TEST_GEN_PROGS_EXTENDED := in_netns.sh
+TEST_PROGS_EXTENDED := in_netns.sh
 TEST_GEN_FILES =  socket
 TEST_GEN_FILES += psock_fanout psock_tpacket msg_zerocopy
 TEST_GEN_FILES += tcp_mmap tcp_inq
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
