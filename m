From: shuah@kernel.org (Shuah Khan)
Date: Wed, 13 Jun 2018 11:17:27 -0600
Subject: [GIT PULL] kselftest update 2 for Linux 4.18-rc1
Message-ID: <71fff95c-e017-da84-59ea-c4b8612d380a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180613171727.RmefrbdK7EJeGyPXN9fn417EeF2omSTMyEcxH7_sOl0@z>

Hi Linus,

Please pull the following Kselftest update 2 for 4.18-rc1

This second Kselftest update for Linux 4.18-rc1:

- fixes a signedness bug in cgroups test
- adds ppc support for kprobe args tests

diff is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------
The following changes since commit fa32156921daa5c175228e2cac7679d50efd6c52:

  selftests: lib: fix prime_numbers module search and skip logic (2018-05-30 21:32:55 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.18-rc1-2

for you to fetch changes up to 53c3daf8cfeae4b1289723c7abeb9540c1630cf8:

  kselftest/cgroup: fix a signedness bug (2018-06-07 13:44:30 -0600)

----------------------------------------------------------------
linux-kselftest-4.18-rc1-2

This second Kselftest update for Linux 4.18-rc1:

- fixes a signedness bug in cgroups test
- adds ppc support for kprobe args tests

----------------------------------------------------------------
Dan Carpenter (1):
      kselftest/cgroup: fix a signedness bug

Naveen N. Rao (1):
      selftests/ftrace: Add ppc support for kprobe args tests

 tools/testing/selftests/cgroup/cgroup_util.c                      | 4 ++--
 .../testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc  | 8 ++++++++
 .../testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc  | 7 +++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-----------------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.18-rc1-2.diff
Type: text/x-patch
Size: 1885 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180613/3a4f6126/attachment.bin>
