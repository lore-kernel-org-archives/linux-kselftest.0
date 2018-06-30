From: petrm@mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:51:55 +0200
Subject: [PATCH net-next 10/13] selftests: mlxsw: Add target for tc flower
 test on spectrum
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID:
 <0951b6867b33720ffacd94d6e4bc24f47e586d47.1530319109.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180630005155.pCeVfHfWwSl92cGEiuvfwebwSFESCeuARbKP0fJjHco@z>

Add a wrapper around mlxsw/tc_flower_scale.sh that parameterizes the
generic tc flower scale test template with Spectrum-specific target
values.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Yuval Mintz <yuvalm at mellanox.com>
---
 .../drivers/net/mlxsw/spectrum/tc_flower_scale.sh     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/tc_flower_scale.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/tc_flower_scale.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/tc_flower_scale.sh
new file mode 100644
index 000000000000..f9bfd8937765
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/tc_flower_scale.sh
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+source ../tc_flower_scale.sh
+
+tc_flower_get_target()
+{
+	local should_fail=$1; shift
+
+	# 6144 (6x1024) is the theoretical maximum.
+	# One bank of 512 rules is taken by the 18-byte MC router rule.
+	# One rule is the ACL catch-all.
+	# 6144 - 512 - 1 = 5631
+	local target=5631
+
+	if ((! should_fail)); then
+		echo $target
+	else
+		echo $((target + 1))
+	fi
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
