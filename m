From: zohar@linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Mar 2019 09:34:08 -0400
Subject: [PATCH v5 0/9] selftests/kexec: add kexec tests
Message-ID: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190326133408.1DCPmV98btF3zkUOaE2I8eMd_fEYGoc0C9Dt4HNFnbI@z>

The kernel may be configured or an IMA policy specified on the boot
command line requiring the kexec kernel image signature to be verified.
At runtime a custom IMA policy may be loaded, replacing the policy
specified on the boot command line.  In addition, the arch specific
policy rules are dynamically defined based on the secure boot mode that
may require the kernel image signature to be verified.

The kernel image may have a PE signature, an IMA signature, or both. In
addition, there are two kexec syscalls - kexec_load and kexec_file_load
- but only the kexec_file_load syscall can verify signatures.

These kexec selftests verify that only properly signed kernel images are
loaded as required, based on the kernel config, the secure boot mode,
and the IMA runtime policy.

Loading a kernel image requires root privileges.  To run just the KEXEC
selftests: sudo make TARGETS=kexec kselftest

Changelog v5:
- Make tests independent of IMA being enabled, folding the changes
into the kexec_file_load test.
- Add support for CONFIG_KEXEC_VERIFY_SIG being enabled, but not
CONFIG_KEXEC_BZIMAGE_VERIFY_SIG.

Changelog v4:
- Moved the kexec tests to selftests/kexec, as requested by Dave Young.
- Removed the kernel module selftest from this patch set.
- Rewritten cover letter, removing reference to kernel modules.

Changelog v3:
- Updated tests based on Petr's review, including the defining a common
  test to check for root privileges.
- Modified config, removing the CONFIG_KEXEC_VERIFY_SIG requirement.
- Updated the SPDX license to GPL-2.0 based on Shuah's review.
- Updated the secureboot mode test to check the SetupMode as well, based
  on David Young's review.

Mimi Zohar (8):
  selftests/kexec: move the IMA kexec_load selftest to selftests/kexec
  selftests/kexec: cleanup the kexec selftest
  selftests/kexec: define a set of common functions
  selftests/kexec: define common logging functions
  kselftest/kexec: define "require_root_privileges"
  selftests/kexec: kexec_file_load syscall test
  selftests/kexec: check kexec_load and kexec_file_load are enabled
  selftests/kexec: make kexec_load test independent of IMA being enabled

Petr Vorel (1):
  selftests/kexec: Add missing '=y' to config options

 tools/testing/selftests/Makefile                   |   2 +-
 tools/testing/selftests/ima/Makefile               |  11 --
 tools/testing/selftests/ima/config                 |   4 -
 tools/testing/selftests/ima/test_kexec_load.sh     |  54 ------
 tools/testing/selftests/kexec/Makefile             |  12 ++
 tools/testing/selftests/kexec/config               |   3 +
 tools/testing/selftests/kexec/kexec_common_lib.sh  | 175 +++++++++++++++++
 .../selftests/kexec/test_kexec_file_load.sh        | 208 +++++++++++++++++++++
 tools/testing/selftests/kexec/test_kexec_load.sh   |  47 +++++
 9 files changed, 446 insertions(+), 70 deletions(-)
 delete mode 100644 tools/testing/selftests/ima/Makefile
 delete mode 100644 tools/testing/selftests/ima/config
 delete mode 100755 tools/testing/selftests/ima/test_kexec_load.sh
 create mode 100644 tools/testing/selftests/kexec/Makefile
 create mode 100644 tools/testing/selftests/kexec/config
 create mode 100755 tools/testing/selftests/kexec/kexec_common_lib.sh
 create mode 100755 tools/testing/selftests/kexec/test_kexec_file_load.sh
 create mode 100755 tools/testing/selftests/kexec/test_kexec_load.sh

-- 
2.7.5
