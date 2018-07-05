From: petrm@mellanox.com (Petr Machata)
Date: Thu, 05 Jul 2018 21:10:59 +0200
Subject: [PATCH net-next 1/2] selftests: forwarding: Allow importing dependent
 libraries
In-Reply-To: <cover.1530816800.git.petrm@mellanox.com>
References: <cover.1530816800.git.petrm@mellanox.com>
Message-ID:
 <f4ab79eb87bd1267887289623eba593e0ec52ca0.1530816800.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180705191059.g9kbmzO2qiRXhB1jOeIiqV5__HifSC4Cphs3hnTJFt4@z>

The next patch introduces a new mlxsw-specific test that uses
mirror_gre_lib.sh and mirror_gre_topo_lib.sh.

However when sourcing their own deps, these libraries assume that the
test that's running is in the same directory. That's not the case for
driver-specific tests.

So change the libraries to source their deps through $relative_path.
That variable is set up by lib.sh, which should be imported by the test
in question in any case.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_lib.sh      | 2 +-
 tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index 1c18e332cd4f..fac486178ef7 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-source mirror_lib.sh
+source "$relative_path/mirror_lib.sh"
 
 quick_test_span_gre_dir_ips()
 {
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
index 253419564708..39c03e2867f4 100644
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
