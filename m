From: petrm@mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:48:27 +0200
Subject: [PATCH net-next 06/13] selftests: mlxsw: Add devlink KVD resource test
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID:
 <812360f52f4f3a670c7432784f775f36749b9b0e.1530319109.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180630004827.d3uA_HPODCT1qpSNNobYxIyNBR-tajmOnfoH0SSIlNQ@z>

From: Yuval Mintz <yuvalm@mellanox.com>

Add a selftest that can be used to perform basic sanity of the devlink
resource API as well as test the behavior of KVD manipulation in the
driver.

This is the first case of a HW-only test - in order to test the devlink
resource a driver capable of exposing resources has to be provided
first.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
[petrm at mellanox.com: Extracted two patches out of this patch. Tweaked
commit message.]
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/mlxsw/spectrum/devlink_resources.sh        | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_resources.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_resources.sh b/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_resources.sh
new file mode 100755
index 000000000000..b1fe960e398a
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_resources.sh
@@ -0,0 +1,117 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=1
+source devlink_lib_spectrum.sh
+
+setup_prepare()
+{
+	devlink_sp_read_kvd_defaults
+}
+
+cleanup()
+{
+	pre_cleanup
+	devlink_sp_size_kvd_to_default
+}
+
+trap cleanup EXIT
+
+setup_prepare
+
+profiles_test()
+{
+	local i
+
+	log_info "Running profile tests"
+
+	for i in $KVD_PROFILES; do
+		RET=0
+		devlink_sp_resource_kvd_profile_set $i
+		log_test "'$i' profile"
+	done
+
+	# Default is explicitly tested at end to ensure it's actually applied
+	RET=0
+	devlink_sp_resource_kvd_profile_set "default"
+	log_test "'default' profile"
+}
+
+resources_min_test()
+{
+	local size
+	local i
+	local j
+
+	log_info "Running KVD-minimum tests"
+
+	for i in $KVD_CHILDREN; do
+		RET=0
+		size=$(devlink_resource_get kvd "$i" | jq '.["size_min"]')
+		devlink_resource_size_set "$size" kvd "$i"
+
+		# In case of linear, need to minimize sub-resources as well
+		if [[ "$i" == "linear" ]]; then
+			for j in $KVDL_CHILDREN; do
+				devlink_resource_size_set 0 kvd linear "$j"
+			done
+		fi
+
+		devlink_reload
+		devlink_sp_size_kvd_to_default
+		log_test "'$i' minimize [$size]"
+	done
+}
+
+resources_max_test()
+{
+	local min_size
+	local size
+	local i
+	local j
+
+	log_info "Running KVD-maximum tests"
+	for i in $KVD_CHILDREN; do
+		RET=0
+		devlink_sp_resource_minimize
+
+		# Calculate the maximum possible size for the given partition
+		size=$(devlink_resource_size_get kvd)
+		for j in $KVD_CHILDREN; do
+			if [ "$i" != "$j" ]; then
+				min_size=$(devlink_resource_get kvd "$j" | \
+					   jq '.["size_min"]')
+				size=$((size - min_size))
+			fi
+		done
+
+		# Test almost maximum size
+		devlink_resource_size_set "$((size - 128))" kvd "$i"
+		devlink_reload
+		log_test "'$i' almost maximize [$((size - 128))]"
+
+		# Test above maximum size
+		devlink resource set "$DEVLINK_DEV" \
+			path "kvd/$i" size $((size + 128)) &> /dev/null
+		check_fail $? "Set kvd/$i to size $((size + 128)) should fail"
+		log_test "'$i' Overflow rejection [$((size + 128))]"
+
+		# Test maximum size
+		if [ "$i" == "hash_single" ] || [ "$i" == "hash_double" ]; then
+			echo "SKIP: Observed problem with exact max $i"
+			continue
+		fi
+
+		devlink_resource_size_set "$size" kvd "$i"
+		devlink_reload
+		log_test "'$i' maximize [$size]"
+
+		devlink_sp_size_kvd_to_default
+	done
+}
+
+profiles_test
+resources_min_test
+resources_max_test
+
+exit "$RET"
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
