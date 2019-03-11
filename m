From: zohar at linux.ibm.com (Mimi Zohar)
Date: Mon, 11 Mar 2019 07:41:06 -0400
Subject: [PATCH v3 0/7] selftests/ima: add kexec and kernel module tests
Message-ID: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>

The kernel can be configured to require kexec kernel images and kernel
modules are signed.  An IMA policy can be specified on the boot command
line or a custom IMA policy loaded requiring the kexec kernel image and
kernel modules be signed.  In addition, systems booted in secure boot
mode with the IMA architecture specific policy enabled, require validly
signed kexec kernel images and kernel modules.

In addition to two methods of signing kernel images and two methods of
signing kernel modules, there are two syscalls for each.

kernel image:  PE signature, IMA signature
kexec syscalls: kexec_load, kexec_file_load

Both the PE and IMA kernel image signature can only be verified when
loaded via the kexec_file_load syscall.

kernel moodule: appended signature, IMA signature
kernel module syscalls: init_module, finit_module

The appended kernel module signature can be verified when the kernel
module is loaded via either syscall.  The IMA kernel module signature
can only be verified when the kernel module is loaded via the
finit_module syscall.

The selftests in this patch set verify that only signed kernel images
and kernel modules are loaded as required, based on the kernel config,
the secure boot mode, and the IMA runtime policy.

Loading a kernel image or kernel module requires root privileges.  To
run just the IMA selftests: sudo make TARGETS=ima kselftest

Changelog:
- Updated tests based on Petr's review, including the defining a common
  test to check for root privileges.
- Modified config, removing the CONFIG_KEXEC_VERIFY_SIG requirement.
- Updated the SPDX license to GPL-2.0 based on Shuah's review.
- Updated the secureboot mode test to check the SetupMode as well, based
  on David Young's review.


Mimi Zohar (6):
  selftests/ima: cleanup the kexec selftest
  selftests/ima: define a set of common functions
  selftests/ima: define common logging functions
  kselftest/ima: define "require_root_privileges"
  selftests/ima: kexec_file_load syscall test
  selftests/ima: loading kernel modules

Petr Vorel (1):
  selftests/ima: Add missing '=y' to config options

 tools/testing/selftests/ima/Makefile               |   3 +-
 tools/testing/selftests/ima/config                 |   7 +-
 tools/testing/selftests/ima/ima_common_lib.sh      | 173 +++++++++++++++++++
 tools/testing/selftests/ima/test_kernel_module.sh  |  93 ++++++++++
 .../testing/selftests/ima/test_kexec_file_load.sh  | 190 +++++++++++++++++++++
 tools/testing/selftests/ima/test_kexec_load.sh     |  53 ++----
 6 files changed, 476 insertions(+), 43 deletions(-)
 create mode 100755 tools/testing/selftests/ima/ima_common_lib.sh
 create mode 100755 tools/testing/selftests/ima/test_kernel_module.sh
 create mode 100755 tools/testing/selftests/ima/test_kexec_file_load.sh

-- 
2.7.5
