From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:44:23 +0200
Subject: [PATCH net-next 00/13] mlxsw: Add resource scale tests
Message-ID: <cover.1530319109.git.petrm@mellanox.com>

There are a number of tests that check features of the Linux networking
stack. By running them on suitable interfaces, one can exercise the
mlxsw offloading code. However none of these tests attempts to push
mlxsw to the limits supported by the ASIC.

As an additional wrinkle, the "limits supported by the ASIC" themselves
may not be a set of fixed numbers, but rather depend on a profile that
determines how the ASIC resources are allocated for different purposes.

This patchset introduces several tests that verify capability of mlxsw
to offload amounts of routes, flower rules, and mirroring sessions that
match predicted ASIC capacity, at different configuration profiles.
Additionally they verify that amounts exceeding the predicted capacity
can *not* be offloaded.

These are not generic tests, but ones that are tailored for mlxsw
specifically. For that reason they are not added to net/forwarding
selftests subdirectory, but rather to a newly-added drivers/net/mlxsw.

Patches #1, #2 and #3 tweak the generic forwarding/lib.sh to support the
new additions.

In patches #4 and #5, new libraries for interfacing with devlink are
introduced, first a generic one, then a Spectrum-specific one.

In patch #6, a devlink resource test is introduced.

Patches #7 and #8, #9 and #10, and #11 and #12 introduce three scale
tests: router, flower and mirror-to-gretap. The first of each pair of
patches introduces a generic portion of the test (mlxsw-specific), the
second introduces a Spectrum-specific wrapper.

Patch #13 then introduces a scale test driver that runs (possibly a
subset of) the tests introduced by patches from previous paragraph.

Arkadi Sharshevsky (1):
  selftests: mlxsw: Add router test

Petr Machata (8):
  selftests: forwarding: lib: Add check_err_fail()
  selftests: forwarding: lib: Parameterize NUM_NETIFS in two functions
  selftests: forwarding: Add devlink_lib.sh
  selftests: mlxsw: Add devlink_lib_spectrum.sh
  selftests: mlxsw: Add tc flower scale test
  selftests: mlxsw: Add target for tc flower test on spectrum
  selftests: mlxsw: Add scale test for mirror-to-gretap
  selftests: mlxsw: Add target for mirror-to-gretap test on spectrum

Yuval Mintz (4):
  selftests: forwarding: Allow lib.sh sourcing from other directories
  selftests: mlxsw: Add devlink KVD resource test
  selftests: mlxsw: Add target for router test on spectrum
  selftests: mlxsw: Add scale test for resources

 MAINTAINERS                                        |   1 +
 .../drivers/net/mlxsw/mirror_gre_scale.sh          | 197 +++++++++++++++++++++
 .../selftests/drivers/net/mlxsw/router_scale.sh    | 167 +++++++++++++++++
 .../net/mlxsw/spectrum/devlink_lib_spectrum.sh     | 119 +++++++++++++
 .../net/mlxsw/spectrum/devlink_resources.sh        | 117 ++++++++++++
 .../drivers/net/mlxsw/spectrum/mirror_gre_scale.sh |  13 ++
 .../drivers/net/mlxsw/spectrum/resource_scale.sh   |  55 ++++++
 .../drivers/net/mlxsw/spectrum/router_scale.sh     |  18 ++
 .../drivers/net/mlxsw/spectrum/tc_flower_scale.sh  |  19 ++
 .../selftests/drivers/net/mlxsw/tc_flower_scale.sh | 134 ++++++++++++++
 .../selftests/net/forwarding/devlink_lib.sh        | 108 +++++++++++
 tools/testing/selftests/net/forwarding/lib.sh      |  30 +++-
 12 files changed, 974 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/mirror_gre_scale.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/router_scale.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_lib_spectrum.sh
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/spectrum/devlink_resources.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/mirror_gre_scale.sh
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/spectrum/resource_scale.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/router_scale.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/spectrum/tc_flower_scale.sh
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/tc_flower_scale.sh
 create mode 100644 tools/testing/selftests/net/forwarding/devlink_lib.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
