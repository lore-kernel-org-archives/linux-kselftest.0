From: petrm at mellanox.com (Petr Machata)
Date: Thu, 03 May 2018 12:36:59 +0200
Subject: [PATCH net-next mlxsw 1/3] selftests: forwarding: lib: Add
 sysctl_set(), sysctl_restore()
In-Reply-To: <cover.1525343276.git.petrm@mellanox.com>
References: <cover.1525343276.git.petrm@mellanox.com>
Message-ID: <60a0bef92054c314e3b7429a464c5f5eb141cb8b.1525343276.git.petrm@mellanox.com>

Add two helper functions: sysctl_set() to change the value of a given
sysctl setting, and sysctl_restore() to change it back to what it was.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 7fe6d27..426b294 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -401,6 +401,23 @@ bridge_ageing_time_get()
 	echo $((ageing_time / 100))
 }
 
+declare -A SYSCTL_ORIG
+sysctl_set()
+{
+	local key=$1; shift
+	local value=$1; shift
+
+	SYSCTL_ORIG[$key]=$(sysctl -n $key)
+	sysctl -qw $key=$value
+}
+
+sysctl_restore()
+{
+	local key=$1; shift
+
+	sysctl -qw $key=${SYSCTL_ORIG["$key"]}
+}
+
 forwarding_enable()
 {
        ipv4_fwd=$(sysctl -n net.ipv4.conf.all.forwarding)
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
