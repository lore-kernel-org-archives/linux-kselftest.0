From: anders.roxell at linaro.org (Anders Roxell)
Date: Wed, 11 Apr 2018 17:17:34 +0200
Subject: [PATCH] selftests: net: add in_netns.sh to TEST_PROGS
Message-ID: <20180411151734.15507-1-anders.roxell@linaro.org>

Script in_netns.sh isn't installed.
--------------------
running psock_fanout test
--------------------
./run_afpackettests: line 12: ./in_netns.sh: No such file or directory
[FAIL]
--------------------
running psock_tpacket test
--------------------
./run_afpackettests: line 22: ./in_netns.sh: No such file or directory
[FAIL]

In current code added in_netns.sh to be installed.

Fixes: cc30c93fa020 ("selftests/net: ignore background traffic in psock_fanout")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 785fc18a16b4..8f1e13d2e547 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -5,7 +5,7 @@ CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh rtnetlink.sh
-TEST_PROGS += fib_tests.sh fib-onlink-tests.sh pmtu.sh
+TEST_PROGS += fib_tests.sh fib-onlink-tests.sh in_netns.sh pmtu.sh
 TEST_GEN_FILES =  socket
 TEST_GEN_FILES += psock_fanout psock_tpacket msg_zerocopy
 TEST_GEN_PROGS = reuseport_bpf reuseport_bpf_cpu reuseport_bpf_numa
-- 
2.16.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
