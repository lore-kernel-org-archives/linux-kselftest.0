From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:07 +0000
Subject: [PATCH net-next 01/18] net: skb_scrub_packet(): Scrub offload_fwd_mark
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-2-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

When a packet is trapped and the corresponding SKB marked as
already-forwarded, it retains this marking even after it is forwarded
across veth links into another bridge. There, since it ingresses the
bridge over veth, which doesn't have offload_fwd_mark, it triggers a
warning in nbp_switchdev_frame_mark().

Then nbp_switchdev_allowed_egress() decides not to allow egress from
this bridge through another veth, because the SKB is already marked, and
the mark (of 0) of course matches. Thus the packet is incorrectly
blocked.

Solve by resetting offload_fwd_mark() in skb_scrub_packet(). That
function is called from tunnels and also from veth, and thus catches the
cases where traffic is forwarded between bridges and transformed in a
way that invalidates the marking.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Suggested-by: Ido Schimmel <idosch at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 net/core/skbuff.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a1be7f19d998..9a8a72cefe9b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4882,6 +4882,11 @@ void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 	nf_reset(skb);
 	nf_reset_trace(skb);
 
+#ifdef CONFIG_NET_SWITCHDEV
+	skb->offload_fwd_mark = 0;
+	skb->offload_mr_fwd_mark = 0;
+#endif
+
 	if (!xnet)
 		return;
 
-- 
2.19.1
