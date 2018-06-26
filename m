From: petrm at mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:08:17 +0200
Subject: [PATCH net-next 6/6] selftests: forwarding: README: Require diagrams
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID: <4faf4eff999bf82421662f695be398579d0e572f.1529971148.git.petrm@mellanox.com>

ASCII art diagrams are well suited for presenting the topology that a
test uses while being easy to embed directly in the test file iteslf.
They make the information very easy to grasp even for simple topologies,
and for more complex ones they are almost essential, as figuring out the
interconnects from the script itself proves to be difficult.

Therefore state the requirement for topology ASCII art in README.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/README | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/README b/tools/testing/selftests/net/forwarding/README
index 4a0964c42860..b8a2af8fcfb7 100644
--- a/tools/testing/selftests/net/forwarding/README
+++ b/tools/testing/selftests/net/forwarding/README
@@ -46,6 +46,8 @@ Guidelines for Writing Tests
 
 o Where possible, reuse an existing topology for different tests instead
   of recreating the same topology.
+o Tests that use anything but the most trivial topologies should include
+  an ASCII art showing the topology.
 o Where possible, IPv6 and IPv4 addresses shall conform to RFC 3849 and
   RFC 5737, respectively.
 o Where possible, tests shall be written so that they can be reused by
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
