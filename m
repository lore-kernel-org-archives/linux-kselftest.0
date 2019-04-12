From: zohar@linux.ibm.com (Mimi Zohar)
Date: Thu, 11 Apr 2019 21:20:29 -0400
Subject: [GIT PULL] kexec selftests for Linux 5.2
Message-ID: <1555032029.4914.3.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412012029.uBeZGxmr0o03cFWKSZR_7VUqgIaT0lj2mAJ_KRI21TY@z>

Hi Shuah,

This pull request moves the existing kexec_load test to the
selftests/kexec directory, defines a set of local "common" shell
functions, and defines a new kexec_file_load test.  The local "common"
shell functions could be the basis for a generic set of "common" shell
functions.

Thanks,

Mimi

The following changes since commit 15ade5d2e7775667cf191cf2f94327a4889f8b9d:

  Linux 5.1-rc4 (2019-04-07 14:09:59 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity-for-shuah

for you to fetch changes up to eaa219ab1fd2c2a81704556aefd3dcde904dda33:

  selftests/kexec: update get_secureboot_mode (2019-04-11 19:12:10 -0400)

----------------------------------------------------------------
Mimi Zohar (9):
      selftests/kexec: move the IMA kexec_load selftest to selftests/kexec
      selftests/kexec: cleanup the kexec selftest
      selftests/kexec: define a set of common functions
      selftests/kexec: define common logging functions
      selftests/kexec: define "require_root_privileges"
      selftests/kexec: kexec_file_load syscall test
      selftests/kexec: check kexec_load and kexec_file_load are enabled
      selftests/kexec: make kexec_load test independent of IMA being enabled
      selftests/kexec: update get_secureboot_mode

Petr Vorel (1):
      selftests/kexec: Add missing '=y' to config options

 tools/testing/selftests/Makefile                   |   2 +-
 tools/testing/selftests/ima/config                 |   4 -
 tools/testing/selftests/ima/test_kexec_load.sh     |  54 -----
 tools/testing/selftests/{ima => kexec}/Makefile    |   5 +-
 tools/testing/selftests/kexec/config               |   3 +
 tools/testing/selftests/kexec/kexec_common_lib.sh  | 220 +++++++++++++++++++++
 .../selftests/kexec/test_kexec_file_load.sh        | 208 +++++++++++++++++++
 tools/testing/selftests/kexec/test_kexec_load.sh   |  47 +++++
 8 files changed, 482 insertions(+), 61 deletions(-)
 delete mode 100644 tools/testing/selftests/ima/config
 delete mode 100755 tools/testing/selftests/ima/test_kexec_load.sh
 rename tools/testing/selftests/{ima => kexec}/Makefile (59%)
 create mode 100644 tools/testing/selftests/kexec/config
 create mode 100755 tools/testing/selftests/kexec/kexec_common_lib.sh
 create mode 100755 tools/testing/selftests/kexec/test_kexec_file_load.sh
 create mode 100755 tools/testing/selftests/kexec/test_kexec_load.sh
