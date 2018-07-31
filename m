From: petrm at mellanox.com (Petr Machata)
Date: Wed, 01 Aug 2018 00:36:03 +0200
Subject: [PATCH net-next v2 1/7] net: ipv4: Control SKB reprioritization after
 forwarding
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-ID: <f73a1f0944d84e75e8bb0b3ee4240561ae2e0f12.1533076217.git.petrm@mellanox.com>

After IPv4 packets are forwarded, the priority of the corresponding SKB
is updated according to the TOS field of IPv4 header. This overrides any
prioritization done earlier by e.g. an skbedit action or ingress-qos-map
defined at a vlan device.

Such overriding may not always be desirable. Even if the packet ends up
being routed, which implies this is an L3 network node, an administrator
may wish to preserve whatever prioritization was done earlier on in the
pipeline.

Therefore introduce a sysctl that controls this behavior. Keep the
default value at 1 to maintain backward-compatible behavior.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 Documentation/networking/ip-sysctl.txt | 9 +++++++++
 include/net/netns/ipv4.h               | 1 +
 net/ipv4/af_inet.c                     | 1 +
 net/ipv4/ip_forward.c                  | 3 ++-
 net/ipv4/sysctl_net_ipv4.c             | 9 +++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 77c37fb0b6a6..e74515ecaa9c 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -81,6 +81,15 @@ fib_multipath_hash_policy - INTEGER
 	0 - Layer 3
 	1 - Layer 4
 
+ip_forward_update_priority - INTEGER
+	Whether to update SKB priority from "TOS" field in IPv4 header after it
+	is forwarded. The new SKB priority is mapped from TOS field value
+	according to an rt_tos2priority table (see e.g. man tc-prio).
+	Default: 1 (Update priority.)
+	Possible values:
+	0 - Do not update priority.
+	1 - Update priority.
+
 route/max_size - INTEGER
 	Maximum number of routes allowed in the kernel.  Increase
 	this when using large numbers of interfaces and/or routes.
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index 661348f23ea5..e47503b4e4d1 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -98,6 +98,7 @@ struct netns_ipv4 {
 	int sysctl_ip_default_ttl;
 	int sysctl_ip_no_pmtu_disc;
 	int sysctl_ip_fwd_use_pmtu;
+	int sysctl_ip_fwd_update_priority;
 	int sysctl_ip_nonlocal_bind;
 	/* Shall we try to damage output packets if routing dev changes? */
 	int sysctl_ip_dynaddr;
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index f2a0a3bab6b5..8eb6c74819b8 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
 	 * We set them here, in case sysctl is not compiled.
 	 */
 	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
+	net->ipv4.sysctl_ip_fwd_update_priority = 1;
 	net->ipv4.sysctl_ip_dynaddr = 0;
 	net->ipv4.sysctl_ip_early_demux = 1;
 	net->ipv4.sysctl_udp_early_demux = 1;
diff --git a/net/ipv4/ip_forward.c b/net/ipv4/ip_forward.c
index b54b948b0596..32662e9e5d21 100644
--- a/net/ipv4/ip_forward.c
+++ b/net/ipv4/ip_forward.c
@@ -143,7 +143,8 @@ int ip_forward(struct sk_buff *skb)
 	    !skb_sec_path(skb))
 		ip_rt_send_redirect(skb);
 
-	skb->priority = rt_tos2priority(iph->tos);
+	if (net->ipv4.sysctl_ip_fwd_update_priority)
+		skb->priority = rt_tos2priority(iph->tos);
 
 	return NF_HOOK(NFPROTO_IPV4, NF_INET_FORWARD,
 		       net, NULL, skb, skb->dev, rt->dst.dev,
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 5fa335fd3852..e21dda015513 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -664,6 +664,15 @@ static struct ctl_table ipv4_net_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 	{
+		.procname	= "ip_forward_update_priority",
+		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler   = proc_dointvec_minmax,
+		.extra1		= &zero,
+		.extra2		= &one,
+	},
+	{
 		.procname	= "ip_nonlocal_bind",
 		.data		= &init_net.ipv4.sysctl_ip_nonlocal_bind,
 		.maxlen		= sizeof(int),
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
