From: vincenzo.frascino at arm.com (Vincenzo Frascino)
Date: Tue, 16 Apr 2019 17:14:30 +0100
Subject: [PATCH v2 1/5] arm64: Fix vDSO clock_getres()
In-Reply-To: <20190416161434.32691-1-vincenzo.frascino@arm.com>
References: <20190416161434.32691-1-vincenzo.frascino@arm.com>
Message-ID: <20190416161434.32691-2-vincenzo.frascino@arm.com>

clock_getres in the vDSO library has to preserve the same behaviour
of posix_get_hrtimer_res().

In particular, posix_get_hrtimer_res() does:
    sec = 0;
    ns = hrtimer_resolution;
and hrtimer_resolution depends on the enablement of the high
resolution timers that can happen either at compile or at run time.

Fix the arm64 vdso implementation of clock_getres keeping a copy of
hrtimer_resolution in vdso data and using that directly.

Cc: Catalin Marinas <catalin.marinas at arm.com>
Cc: Will Deacon <will.deacon at arm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
---
 arch/arm64/include/asm/vdso_datapage.h |  1 +
 arch/arm64/kernel/asm-offsets.c        |  2 +-
 arch/arm64/kernel/vdso.c               |  2 ++
 arch/arm64/kernel/vdso/gettimeofday.S  | 22 +++++++++++-----------
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/vdso_datapage.h b/arch/arm64/include/asm/vdso_datapage.h
index 2b9a63771eda..f89263c8e11a 100644
--- a/arch/arm64/include/asm/vdso_datapage.h
+++ b/arch/arm64/include/asm/vdso_datapage.h
@@ -38,6 +38,7 @@ struct vdso_data {
 	__u32 tz_minuteswest;	/* Whacky timezone stuff */
 	__u32 tz_dsttime;
 	__u32 use_syscall;
+	__u32 hrtimer_res;
 };
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 7f40dcbdd51d..e10e2a5d9ddc 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -94,7 +94,7 @@ int main(void)
   DEFINE(CLOCK_REALTIME,	CLOCK_REALTIME);
   DEFINE(CLOCK_MONOTONIC,	CLOCK_MONOTONIC);
   DEFINE(CLOCK_MONOTONIC_RAW,	CLOCK_MONOTONIC_RAW);
-  DEFINE(CLOCK_REALTIME_RES,	MONOTONIC_RES_NSEC);
+  DEFINE(CLOCK_REALTIME_RES,	offsetof(struct vdso_data, hrtimer_res));
   DEFINE(CLOCK_REALTIME_COARSE,	CLOCK_REALTIME_COARSE);
   DEFINE(CLOCK_MONOTONIC_COARSE,CLOCK_MONOTONIC_COARSE);
   DEFINE(CLOCK_COARSE_RES,	LOW_RES_NSEC);
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 2d419006ad43..5f5759d51c33 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -245,6 +245,8 @@ void update_vsyscall(struct timekeeper *tk)
 		vdso_data->cs_shift		= tk->tkr_mono.shift;
 	}
 
+	vdso_data->hrtimer_res		= hrtimer_resolution;
+
 	smp_wmb();
 	++vdso_data->tb_seq_count;
 }
diff --git a/arch/arm64/kernel/vdso/gettimeofday.S b/arch/arm64/kernel/vdso/gettimeofday.S
index c39872a7b03c..e2e9dfe9ba4a 100644
--- a/arch/arm64/kernel/vdso/gettimeofday.S
+++ b/arch/arm64/kernel/vdso/gettimeofday.S
@@ -296,32 +296,32 @@ ENDPROC(__kernel_clock_gettime)
 /* int __kernel_clock_getres(clockid_t clock_id, struct timespec *res); */
 ENTRY(__kernel_clock_getres)
 	.cfi_startproc
+	adr	vdso_data, _vdso_data
 	cmp	w0, #CLOCK_REALTIME
 	ccmp	w0, #CLOCK_MONOTONIC, #0x4, ne
 	ccmp	w0, #CLOCK_MONOTONIC_RAW, #0x4, ne
-	b.ne	1f
+	b.ne	2f
 
-	ldr	x2, 5f
-	b	2f
-1:
+1:	/* Get hrtimer_res */
+	ldr	x2, [vdso_data, #CLOCK_REALTIME_RES]
+	b	3f
+2:
 	cmp	w0, #CLOCK_REALTIME_COARSE
 	ccmp	w0, #CLOCK_MONOTONIC_COARSE, #0x4, ne
-	b.ne	4f
+	b.ne	5f
 	ldr	x2, 6f
-2:
-	cbz	x1, 3f
+3:
+	cbz	x1, 4f
 	stp	xzr, x2, [x1]
 
-3:	/* res == NULL. */
+4:	/* res == NULL. */
 	mov	w0, wzr
 	ret
 
-4:	/* Syscall fallback. */
+5:	/* Syscall fallback. */
 	mov	x8, #__NR_clock_getres
 	svc	#0
 	ret
-5:
-	.quad	CLOCK_REALTIME_RES
 6:
 	.quad	CLOCK_COARSE_RES
 	.cfi_endproc
-- 
2.21.0
