From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Thu, 26 Apr 2018 21:49:25 +0530
Subject: selftests: pstore_tests failed
Message-ID: <CA+G9fYvcGL838Z1XuTM=AP4TJZyaQS5a6pZ6MBir1tsTAv+Xmg@mail.gmail.com>

pstore_tests failed on x86_64 device.
This test pass at your end ? If yes, what are pre-requirements ?

Linux kernel version: 4.17.0-rc1

+ ./pstore_tests
=== Pstore unit tests (pstore_tests) ===
UUID=ffa28670-e941-478a-a3c0-2fdad1df8195
Checking pstore backend is registered ... ok
backend=(null)
cmdline=root=/dev/nfs rw nfsroot=10.66.16.116:
/var/lib/lava/dispatcher/tmp/198332/extract-nfsrootfs-yqsi5ya0,tcp,hard,intr
backend=ramoops ramoops.mem_address=0x30000000 ramoops.mem_size=0x10000 ip=dhcp
console=ttyS0,115200n8 lava_mac={LAVA_MAC}
Checking pstore console is registered ... FAIL
Checking /dev/pmsg0 exists ... FAIL
Writing unique string to /dev/pmsg0 ... FAIL

Following config enabled,

CONFIG_EFI_VARS_PSTORE=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
ONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
CONFIG_PSTORE_RAM=m

Please suggest a way to get this working.

Complete boot log and test details link,
https://lkft.validation.linaro.org/scheduler/job/198332#L230
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
