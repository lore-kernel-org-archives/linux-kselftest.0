From: petrm@mellanox.com (Petr Machata)
Date: Wed, 01 Aug 2018 00:37:36 +0200
Subject: [PATCH net-next v2 3/7] mlxsw: spectrum: Extract work-scheduling into
 a new function
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-ID:
 <81de49a9f677be1d741076e7f4aabb90bbc441cf.1533076217.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731223736.XbyAIsvQ35ZQ0cZS2yvbK1zPkKPD0Lh2UQ84VuCoGzc@z>

The boilerplate to schedule NETEVENT_IPV4_MPATH_HASH_UPDATE and
NETEVENT_IPV6_MPATH_HASH_UPDATE handling is almost equivalent to that of
NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE that's coming in the next
patch. The only difference is which actual worker function should be
called. Extract this boilerplate into a named function in order to allow
reuse.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/ethernet/mellanox/mlxsw/spectrum_router.c  | 38 +++++++++++++---------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 8d67f0123699..5ee927626567 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -2436,17 +2436,36 @@ static void mlxsw_sp_router_mp_hash_event_work(struct work_struct *work)
 	kfree(net_work);
 }
 
+static int mlxsw_sp_router_schedule_work(struct net *net,
+					 struct notifier_block *nb,
+					 void (*cb)(struct work_struct *))
+{
+	struct mlxsw_sp_netevent_work *net_work;
+	struct mlxsw_sp_router *router;
+
+	if (!net_eq(net, &init_net))
+		return NOTIFY_DONE;
+
+	net_work = kzalloc(sizeof(*net_work), GFP_ATOMIC);
+	if (!net_work)
+		return NOTIFY_BAD;
+
+	router = container_of(nb, struct mlxsw_sp_router, netevent_nb);
+	INIT_WORK(&net_work->work, cb);
+	net_work->mlxsw_sp = router->mlxsw_sp;
+	mlxsw_core_schedule_work(&net_work->work);
+	return NOTIFY_DONE;
+}
+
 static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 					  unsigned long event, void *ptr)
 {
 	struct mlxsw_sp_netevent_work *net_work;
 	struct mlxsw_sp_port *mlxsw_sp_port;
-	struct mlxsw_sp_router *router;
 	struct mlxsw_sp *mlxsw_sp;
 	unsigned long interval;
 	struct neigh_parms *p;
 	struct neighbour *n;
-	struct net *net;
 
 	switch (event) {
 	case NETEVENT_DELAY_PROBE_TIME_UPDATE:
@@ -2500,20 +2519,9 @@ static int mlxsw_sp_router_netevent_event(struct notifier_block *nb,
 		break;
 	case NETEVENT_IPV4_MPATH_HASH_UPDATE:
 	case NETEVENT_IPV6_MPATH_HASH_UPDATE:
-		net = ptr;
+		return mlxsw_sp_router_schedule_work(ptr, nb,
+				mlxsw_sp_router_mp_hash_event_work);
 
-		if (!net_eq(net, &init_net))
-			return NOTIFY_DONE;
-
-		net_work = kzalloc(sizeof(*net_work), GFP_ATOMIC);
-		if (!net_work)
-			return NOTIFY_BAD;
-
-		router = container_of(nb, struct mlxsw_sp_router, netevent_nb);
-		INIT_WORK(&net_work->work, mlxsw_sp_router_mp_hash_event_work);
-		net_work->mlxsw_sp = router->mlxsw_sp;
-		mlxsw_core_schedule_work(&net_work->work);
-		break;
 	}
 
 	return NOTIFY_DONE;
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
