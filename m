From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:50:28 +0200
Subject: [PATCH net-next 08/13] selftests: mlxsw: Add target for router test
 on spectrum
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <8729470ff63bc4c4f546d3ca445f83743aeaef91.1530319109.git.petrm@mellanox.com>

From: Yuval Mintz <yuvalm at mellanox.com>

IPv4 routes in Spectrum are based on the kvd single-hash, but as it's
a hash we need to assume we cannot reach 100% of its capacity.

Add a wrapper that provides us with good/bad target numbers for the
Spectrum ASIC.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
Reviewed-by: Petr Machata <petrm at mellanox.com>
[petrm at mellanox.com: Drop shebang.]
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../drivers/net/mlxsw/spectrum/router_scale.sh         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/router_scale.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/router_scale.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/router_scale.sh
new file mode 100644
index 000000000000..21c4697d5bab
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/router_scale.sh
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+source ../router_scale.sh
+
+router_get_target()
+{
+	local should_fail=$1
+	local target
+
+	target=$(devlink_resource_size_get kvd hash_single)
+
+	if [[ $should_fail -eq 0 ]]; then
+		target=$((target * 85 / 100))
+	else
+		target=$((target + 1))
+	fi
+
+	echo $target
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
