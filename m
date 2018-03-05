From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Mon, 5 Mar 2018 10:11:04 -0700
Subject: [GIT PULL] kselftest fixes update for 4.16-5
Message-ID: <9a30baa5-bcbb-8f47-d74d-034754fc5a98@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180305171104.jO7Lgxk_WIqqTlH3k5U_F1M0VefQH6gIlPfvqEuriKg@z>

Hi Linus,

Please pull the following Kselftest update for 4.16-rc5.

This kselftest fixes update has a fix for regression in memory-hotplug
install script that prevents the test from running on the target.

Diff for the update is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------

The following changes since commit f6869826de700bce59e2cef14974f99836e34e4f:

  selftests: vm: update .gitignore with new test (2018-02-26 16:09:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.16-rc5

for you to fetch changes up to ba004a2955f759946d8c98ca1a9c8d09818b1223:

  selftests: memory-hotplug: fix emit_tests regression (2018-03-02 10:12:59 -0700)

----------------------------------------------------------------
linux-kselftest-4.16-rc5

This kselftest fixes update has a fix for regression in memory-hotplug
install script that prevents the test from running on the target.

----------------------------------------------------------------
Shuah Khan (1):
      selftests: memory-hotplug: fix emit_tests regression

 tools/testing/selftests/memory-hotplug/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


-----------------------------------------------------------------------------------
