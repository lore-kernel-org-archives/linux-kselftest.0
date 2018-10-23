From: joel@jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:57 +1030
Subject: [PATCH 6/6] selftests: powerpc/pmu: Link ebb tests with -no-pie
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-7-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023061657._HSzZ2OvqfgvS1WdHD6-6_yHiJmxfbSB1_bMKadv3DI@z>

When running the ebb tests after building on a ppc64le Ubuntu machine:

 $ pmu/ebb/reg_access_test: error while loading shared libraries:
 R_PPC64_ADDR16_HI reloc at 0x000000013a965130 for symbol `' out of
 range

This is because the Ubuntu toolchain builds has PIE enabled by default.
Change it to be always off instead.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/pmu/ebb/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
index bd5dfa509272..23f4caf48ffc 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
@@ -5,6 +5,9 @@ noarg:
 # The EBB handler is 64-bit code and everything links against it
 CFLAGS += -m64
 
+# Toolchains may build PIE by default which breaks the assembly
+LDFLAGS += -no-pie
+
 TEST_GEN_PROGS := reg_access_test event_attributes_test cycles_test	\
 	 cycles_with_freeze_test pmc56_overflow_test		\
 	 ebb_vs_cpu_event_test cpu_event_vs_ebb_test		\
-- 
2.19.1
