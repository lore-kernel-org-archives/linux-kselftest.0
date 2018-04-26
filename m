From: keescook@chromium.org (Kees Cook)
Date: Thu, 26 Apr 2018 15:18:49 -0700
Subject: selftests: pstore_tests failed
In-Reply-To: <CA+G9fYvcGL838Z1XuTM=AP4TJZyaQS5a6pZ6MBir1tsTAv+Xmg@mail.gmail.com>
References: <CA+G9fYvcGL838Z1XuTM=AP4TJZyaQS5a6pZ6MBir1tsTAv+Xmg@mail.gmail.com>
Message-ID:
 <CAGXu5j+e-MMi=VZaF=uFs3S075C5Bx6pshLP8rfppZ9sHNgkNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180426221849.j_V3Cl7becazwLLv6KAYBsU_GrM8CsK8i0RYfr7Yaog@z>

On Thu, Apr 26, 2018 at 9:19 AM, Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> pstore_tests failed on x86_64 device.
> This test pass at your end ? If yes, what are pre-requirements ?
>
> Linux kernel version: 4.17.0-rc1
>
> + ./pstore_tests
> === Pstore unit tests (pstore_tests) ===
> UUID=ffa28670-e941-478a-a3c0-2fdad1df8195
> Checking pstore backend is registered ... ok
> backend=(null)
> cmdline=root=/dev/nfs rw nfsroot=10.66.16.116:
> /var/lib/lava/dispatcher/tmp/198332/extract-nfsrootfs-yqsi5ya0,tcp,hard,intr
> backend=ramoops ramoops.mem_address=0x30000000 ramoops.mem_size=0x10000 ip=dhcp
> console=ttyS0,115200n8 lava_mac={LAVA_MAC}

I don't think these arguments are sufficient for a simulated ramoops
area: I think you need to _remove_ a memory region from System RAM
too. For example, I see the tests work fine with this (note the
"memmap=" line):

=== Pstore unit tests (pstore_tests) ===
UUID=18baf487-2cd6-41b6-b3c0-27dce52b58eb
Checking pstore backend is registered ... ok
        backend=ramoops
        cmdline=console=uart,io,0x3f8,115200n8 loglevel=8
root=/dev/vda1 ro memmap=64K%0x3fff00000+12 ramoops.mem_size=65536
ramoops.mem_address=0x3fff00000
Checking pstore console is registered ... ok
Checking /dev/pmsg0 exists ... ok
Writing unique string to /dev/pmsg0 ... ok

dmesg sees:

[    0.486072] pstore: using deflate compression
[    0.832419] ramoops: using module parameters
[    0.834161] console [pstore-1] enabled
[    0.834677] pstore: Registered ramoops as persistent store backend
[    0.835276] ramoops: attached 0x10000 at 0x3fff00000, ecc: 0/0

and /proc/iomem shows the hole:
...
100000000-3ffefffff : System RAM
3fff00000-3fff0ffff : Persistent Memory (legacy)
3fff10000-43fffffff : System RAM

-Kees

> Checking pstore console is registered ... FAIL
> Checking /dev/pmsg0 exists ... FAIL
> Writing unique string to /dev/pmsg0 ... FAIL
>
> Following config enabled,
>
> CONFIG_EFI_VARS_PSTORE=y
> CONFIG_PSTORE=y
> CONFIG_PSTORE_DEFLATE_COMPRESS=y
> ONFIG_PSTORE_COMPRESS=y
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
> CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
> CONFIG_PSTORE_CONSOLE=y
> CONFIG_PSTORE_PMSG=y
> CONFIG_PSTORE_RAM=m
>
> Please suggest a way to get this working.
>
> Complete boot log and test details link,
> https://lkft.validation.linaro.org/scheduler/job/198332#L230



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
