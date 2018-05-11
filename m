From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Fri, 11 May 2018 15:49:14 +0530
Subject: selftests: kvm tests need config file.
Message-ID:
 <CA+G9fYvfp9zfWSB92ZzAk23=x28Hx_H4y8ugMsaoQ=tZJxhe9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511101914.agqcxLQuGzhU_S2XvH6VrsjIeyIzInjFtSwLthglhmQ@z>

I have two questions,

1.
selftests: kvm tests failed.
Seems like missing pre-requirement of Kconfigs.

Please add required configs in a "config" file in the path.
The kernel build will merge those configs at the time of building.
Example: selftests/net/config

2.
Do you have a plan to make it work for arm /arm64 ?

Test log,

Running tests in kvm
========================================
selftests: kvm: set_sregs_test
==== Test Assertion Failure ====
  lib/kvm_util.c:95: kvm_fd >= 0
  pid=5611 tid=5611 - No such file or directory
     1 0x0000000000401e8e: ?? ??:0
     2 0x00000000004064b9: ?? ??:0
     3 0x0000000000400f51: ?? ??:0
     4 0x00007f74923d1290: ?? ??:0
     5 0x0000000000401039: ?? ??:0
  open /dev/kvm failed, rc: -1 errno: 2
not ok 1..1 selftests: kvm: set_sregs_test [FAIL]
se[  201.324786] kselftest: Running tests in membarrier
lftests: kvm: sync_regs_test
==== Test Assertion Failure ====
  lib/kvm_util.c:54: kvm_fd >= 0
  pid=5617 tid=5617 - No such file or directory
     1 0x0000000000401deb: ?? ??:0
     2 0x0000000000400f52: ?? ??:0
     [  201.350386] kselftest: Running tests in memfd
3 0x00007f9f2c5eb290: ?? ??:0
     4 0x00000000004014e9: ?? ??:0
  open /dev/kvm failed, rc: -1 errno: 2
not ok 1..2 selftests: kvm: sync_regs_test [FAIL]
selftests: kvm: vmx_tsc_adjust_test
==== Test Assertion Failure ====
  lib/kvm_util.c:422: kvm_fd >= 0
  pid=5623 tid=5623 - No such file or directory
     1 0x00000000004018fa: ?? ??:0
     2 0x0000000000401d02: ?? ??:0
     3 0x0000000000400ef8: ?? ??:0
     4 0x00007f3e65a59290: ?? ??:0
     5 0x0000000000401119: ?? ??:0
  open /dev/kvm failed, rc: -1 errno: 2
not ok 1..3 selftests: kvm: vmx_tsc_adjust_test [FAIL]

Ref bugs:
LKFT: next: arm32 and arm64: kselftest kvm test case build failed
https://bugs.linaro.org/show_bug.cgi?id=3826

LKFT: linux-next: kvm vmx_tsc_adjust_test failed on all devices
https://bugs.linaro.org/show_bug.cgi?id=3780

Best regards
Naresh Kamboju
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
