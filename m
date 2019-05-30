From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Thu, 30 May 2019 15:15:21 +0100
Subject: [PATCH v6 09/19] lib: vdso: Add compat support
In-Reply-To: <20190530141531.43462-1-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
Message-ID: <20190530141531.43462-10-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190530141521.TcFcsKzpe1wRhiTg2_6IKlQr926G-aBqSfLX4f6QMqc@z>

Some 64 bit architectures have support for 32 bit applications that
require a separate version of the vDSOs.

Add support to the generic code for compat fallback functions.

Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
---
 lib/vdso/gettimeofday.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index a226675731f4..44b9c6a0cb95 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -21,7 +21,11 @@
  * - clock_gettime_fallback(): fallback for clock_gettime.
  * - clock_getres_fallback(): fallback for clock_getres.
  */
+#ifdef ENABLE_COMPAT_VDSO
+#include <asm/vdso/compat_gettimeofday.h>
+#else
 #include <asm/vdso/gettimeofday.h>
+#endif /* ENABLE_COMPAT_VDSO */
 
 static notrace int do_hres(const struct vdso_data *vd,
 			   clockid_t clk,
-- 
2.21.0
