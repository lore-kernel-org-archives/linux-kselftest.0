From: sdf@google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 21:39:54 -0800
Subject: [PATCH v3 bpf-next 1/4] selftests/bpf: rename flow dissector section
 to flow_dissector
In-Reply-To: <20181108053957.205681-1-sdf@google.com>
References: <20181108053957.205681-1-sdf@google.com>
Message-ID: <20181108053957.205681-2-sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108053954.9lnoYT-HnlBVVyZ_HE7QTPODhPpqTMyvYvbtRH5ZpBU@z>

Makes it compatible with the logic that derives program type
from section name in libbpf_prog_type_by_name.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/testing/selftests/bpf/bpf_flow.c             | 2 +-
 tools/testing/selftests/bpf/test_flow_dissector.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_flow.c b/tools/testing/selftests/bpf/bpf_flow.c
index 107350a7821d..b9798f558ca7 100644
--- a/tools/testing/selftests/bpf/bpf_flow.c
+++ b/tools/testing/selftests/bpf/bpf_flow.c
@@ -116,7 +116,7 @@ static __always_inline int parse_eth_proto(struct __sk_buff *skb, __be16 proto)
 	return BPF_DROP;
 }
 
-SEC("dissect")
+SEC("flow_dissector")
 int _dissect(struct __sk_buff *skb)
 {
 	if (!skb->vlan_present)
diff --git a/tools/testing/selftests/bpf/test_flow_dissector.sh b/tools/testing/selftests/bpf/test_flow_dissector.sh
index c0fb073b5eab..d23d4da66b83 100755
--- a/tools/testing/selftests/bpf/test_flow_dissector.sh
+++ b/tools/testing/selftests/bpf/test_flow_dissector.sh
@@ -59,7 +59,7 @@ else
 fi
 
 # Attach BPF program
-./flow_dissector_load -p bpf_flow.o -s dissect
+./flow_dissector_load -p bpf_flow.o -s flow_dissector
 
 # Setup
 tc qdisc add dev lo ingress
-- 
2.19.1.930.g4563a0d9d0-goog
