From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri,  4 May 2018 11:17:25 +0200
Subject: [PATCH] selftests: net: add udpgso* to TEST_GEN_FILES
Message-ID: <20180504091725.24977-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180504091725.YhhJda0acPb1XhuizP7mOX7PJ2TpUjtrdFUzVRnx5as@z>

The generated files udpgso* shouldn't be part of TEST_PROGS, they are
used by udpgso.sh and udpgsp_bench.sh. They should be added to the
TEST_GEN_FILES to get installed without being added to the main
run_kselftest.sh script.

Fixes: 3a687bef148d ("selftests: udp gso benchmark")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/net/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 44895de1a0c4..f0363387ef2f 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -11,9 +11,9 @@ TEST_GEN_PROGS_EXTENDED := in_netns.sh
 TEST_GEN_FILES =  socket
 TEST_GEN_FILES += psock_fanout psock_tpacket msg_zerocopy
 TEST_GEN_FILES += tcp_mmap tcp_inq
+TEST_GEN_FILES += udpgso udpgso_bench_tx udpgso_bench_rx
 TEST_GEN_PROGS = reuseport_bpf reuseport_bpf_cpu reuseport_bpf_numa
 TEST_GEN_PROGS += reuseport_dualstack reuseaddr_conflict
-TEST_GEN_PROGS += udpgso udpgso_bench_tx udpgso_bench_rx
 
 include ../lib.mk
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
