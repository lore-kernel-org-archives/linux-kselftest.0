From: zohar at linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Feb 2019 18:26:55 -0500
Subject: [PATCH v2 0/5] selftests/ima: add kexec and kernel module tests
Message-ID: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>

The kernel can be configured to require kexec kernel images and kernel
modules are signed.  An IMA policy can be specified on the boot command
line or a custom IMA policy loaded requiring the kexec kernel image and
kernel modules be signed.  In addition, systems booted in secure boot
mode with the IMA architecture specific policy enabled, require validly
signed kexec kernel images and kernel modules.

There are two methods of signing kernel images and two methods of
signing kernel modules.  In addition, there are two syscalls for each.

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

Mimi Zohar (5):
  selftests/ima: cleanup the kexec selftest
  selftests/ima: define a set of common functions
  selftests/ima: define common logging functions
  selftests/ima: kexec_file_load syscall test
  selftests/ima: loading kernel modules

 tools/testing/selftests/ima/Makefile               |   3 +-
 tools/testing/selftests/ima/common_lib.sh          | 154 ++++++++++++++++
 tools/testing/selftests/ima/test_kernel_module.sh  |  96 ++++++++++
 .../testing/selftests/ima/test_kexec_file_load.sh  | 195 +++++++++++++++++++++
 tools/testing/selftests/ima/test_kexec_load.sh     |  53 ++----
 5 files changed, 463 insertions(+), 38 deletions(-)
 create mode 100755 tools/testing/selftests/ima/common_lib.sh
 create mode 100755 tools/testing/selftests/ima/test_kernel_module.sh
 create mode 100755 tools/testing/selftests/ima/test_kexec_file_load.sh

-- 
2.7.5
