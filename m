From: Babu.Moger at amd.com (Moger, Babu)
Date: Fri, 18 Jan 2019 18:27:01 +0000
Subject: [PATCH v5 00/13] selftests/resctrl: Add resctrl selftest
Message-ID: <20190118182646.16594-1-babu.moger@amd.com>

With more and more resctrl features are being added by Intel, AMD
and ARM, a test tool is becoming more and more useful to validate
that both hardware and software functionalities work as expected.

We introduce resctrl selftest to cover resctrl features on both
X86 and ARM architectures. It first implements MBM (Memory Bandwidth
Monitoring) and MBA (Memory Bandwidth Allocation) tests. We can enhance
the selftest tool to include more functionality tests in future.

There is an existing resctrl test suite 'intel_cmt_cat'. But the major
purpose of the tool is to test Intel(R) RDT hardware via writing and
reading MSR registers. It does access resctrl file system; but the
functionalities are very limited. And it doesn't support automatic test
and a lot of manual verifications are involved.

So the selftest tool we are introducing here provides a convenient
tool which does automatic resctrl testing, is easily available in kernel
tree, and will be extended to AMD QoS and ARM MPAM.

The selftest tool is in tools/testing/selftests/resctrl in order to have
generic test code for all architectures.

Changelog:
v5: 
- Based the v4 patches submitted by Fenghua Yu and added changes to support
  AMD.
- Changed the function name get_sock_num to get_resource_id. Intel uses
  socket number for schemata and AMD uses l3 index id. To generalize changed
  the function name to get_resource_id.
- Added the code to detect vendor.
- Disabled the few tests for AMD where the test results are not clear.
  Also AMD does not have IMC.
- Fixed few compile issues.
- Some cleanup to make each patch independent.
- Tested the patches on AMD system. Fenghua, Need your help to test on
  Intel box. Please feel free to change and resubmit if something
   broken.
- Here is the link for previous version.
  https://lore.kernel.org/lkml/1545438038-75107-1-git-send-email-fenghua.yu at intel.com/

v4: 
- address comments from Balu and Randy
- Add CAT and CQM tests

v3:
- Change code based on comments from Babu Moger
- Remove some unnessary code and use pipe to communicate b/w processes

v2:
- Change code based on comments from Babu Moger
- Clean up other places.


Arshiya Hayatkhan Pathan (4):
  selftests/resctrl: Add MBM test
  selftests/resctrl: Add MBA test
  selftests/resctrl Add Cache QoS Monitoring (CQM) selftest
  selftests/resctrl: Add Cache Allocation Technology (CAT) selftest

Babu Moger (3):
  selftests/resctrl: Add vendor detection mechanism
  selftests/resctrl: Use cache index3 id for AMD schemata masks
  selftests/resctrl: Disable MBA and MBM tests for AMD

Fenghua Yu (2):
  selftests/resctrl: Add README for resctrl tests
  selftests/resctrl: Add the test in MAINTAINERS

Sai Praneeth Prakhya (4):
  selftests/resctrl: Add basic resctrl file system operations and data
  selftests/resctrl: Read memory bandwidth from perf IMC counter and
    from resctrl file system
  selftests/resctrl: Add callback to start a benchmark
  selftests/resctrl: Add built in benchmark

 MAINTAINERS                                     |   1 +
 tools/testing/selftests/resctrl/Makefile        |  16 +
 tools/testing/selftests/resctrl/README          |  53 ++
 tools/testing/selftests/resctrl/cache.c         | 275 +++++++++
 tools/testing/selftests/resctrl/cat_test.c      | 243 ++++++++
 tools/testing/selftests/resctrl/cqm_test.c      | 169 ++++++
 tools/testing/selftests/resctrl/fill_buf.c      | 198 +++++++
 tools/testing/selftests/resctrl/mba_test.c      | 174 ++++++
 tools/testing/selftests/resctrl/mbm_test.c      | 146 +++++
 tools/testing/selftests/resctrl/resctrl.h       | 117 ++++
 tools/testing/selftests/resctrl/resctrl_tests.c | 243 ++++++++
 tools/testing/selftests/resctrl/resctrl_val.c   | 727 ++++++++++++++++++++++++
 tools/testing/selftests/resctrl/resctrlfs.c     | 649 +++++++++++++++++++++
 13 files changed, 3011 insertions(+)
 create mode 100644 tools/testing/selftests/resctrl/Makefile
 create mode 100644 tools/testing/selftests/resctrl/README
 create mode 100644 tools/testing/selftests/resctrl/cache.c
 create mode 100644 tools/testing/selftests/resctrl/cat_test.c
 create mode 100644 tools/testing/selftests/resctrl/cqm_test.c
 create mode 100644 tools/testing/selftests/resctrl/fill_buf.c
 create mode 100644 tools/testing/selftests/resctrl/mba_test.c
 create mode 100644 tools/testing/selftests/resctrl/mbm_test.c
 create mode 100644 tools/testing/selftests/resctrl/resctrl.h
 create mode 100644 tools/testing/selftests/resctrl/resctrl_tests.c
 create mode 100644 tools/testing/selftests/resctrl/resctrl_val.c
 create mode 100644 tools/testing/selftests/resctrl/resctrlfs.c

-- 
1.8.3.1
