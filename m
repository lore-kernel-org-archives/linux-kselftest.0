From: sashal@kernel.org (Sasha Levin)
Date: Sat, 23 Feb 2019 16:06:11 -0500
Subject: [PATCH AUTOSEL 4.19 36/65] selftests: net: use LDLIBS instead of
 LDFLAGS
In-Reply-To: <20190223210640.200911-1-sashal@kernel.org>
References: <20190223210640.200911-1-sashal@kernel.org>
Message-ID: <20190223210640.200911-36-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190223210611.b8b-rXqrWIHo9IqO2LsnkkjdTtRFdDPlmUhDLx-jK9o@z>

From: Fathi Boudra <fathi.boudra@linaro.org>

[ Upstream commit 870f193d48c25a97d61a8e6c04e3c29a2c606850 ]

reuseport_bpf_numa fails to build due to undefined reference errors:

 aarch64-linaro-linux-gcc
 --sysroot=/build/tmp-rpb-glibc/sysroots/hikey -Wall
 -Wl,--no-as-needed -O2 -g -I../../../../usr/include/  -Wl,-O1
 -Wl,--hash-style=gnu -Wl,--as-needed -lnuma  reuseport_bpf_numa.c
 -o
 /build/tmp-rpb-glibc/work/hikey-linaro-linux/kselftests/4.12-r0/linux-4.12-rc7/tools/testing/selftests/net/reuseport_bpf_numa
 /tmp/ccfUuExT.o: In function `send_from_node':
 /build/tmp-rpb-glibc/work/hikey-linaro-linux/kselftests/4.12-r0/linux-4.12-rc7/tools/testing/selftests/net/reuseport_bpf_numa.c:138:
 undefined reference to `numa_run_on_node'
 /tmp/ccfUuExT.o: In function `main':
 /build/tmp-rpb-glibc/work/hikey-linaro-linux/kselftests/4.12-r0/linux-4.12-rc7/tools/testing/selftests/net/reuseport_bpf_numa.c:230:
 undefined reference to `numa_available'
 /build/tmp-rpb-glibc/work/hikey-linaro-linux/kselftests/4.12-r0/linux-4.12-rc7/tools/testing/selftests/net/reuseport_bpf_numa.c:233:
 undefined reference to `numa_max_node'

It's GNU Make and linker specific.

The default Makefile rule looks like:

$(CC) $(CFLAGS) $(LDFLAGS) $@ $^ $(LDLIBS)

When linking is done by gcc itself, no issue, but when it needs to be passed
to proper ld, only LDLIBS follows and then ld cannot know what libs to link
with.

More detail:
https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html

LDFLAGS
Extra flags to give to compilers when they are supposed to invoke the linker,
‘ld’, such as -L. Libraries (-lfoo) should be added to the LDLIBS variable
instead.

LDLIBS
Library flags or names given to compilers when they are supposed to invoke the
linker, ‘ld’. LOADLIBES is a deprecated (but still supported) alternative to
LDLIBS. Non-library linker flags, such as -L, should go in the LDFLAGS
variable.

https://lkml.org/lkml/2010/2/10/362

tools/perf: libraries must come after objects

Link order matters, use LDLIBS instead of LDFLAGS to properly link against
libnuma.

Signed-off-by: Fathi Boudra <fathi.boudra at linaro.org>
Signed-off-by: Shuah Khan <shuah at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/net/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 919aa2ac00af7..9a3764a1084ea 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -18,6 +18,6 @@ TEST_GEN_PROGS += reuseport_dualstack reuseaddr_conflict tls
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
-$(OUTPUT)/reuseport_bpf_numa: LDFLAGS += -lnuma
+$(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
 $(OUTPUT)/tcp_mmap: LDFLAGS += -lpthread
 $(OUTPUT)/tcp_inq: LDFLAGS += -lpthread
-- 
2.19.1
