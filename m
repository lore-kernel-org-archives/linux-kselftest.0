From: petrm@mellanox.com (Petr Machata)
Date: Wed, 01 Aug 2018 00:36:42 +0200
Subject: [PATCH net-next v2 2/7] net: ipv4: Notify about changes to
 ip_forward_update_priority
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-ID:
 <55313c0467f038b52be81b48c270747848c0ad21.1533076217.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731223642.EbyirhW5iXqFODY1cdd67EVPNVpUKWuRfJer0EZpIEo@z>

Drivers may make offloading decision based on whether
ip_forward_update_priority is enabled or not. Therefore distribute
netevent notifications to give them a chance to react to a change.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 include/net/netevent.h     |  1 +
 net/ipv4/sysctl_net_ipv4.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/net/netevent.h b/include/net/netevent.h
index d9918261701c..4107016c3bb4 100644
--- a/include/net/netevent.h
+++ b/include/net/netevent.h
@@ -28,6 +28,7 @@ enum netevent_notif_type {
 	NETEVENT_DELAY_PROBE_TIME_UPDATE, /* arg is struct neigh_parms ptr */
 	NETEVENT_IPV4_MPATH_HASH_UPDATE, /* arg is struct net ptr */
 	NETEVENT_IPV6_MPATH_HASH_UPDATE, /* arg is struct net ptr */
+	NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE, /* arg is struct net ptr */
 };
 
 int register_netevent_notifier(struct notifier_block *nb);
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index e21dda015513..b92f422f2fa8 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -201,6 +201,23 @@ static int ipv4_ping_group_range(struct ctl_table *table, int write,
 	return ret;
 }
 
+static int ipv4_fwd_update_priority(struct ctl_table *table, int write,
+				    void __user *buffer,
+				    size_t *lenp, loff_t *ppos)
+{
+	struct net *net;
+	int ret;
+
+	net = container_of(table->data, struct net,
+			   ipv4.sysctl_ip_fwd_update_priority);
+	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (write && ret == 0)
+		call_netevent_notifiers(NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE,
+					net);
+
+	return ret;
+}
+
 static int proc_tcp_congestion_control(struct ctl_table *ctl, int write,
 				       void __user *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -668,7 +685,7 @@ static struct ctl_table ipv4_net_table[] = {
 		.data		= &init_net.ipv4.sysctl_ip_fwd_update_priority,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
-		.proc_handler   = proc_dointvec_minmax,
+		.proc_handler   = ipv4_fwd_update_priority,
 		.extra1		= &zero,
 		.extra2		= &one,
 	},
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
