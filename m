From: sergey.senozhatsky@gmail.com (Sergey Senozhatsky)
Date: Wed, 20 Mar 2019 21:53:35 +0900
Subject: [PATCHv2 bpf-next 3/3] bpf, tests: don't use __bpf_constant_htons()
In-Reply-To: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
Message-ID: <20190320125335.19621-3-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320125335.C0-S3keHTWnuKnaVI1cgjDmShLtv6hnMwbz4B0Sgq-8@z>

Prefer bpf_htons() instead.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 4 ++--
 tools/testing/selftests/bpf/test_progs.c                | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
index bcbd928c96ab..a194305f98d1 100644
--- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
+++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
@@ -28,7 +28,7 @@ static struct bpf_flow_keys pkt_v4_flow_keys = {
 	.thoff = sizeof(struct iphdr),
 	.addr_proto = ETH_P_IP,
 	.ip_proto = IPPROTO_TCP,
-	.n_proto = __bpf_constant_htons(ETH_P_IP),
+	.n_proto = bpf_htons(ETH_P_IP),
 };
 
 static struct bpf_flow_keys pkt_v6_flow_keys = {
@@ -36,7 +36,7 @@ static struct bpf_flow_keys pkt_v6_flow_keys = {
 	.thoff = sizeof(struct ipv6hdr),
 	.addr_proto = ETH_P_IPV6,
 	.ip_proto = IPPROTO_TCP,
-	.n_proto = __bpf_constant_htons(ETH_P_IPV6),
+	.n_proto = bpf_htons(ETH_P_IPV6),
 };
 
 void test_flow_dissector(void)
diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 5d10aee9e277..909b339f97f4 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -11,18 +11,18 @@ int error_cnt, pass_cnt;
 bool jit_enabled;
 
 struct ipv4_packet pkt_v4 = {
-	.eth.h_proto = __bpf_constant_htons(ETH_P_IP),
+	.eth.h_proto = bpf_htons(ETH_P_IP),
 	.iph.ihl = 5,
 	.iph.protocol = IPPROTO_TCP,
-	.iph.tot_len = __bpf_constant_htons(MAGIC_BYTES),
+	.iph.tot_len = bpf_htons(MAGIC_BYTES),
 	.tcp.urg_ptr = 123,
 	.tcp.doff = 5,
 };
 
 struct ipv6_packet pkt_v6 = {
-	.eth.h_proto = __bpf_constant_htons(ETH_P_IPV6),
+	.eth.h_proto = bpf_htons(ETH_P_IPV6),
 	.iph.nexthdr = IPPROTO_TCP,
-	.iph.payload_len = __bpf_constant_htons(MAGIC_BYTES),
+	.iph.payload_len = bpf_htons(MAGIC_BYTES),
 	.tcp.urg_ptr = 123,
 	.tcp.doff = 5,
 };
-- 
2.21.0
