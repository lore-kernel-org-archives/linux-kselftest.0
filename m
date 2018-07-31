From: petrm@mellanox.com (Petr Machata)
Date: Wed, 01 Aug 2018 00:38:03 +0200
Subject: [PATCH net-next v2 4/7] mlxsw: spectrum_router: Handle
 sysctl_ip_fwd_update_priority
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-ID:
 <612b9ef595e1cec62711aade431dfbf721499147.1533076217.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731223803.1Wwbxz2Yw77ZWb3hOIHdSvcFjhndZmGhMRFEj3nPcd0@z>

This sysctl setting controls whether packet priority should be updated
after forwarding. Configure RGCR.usp accordingly so that the device is
in sync with the kernel handling.

Note that RGCR doesn't allow changing arbitrary parameters
mid-operation, however "usp" is exempt and can be reconfigured.

Also react to NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE notifications
that signify change in this configuration.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 5ee927626567..eec7166fad62 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -2436,6 +2436,18 @@ static void mlxsw_sp_router_mp_hash_event_work(struct work_struct *work)
 	kfree(net_work);
 }
 
+static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp);
+
+static void mlxsw_sp_router_update_priority_work(struct work_struct *work)
+{
+	struct mlxsw_sp_netevent_work *net_work =
+		container_of(work, struct mlxsw_sp_netevent_work, work);
+	struct mlxsw_sp *mlxsw_sp = net_work->mlxsw_sp;
+
+	__mlxsw_sp_router_init(mlxsw_sp);
+	kfree(net_work);
+}
+
 static int mlxsw_sp_router_schedule_work(struct net *net,
 					 struct notifier_block *nb,
 					 void (*cb)(struct work_struct *))
@@ -2522,6 +2534,9 @@ static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 		return mlxsw_sp_router_schedule_work(ptr, nb,
 				mlxsw_sp_router_mp_hash_event_work);
 
+	case NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE:
+		return mlxsw_sp_router_schedule_work(ptr, nb,
+				mlxsw_sp_router_update_priority_work);
 	}
 
 	return NOTIFY_DONE;
@@ -7390,6 +7405,7 @@ static int mlxsw_sp_dscp_init(struct mlxsw_sp *mlxsw_sp)
 
 static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp)
 {
+	bool usp = init_net.ipv4.sysctl_ip_fwd_update_priority;
 	char rgcr_pl[MLXSW_REG_RGCR_LEN];
 	u64 max_rifs;
 	int err;
@@ -7400,7 +7416,7 @@ static int __mlxsw_sp_router_init(struct mlxsw_sp *mlxsw_sp)
 
 	mlxsw_reg_rgcr_pack(rgcr_pl, true, true);
 	mlxsw_reg_rgcr_max_router_interfaces_set(rgcr_pl, max_rifs);
-	mlxsw_reg_rgcr_usp_set(rgcr_pl, true);
+	mlxsw_reg_rgcr_usp_set(rgcr_pl, usp);
 	err = mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(rgcr), rgcr_pl);
 	if (err)
 		return err;
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
