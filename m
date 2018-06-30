From: petrm@mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:47:08 +0200
Subject: [PATCH net-next 04/13] selftests: forwarding: Add devlink_lib.sh
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID:
 <ccad563f22e2927c3fca015c6d5ab195607c4511.1530319109.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180630004708.SA89QegzTD4lP7VXLvQvTaFNFTvCDi4_S_y5ddofdr0@z>

This helper library contains wrappers to devlink functionality agnostic
to the underlying device.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
[petrm at mellanox.com: Split this out from another patch.]
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/devlink_lib.sh        | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 tools/testing/selftests/net/forwarding/devlink_lib.sh

diff --git a/tools/testing/selftests/net/forwarding/devlink_lib.sh b/tools/testing/selftests/net/forwarding/devlink_lib.sh
new file mode 100644
index 000000000000..5ab1e5f43022
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/devlink_lib.sh
@@ -0,0 +1,108 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+##############################################################################
+# Source library
+
+relative_path="${BASH_SOURCE%/*}"
+if [[ "$relative_path" == "${BASH_SOURCE}" ]]; then
+	relative_path="."
+fi
+
+source "$relative_path/lib.sh"
+
+##############################################################################
+# Defines
+
+DEVLINK_DEV=$(devlink port show | grep "${NETIFS[p1]}" | \
+	      grep -v "${NETIFS[p1]}[0-9]" | cut -d" " -f1 | \
+	      rev | cut -d"/" -f2- | rev)
+if [ -z "$DEVLINK_DEV" ]; then
+	echo "SKIP: ${NETIFS[p1]} has no devlink device registered for it"
+	exit 1
+fi
+if [[ "$(echo $DEVLINK_DEV | grep -c pci)" -eq 0 ]]; then
+	echo "SKIP: devlink device's bus is not PCI"
+	exit 1
+fi
+
+DEVLINK_VIDDID=$(lspci -s $(echo $DEVLINK_DEV | cut -d"/" -f2) \
+		 -n | cut -d" " -f3)
+
+##############################################################################
+# Sanity checks
+
+devlink -j resource show "$DEVLINK_DEV" &> /dev/null
+if [ $? -ne 0 ]; then
+	echo "SKIP: iproute2 too old, missing devlink resource support"
+	exit 1
+fi
+
+##############################################################################
+# Devlink helpers
+
+devlink_resource_names_to_path()
+{
+	local resource
+	local path=""
+
+	for resource in "${@}"; do
+		if [ "$path" == "" ]; then
+			path="$resource"
+		else
+			path="${path}/$resource"
+		fi
+	done
+
+	echo "$path"
+}
+
+devlink_resource_get()
+{
+	local name=$1
+	local resource_name=.[][\"$DEVLINK_DEV\"]
+
+	resource_name="$resource_name | .[] | select (.name == \"$name\")"
+
+	shift
+	for resource in "${@}"; do
+		resource_name="${resource_name} | .[\"resources\"][] | \
+			       select (.name == \"$resource\")"
+	done
+
+	devlink -j resource show "$DEVLINK_DEV" | jq "$resource_name"
+}
+
+devlink_resource_size_get()
+{
+	local size=$(devlink_resource_get "$@" | jq '.["size_new"]')
+
+	if [ "$size" == "null" ]; then
+		devlink_resource_get "$@" | jq '.["size"]'
+	else
+		echo "$size"
+	fi
+}
+
+devlink_resource_size_set()
+{
+	local new_size=$1
+	local path
+
+	shift
+	path=$(devlink_resource_names_to_path "$@")
+	devlink resource set "$DEVLINK_DEV" path "$path" size "$new_size"
+	check_err $? "Failed setting path $path to size $size"
+}
+
+devlink_reload()
+{
+	local still_pending
+
+	devlink dev reload "$DEVLINK_DEV" &> /dev/null
+	check_err $? "Failed reload"
+
+	still_pending=$(devlink resource show "$DEVLINK_DEV" | \
+			grep -c "size_new")
+	check_err $still_pending "Failed reload - There are still unset sizes"
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
