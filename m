From: petrm@mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:53:52 +0200
Subject: [PATCH net-next 13/13] selftests: mlxsw: Add scale test for resources
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID:
 <260b40d9a60f3d316c54b270f005353a3e64f394.1530319109.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180630005352.AhfRKoqCOsTARXI73YW1R3d2Il78ApDwGLzt8mtMNr4@z>

From: Yuval Mintz <yuvalm@mellanox.com>

Add a scale test capable of validating that offloaded network
functionality is indeed functional at scale when configured to
the different KVD profiles available.

Start by testing offloaded routes are functional at scale by
passing traffic on each one of them in turn.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../drivers/net/mlxsw/spectrum/resource_scale.sh   | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/spectrum/resource_scale.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/resource_scale.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/resource_scale.sh
new file mode 100755
index 000000000000..a0a80e1a69e8
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/resource_scale.sh
@@ -0,0 +1,55 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=6
+source ../../../../net/forwarding/lib.sh
+source ../../../../net/forwarding/tc_common.sh
+source devlink_lib_spectrum.sh
+
+current_test=""
+
+cleanup()
+{
+	pre_cleanup
+	if [ ! -z $current_test ]; then
+		${current_test}_cleanup
+	fi
+	devlink_sp_size_kvd_to_default
+}
+
+devlink_sp_read_kvd_defaults
+trap cleanup EXIT
+
+ALL_TESTS="router tc_flower mirror_gre"
+for current_test in ${TESTS:-$ALL_TESTS}; do
+	source ${current_test}_scale.sh
+
+	num_netifs_var=${current_test^^}_NUM_NETIFS
+	num_netifs=${!num_netifs_var:-$NUM_NETIFS}
+
+	for profile in $KVD_PROFILES; do
+		RET=0
+		devlink_sp_resource_kvd_profile_set $profile
+		if [[ $RET -gt 0 ]]; then
+			log_test "'$current_test' [$profile] setting"
+			continue
+		fi
+
+		for should_fail in 0 1; do
+			RET=0
+			target=$(${current_test}_get_target "$should_fail")
+			${current_test}_setup_prepare
+			setup_wait $num_netifs
+			${current_test}_test "$target" "$should_fail"
+			${current_test}_cleanup
+			if [[ "$should_fail" -eq 0 ]]; then
+				log_test "'$current_test' [$profile] $target"
+			else
+				log_test "'$current_test' [$profile] overflow $target"
+			fi
+		done
+	done
+done
+current_test=""
+
+exit "$RET"
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
