From: shuah@kernel.org (Shuah Khan)
Date: Mon, 20 Aug 2018 15:45:39 -0600
Subject: [GIT PULL] kselftest update for Linux 4.19-rc1
Message-ID: <dd7bf602-8270-5d7d-1f57-10f6528d4382@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180820214539.E6w-SL2M92eeGuW0QYzHI544gsumCGeeNhwpF7bvB2Y@z>

Hi Linus,

Please pull the following Kselftest update for Linux 4.19-rc1

This Kselftest update for 4.19-rc1:

- adds cgroup core selftests
- fixes compile warnings in android ion test
- fixes to bugs in exclude and skip paths in vDSO test
- removes obsolete config options
- adds missing .gitignore file

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------

The following changes since commit 1e4b044d22517cae7047c99038abb444423243ca:

  Linux 4.18-rc4 (2018-07-08 16:34:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.19-rc1

for you to fetch changes up to 01675e9503c4e20c5ce9aebdfe6a9cf2ae4991e0:

  selftests/ftrace: Fix kprobe string testcase to not probe notrace function (2018-08-09 11:26:33 -0600)

----------------------------------------------------------------
linux-kselftest-4.19-rc1

This Kselftest update for 4.19-rc1:

- adds cgroup core selftests
- fixes compile warnings in android ion test
- fixes to bugs in exclude and skip paths in vDSO test
- removes obsolete config options
- adds missing .gitignore file

----------------------------------------------------------------
Anders Roxell (2):
      selftests: cgroup: add gitignore file
      selftests: mount: remove no longer needed config option

Claudio (1):
      Add cgroup core selftests

Li Zhijian (1):
      selftests/android: initialize heap_type to avoid compiling warning

Masami Hiramatsu (1):
      selftests/ftrace: Fix kprobe string testcase to not probe notrace function

Shuah Khan (Samsung OSG) (2):
      selftests: vDSO - fix to exclude x86 test on non-x86 platforms
      selftests: vDSO - fix to return KSFT_SKIP when test couldn't be run

 .../testing/selftests/android/ion/ionapp_export.c  |   1 +
 tools/testing/selftests/cgroup/.gitignore          |   1 +
 tools/testing/selftests/cgroup/Makefile            |   2 +
 tools/testing/selftests/cgroup/cgroup_util.c       |   8 +
 tools/testing/selftests/cgroup/cgroup_util.h       |   1 +
 tools/testing/selftests/cgroup/test_core.c         | 395 +++++++++++++++++++++
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |  30 +-
 .../selftests/ftrace/test.d/kprobe/probepoint.tc   |   2 +-
 tools/testing/selftests/mount/config               |   1 -
 tools/testing/selftests/vDSO/Makefile              |  13 +-
tools/testing/selftests/vDSO/vdso_test.c           |   7 +-
 11 files changed, 435 insertions(+), 26 deletions(-)
 create mode 100644 tools/testing/selftests/cgroup/.gitignore
 create mode 100644 tools/testing/selftests/cgroup/test_core.c

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.19-rc1.diff
Type: text/x-patch
Size: 16269 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180820/2e60b9d3/attachment-0001.bin>
