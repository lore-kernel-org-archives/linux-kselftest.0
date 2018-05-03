From: petrm@mellanox.com (Petr Machata)
Date: Thu, 03 May 2018 12:36:52 +0200
Subject: [PATCH net-next mlxsw 0/3] selftests: forwarding: Updates to sysctl
 handling
Message-ID: <cover.1525343276.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180503103652.dmABS9JFGlGkDBShZcvfaRuSt79uyNL_mQANTEKex_Q@z>

Some selftests need to adjust sysctl settings. In order to be neutral to
the system that the test is run on, it is a good practice to change back
to the original setting after the test ends. That involves some
boilerplate that can be abstracted away.

In patch #1, introduce two functions, sysctl_set() and sysctl_restore().
The former stores the current value of a given setting, and sets a new
value. The latter restores the setting to the previously-stored value.

In patch #2, use these wrappers in a number of tests.

Additionally in patch #3, fix a problem in mirror_gre_nh.sh, which
neglected to set a sysctl that's crucial for the test to work.

Petr Machata (3):
  selftests: forwarding: lib: Add sysctl_set(), sysctl_restore()
  selftests: forwarding: Use sysctl_set(), sysctl_restore()
  selftests: forwarding: mirror_gre_nh: Unset RP filter

 tools/testing/selftests/net/forwarding/lib.sh      | 28 ++++++++++++++++------
 .../selftests/net/forwarding/mirror_gre_changes.sh |  7 ++----
 .../selftests/net/forwarding/mirror_gre_nh.sh      |  6 +++++
 .../selftests/net/forwarding/router_multipath.sh   | 12 ++++------
 4 files changed, 33 insertions(+), 20 deletions(-)

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
