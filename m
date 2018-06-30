From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:53:14 +0200
Subject: [PATCH net-next 12/13] selftests: mlxsw: Add target for
 mirror-to-gretap test on spectrum
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <2af58bda5021e2ca100c34793890ea6c83cae050.1530319109.git.petrm@mellanox.com>

Add a wrapper around mlxsw/mirror_gre_scale.sh that parameterized number
of offloadable mirrors on Spectrum machines.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Jiri Pirko <jiri at mellanox.com>
---
 .../drivers/net/mlxsw/spectrum/mirror_gre_scale.sh          | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/mirror_gre_scale.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/mirror_gre_scale.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/mirror_gre_scale.sh
new file mode 100644
index 000000000000..8d2186c7c62b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/mirror_gre_scale.sh
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+source ../mirror_gre_scale.sh
+
+mirror_gre_get_target()
+{
+	local should_fail=$1; shift
+
+	if ((! should_fail)); then
+		echo 3
+	else
+		echo 4
+	fi
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
