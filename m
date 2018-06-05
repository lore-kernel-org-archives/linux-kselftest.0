From: petrm@mellanox.com (Petr Machata)
Date: Tue, 05 Jun 2018 15:07:12 +0200
Subject: [PATCH net-next] selftests: forwarding: Fix importing dependent
 libraries
Message-ID:
 <1ee588d3867b411485be29e45ebbda050920544c.1528203928.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180605130712.8L2KES4QwbumqihfTNVvH96d2oh6tHvBaOIZ5llJGUw@z>

When libraries are sourced from elsewhere from the tree, such as the
testing/selftests/drivers/net/mlxsw subdirectory, sourcing their own
dependencies directly by name doesn't work. Thus running mirror_gre.sh
from that subdirectory results in the following cascade of errors:

./../../../net/forwarding/mirror_gre_lib.sh: line 3: mirror_lib.sh: No such file or directory
./../../../net/forwarding/mirror_gre_topo_lib.sh: line 36: mirror_topo_lib.sh: No such file or directory
./../../../net/forwarding/mirror_gre_topo_lib.sh: line 80: mirror_topo_h1_create: command not found
./../../../net/forwarding/mirror_gre_topo_lib.sh: line 81: mirror_topo_h2_create: command not found
./../../../net/forwarding/mirror_gre_topo_lib.sh: line 40: mirror_topo_h3_create: command not found
[...]

Fix by relying on $relative_path, set up by lib.sh, which should be
imported by the test in question anyway, and source the file using
relative path appropriate for the subdirectory.

Fixes: d5ea2bfc806a ("selftests: forwarding: mirror_gre_lib: Extract generic functions")
Fixes: 74ed089d48a4 ("selftests: forwarding: Split mirror_gre_topo_lib.sh")
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_lib.sh      | 2 +-
 tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index 619b469..1388845 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-source mirror_lib.sh
+source "$relative_path/mirror_lib.sh"
 
 quick_test_span_gre_dir_ips()
 {
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
index 2534195..39c03e2 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
@@ -33,7 +33,7 @@
 #   |                                                                         |
 #   +-------------------------------------------------------------------------+
 
-source mirror_topo_lib.sh
+source "$relative_path/mirror_topo_lib.sh"
 
 mirror_gre_topo_h3_create()
 {
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
