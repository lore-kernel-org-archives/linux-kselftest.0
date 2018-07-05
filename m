From: petrm@mellanox.com (Petr Machata)
Date: Thu, 05 Jul 2018 21:10:53 +0200
Subject: [PATCH net-next 0/2] Add a mlxsw-specific test for mirror-to-gretap
Message-ID: <cover.1530816800.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180705191053.DSL_KkNcG8lNi2waq_TzsdA5XnTIR5UtAPUPe6I9eZw@z>

Some configurations of mirror-to-gretap are impossible for mlxsw to
offload. Add a test that checks that these out-of-domain conditions are
handled properly by mlxsw.

In patch #1, fix mirror_gre_lib.sh and mirror_gre_topo_lib.sh so that
they can be imported from directories other than forwarding/.

In patch #2, add a test to check handling of several scenarios that
mlxsw is expected to fail to offload.

Petr Machata (2):
  selftests: forwarding: Allow importing dependent libraries
  selftests: mlxsw: Add mlxsw-specific test for mirror to gretap

 .../selftests/drivers/net/mlxsw/mirror_gre.sh      | 217 +++++++++++++++++++++
 .../selftests/net/forwarding/mirror_gre_lib.sh     |   2 +-
 .../net/forwarding/mirror_gre_topo_lib.sh          |   2 +-
 3 files changed, 219 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/mirror_gre.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
