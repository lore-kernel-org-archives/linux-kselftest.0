From: alan.maguire at oracle.com (Alan Maguire)
Date: Mon,  8 Apr 2019 17:57:46 +0100
Subject: [PATCH v2 bpf-next 2/4] bpf: add layer 2 encap support to
 bpf_skb_adjust_room
In-Reply-To: <1554742668-28313-1-git-send-email-alan.maguire@oracle.com>
References: <1554742668-28313-1-git-send-email-alan.maguire@oracle.com>
Message-ID: <1554742668-28313-3-git-send-email-alan.maguire@oracle.com>

commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
introduced support to bpf_skb_adjust_room for GSO-friendly GRE
and UDP encapsulation.

For GSO to work for skbs, the inner headers (mac and network) need to
be marked.  For L3 encapsulation using bpf_skb_adjust_room, the mac
and network headers are identical.  Here we provide a way of specifying
the inner mac header length for cases where L2 encap is desired.  Such
an approach can support encapsulated ethernet headers, MPLS headers etc.
For example to convert from a packet of form [eth][ip][tcp] to
[eth][ip][udp][inner mac][ip][tcp], something like the following could
be done:

	headroom = sizeof(iph) + sizeof(struct udphdr) + inner_maclen;

	ret = bpf_skb_adjust_room(skb, headroom, BPF_ADJ_ROOM_MAC,
				  BPF_F_ADJ_ROOM_ENCAP_L4_UDP |
				  BPF_F_ADJ_ROOM_ENCAP_L3_IPV4 |
				  BPF_F_ADJ_ROOM_ENCAP_L2(inner_maclen));

Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
---
 include/uapi/linux/bpf.h | 10 ++++++++++
 net/core/filter.c        | 15 ++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 8370245..912391c 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
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
@@ -2641,10 +2645,16 @@ enum bpf_func_id {
 /* BPF_FUNC_skb_adjust_room flags. */
 #define BPF_F_ADJ_ROOM_FIXED_GSO	(1ULL << 0)
 
+#define	BPF_ADJ_ROOM_ENCAP_L2_MASK	0xff
+#define	BPF_ADJ_ROOM_ENCAP_L2_SHIFT	56
+
 #define BPF_F_ADJ_ROOM_ENCAP_L3_IPV4	(1ULL << 1)
 #define BPF_F_ADJ_ROOM_ENCAP_L3_IPV6	(1ULL << 2)
 #define BPF_F_ADJ_ROOM_ENCAP_L4_GRE	(1ULL << 3)
 #define BPF_F_ADJ_ROOM_ENCAP_L4_UDP	(1ULL << 4)
+#define	BPF_F_ADJ_ROOM_ENCAP_L2(len)	(((__u64)len & \
+					  BPF_ADJ_ROOM_ENCAP_L2_MASK) \
+					 << BPF_ADJ_ROOM_ENCAP_L2_SHIFT)
 
 /* Mode for BPF_FUNC_skb_adjust_room helper. */
 enum bpf_adj_room_mode {
diff --git a/net/core/filter.c b/net/core/filter.c
index 22eb2ed..d6a2bf2 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2969,14 +2969,17 @@ static u32 bpf_skb_net_base_len(const struct sk_buff *skb)
 #define BPF_F_ADJ_ROOM_MASK		(BPF_F_ADJ_ROOM_FIXED_GSO | \
 					 BPF_F_ADJ_ROOM_ENCAP_L3_MASK | \
 					 BPF_F_ADJ_ROOM_ENCAP_L4_GRE | \
-					 BPF_F_ADJ_ROOM_ENCAP_L4_UDP)
+					 BPF_F_ADJ_ROOM_ENCAP_L4_UDP | \
+					 BPF_F_ADJ_ROOM_ENCAP_L2( \
+					  BPF_ADJ_ROOM_ENCAP_L2_MASK))
 
 static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
 			    u64 flags)
 {
+	u16 mac_len = 0, inner_mac = 0, inner_net = 0, inner_trans = 0;
 	bool encap = flags & BPF_F_ADJ_ROOM_ENCAP_L3_MASK;
-	u16 mac_len = 0, inner_net = 0, inner_trans = 0;
 	unsigned int gso_type = SKB_GSO_DODGY;
+	u8 inner_mac_len = flags >> BPF_ADJ_ROOM_ENCAP_L2_SHIFT;
 	int ret;
 
 	if (skb_is_gso(skb) && !skb_is_gso_tcp(skb)) {
@@ -3008,6 +3011,9 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
 
 		mac_len = skb->network_header - skb->mac_header;
 		inner_net = skb->network_header;
+		if (inner_mac_len > len_diff)
+			return -EINVAL;
+		inner_mac = inner_net - inner_mac_len;
 		inner_trans = skb->transport_header;
 	}
 
@@ -3016,8 +3022,7 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
 		return ret;
 
 	if (encap) {
-		/* inner mac == inner_net on l3 encap */
-		skb->inner_mac_header = inner_net;
+		skb->inner_mac_header = inner_mac;
 		skb->inner_network_header = inner_net;
 		skb->inner_transport_header = inner_trans;
 		skb_set_inner_protocol(skb, skb->protocol);
@@ -3031,7 +3036,7 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
 			gso_type |= SKB_GSO_GRE;
 		else if (flags & BPF_F_ADJ_ROOM_ENCAP_L3_IPV6)
 			gso_type |= SKB_GSO_IPXIP6;
-		else
+		else if (flags & BPF_F_ADJ_ROOM_ENCAP_L3_IPV4)
 			gso_type |= SKB_GSO_IPXIP4;
 
 		if (flags & BPF_F_ADJ_ROOM_ENCAP_L4_GRE ||
-- 
1.8.3.1
