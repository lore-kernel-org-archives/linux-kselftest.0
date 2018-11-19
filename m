From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:10 +0000
Subject: [PATCH net-next 03/18] selftests: forwarding: lib: Add in_ns()
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-4-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181119161110.mLVuEbUNrhd-p5KVSJzaMtugv5keoqUq5QGHl9QdZ0w@z>

From: Petr Machata <petrm@mellanox.com>

In order to run a certain command inside another network namespace, it's
possible to use "ip netns exec ns command". However then one can't use
functions defined in lib.sh or a test suite.

One option is to do "ip netns exec ns bash -c command", provided that
all functions that one wishes to use (and their dependencies) are
published using "export -f". That may not be practical.

Therefore, introduce a helper in_ns(), which wraps a given command in a
boilerplate of "ip netns exec" and "source lib.sh", thus making all
library functions available. (Custom functions that a script wishes to
run within a namespace still need to be exported.)

Because quotes in "$@" aren't recognized in heredoc, hand-expand the
array in an explicit for loop, leveraging printf %q to handle proper
quoting.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index bb0e9fdf893e..93d6e9df483e 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -783,6 +783,17 @@ multipath_eval()
 	log_info "Expected ratio $weights_ratio Measured ratio $packets_ratio"
 }
 
+in_ns()
+{
+	local name=$1; shift
+
+	ip netns exec $name bash <<-EOF
+		NUM_NETIFS=0
+		source lib.sh
+		$(for a in "$@"; do printf "%q${IFS:0:1}" "$a"; done)
+	EOF
+}
+
 ##############################################################################
 # Tests
 
-- 
2.19.1
