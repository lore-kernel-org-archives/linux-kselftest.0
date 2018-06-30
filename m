From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:48:12 +0200
Subject: [PATCH net-next 05/13] selftests: mlxsw: Add devlink_lib_spectrum.sh
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <ee04f82f335af582d55b06dc706a5aadd9e3c50a.1530319109.git.petrm@mellanox.com>

This library builds on top of devlink_lib.sh and contains functionality
specific to Spectrum ASICs, e.g., re-partitioning the various KVD
sub-parts.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
[petrm at mellanox.com: Split this out from another patch. Fix line length
in devlink_sp_read_kvd_defaults().]
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 MAINTAINERS                                        |   1 +
 .../net/mlxsw/spectrum/devlink_lib_spectrum.sh     | 119 +++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_lib_spectrum.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index f3e766e504d8..f3dd6c4f61e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9154,6 +9154,7 @@ S:	Supported
 W:	http://www.mellanox.com
 Q:	http://patchwork.ozlabs.org/project/netdev/list/
 F:	drivers/net/ethernet/mellanox/mlxsw/
+F:	tools/testing/selftests/drivers/net/mlxsw/
 
 MELLANOX FIRMWARE FLASH LIBRARY (mlxfw)
 M:	mlxsw at mellanox.com
diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_lib_spectrum.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_lib_spectrum.sh
new file mode 100644
index 000000000000..73035e25085d
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_lib_spectrum.sh
@@ -0,0 +1,119 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source "../../../../net/forwarding/devlink_lib.sh"
+
+if [ "$DEVLINK_VIDDID" != "15b3:cb84" ]; then
+	echo "SKIP: test is tailored for Mellanox Spectrum"
+	exit 1
+fi
+
+# Needed for returning to default
+declare -A KVD_DEFAULTS
+
+KVD_CHILDREN="linear hash_single hash_double"
+KVDL_CHILDREN="singles chunks large_chunks"
+
+devlink_sp_resource_minimize()
+{
+	local size
+	local i
+
+	for i in $KVD_CHILDREN; do
+		size=$(devlink_resource_get kvd "$i" | jq '.["size_min"]')
+		devlink_resource_size_set "$size" kvd "$i"
+	done
+
+	for i in $KVDL_CHILDREN; do
+		size=$(devlink_resource_get kvd linear "$i" | \
+		       jq '.["size_min"]')
+		devlink_resource_size_set "$size" kvd linear "$i"
+	done
+}
+
+devlink_sp_size_kvd_to_default()
+{
+	local need_reload=0
+	local i
+
+	for i in $KVD_CHILDREN; do
+		local size=$(echo "${KVD_DEFAULTS[kvd_$i]}" | jq '.["size"]')
+		current_size=$(devlink_resource_size_get kvd "$i")
+
+		if [ "$size" -ne "$current_size" ]; then
+			devlink_resource_size_set "$size" kvd "$i"
+			need_reload=1
+		fi
+	done
+
+	for i in $KVDL_CHILDREN; do
+		local size=$(echo "${KVD_DEFAULTS[kvd_linear_$i]}" | \
+			     jq '.["size"]')
+		current_size=$(devlink_resource_size_get kvd linear "$i")
+
+		if [ "$size" -ne "$current_size" ]; then
+			devlink_resource_size_set "$size" kvd linear "$i"
+			need_reload=1
+		fi
+	done
+
+	if [ "$need_reload" -ne "0" ]; then
+		devlink_reload
+	fi
+}
+
+devlink_sp_read_kvd_defaults()
+{
+	local key
+	local i
+
+	KVD_DEFAULTS[kvd]=$(devlink_resource_get "kvd")
+	for i in $KVD_CHILDREN; do
+		key=kvd_$i
+		KVD_DEFAULTS[$key]=$(devlink_resource_get kvd "$i")
+	done
+
+	for i in $KVDL_CHILDREN; do
+		key=kvd_linear_$i
+		KVD_DEFAULTS[$key]=$(devlink_resource_get kvd linear "$i")
+	done
+}
+
+KVD_PROFILES="default scale ipv4_max"
+
+devlink_sp_resource_kvd_profile_set()
+{
+	local profile=$1
+
+	case "$profile" in
+	scale)
+		devlink_resource_size_set 64000 kvd linear
+		devlink_resource_size_set 15616 kvd linear singles
+		devlink_resource_size_set 32000 kvd linear chunks
+		devlink_resource_size_set 16384 kvd linear large_chunks
+		devlink_resource_size_set 128000 kvd hash_single
+		devlink_resource_size_set 48000 kvd hash_double
+		devlink_reload
+		;;
+	ipv4_max)
+		devlink_resource_size_set 64000 kvd linear
+		devlink_resource_size_set 15616 kvd linear singles
+		devlink_resource_size_set 32000 kvd linear chunks
+		devlink_resource_size_set 16384 kvd linear large_chunks
+		devlink_resource_size_set 144000 kvd hash_single
+		devlink_resource_size_set 32768 kvd hash_double
+		devlink_reload
+		;;
+	default)
+		devlink_resource_size_set 98304 kvd linear
+		devlink_resource_size_set 16384 kvd linear singles
+		devlink_resource_size_set 49152 kvd linear chunks
+		devlink_resource_size_set 32768 kvd linear large_chunks
+		devlink_resource_size_set 87040 kvd hash_single
+		devlink_resource_size_set 60416 kvd hash_double
+		devlink_reload
+		;;
+	*)
+		check_err 1 "Unknown profile $profile"
+	esac
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
