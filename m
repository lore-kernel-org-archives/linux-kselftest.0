From: alan.maguire@oracle.com (Alan Maguire)
Date: Mon,  1 Apr 2019 16:32:10 +0100
Subject: [PATCH bpf-next 3/4] bpf: sync bpf.h to tools/ for
 BPF_F_ADJ_ROOM_ENCAP_L2
In-Reply-To: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
Message-ID: <1554132731-3095-4-git-send-email-alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190401153210.CmQSiEScj_E-N74iPf9dlOsy_OX9Vv6RnG_0oCbiUaQ@z>

Sync include/uapi/linux/bpf.h with tools/ equivalent to add
BPF_F_ADJ_ROOM_ENCAP_L2(len) macro.

Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
---
 tools/include/uapi/linux/bpf.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 8370245..6d8346a 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -1500,6 +1500,10 @@ struct bpf_stack_build_id {
  *		* **BPF_F_ADJ_ROOM_ENCAP_L4_UDP **:
  *		  Use with ENCAP_L3 flags to further specify the tunnel type.
  *
+ *		* **BPF_F_ADJ_ROOM_ENCAP_L2(len) **:
+ *		  Use with ENCAP_L3/L4 flags to further specify the tunnel
+ *		  type; **len** is the length of the inner MAC header.
+ *
  * 		A call to this helper is susceptible to change the underlaying
  * 		packet buffer. Therefore, at load time, all checks on pointers
  * 		previously done by the verifier are invalidated and must be
@@ -2645,6 +2649,7 @@ enum bpf_func_id {
 #define BPF_F_ADJ_ROOM_ENCAP_L3_IPV6	(1ULL << 2)
 #define BPF_F_ADJ_ROOM_ENCAP_L4_GRE	(1ULL << 3)
 #define BPF_F_ADJ_ROOM_ENCAP_L4_UDP	(1ULL << 4)
+#define	BPF_F_ADJ_ROOM_ENCAP_L2(len)	(((__u64)len & 0xff) << 56)
 
 /* Mode for BPF_FUNC_skb_adjust_room helper. */
 enum bpf_adj_room_mode {
-- 
1.8.3.1
