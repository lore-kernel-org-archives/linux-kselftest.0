From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue,  8 Jan 2019 10:23:03 +0100
Subject: [PATCH] selftests: bpf: install files tcp_(server|client)*.py
Message-ID: <20190108092303.12597-1-anders.roxell@linaro.org>

When test_tcpbpf_user runs it complains that it can't find files
tcp_server.py and tcp_client.py.

Rework so that tcp_server.py and tcp_client.py gets installed, added them
to the variable TEST_PROGS_EXTENDED.

Fixes: d6d4f60c3a09 ("bpf: add selftest for tcpbpf")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 73aa6d8f4a2f..70229de510f5 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -55,7 +55,9 @@ TEST_PROGS := test_kmod.sh \
 	test_flow_dissector.sh \
 	test_xdp_vlan.sh
 
-TEST_PROGS_EXTENDED := with_addr.sh
+TEST_PROGS_EXTENDED := with_addr.sh \
+	tcp_client.py \
+	tcp_server.py
 
 # Compile but not part of 'make run_tests'
 TEST_GEN_PROGS_EXTENDED = test_libbpf_open test_sock_addr test_skb_cgroup_id_user \
-- 
2.20.1
