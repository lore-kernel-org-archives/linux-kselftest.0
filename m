From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 21 Feb 2018 13:49:07 +0100
Subject: [PATCH 4.9 58/77] selftests/x86: Do not rely on "int $0x80" in
 test_mremap_vdso.c
In-Reply-To: <20180221124432.172390020@linuxfoundation.org>
References: <20180221124432.172390020@linuxfoundation.org>
Message-ID: <20180221124434.659368600@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221124907.ip_twFn5Qkn8M1HvTf1Kj-x5cb3fWlJ2zNHDkOHo6QI@z>

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dominik Brodowski <linux@dominikbrodowski.net>

commit 2cbc0d66de0480449c75636f55697c7ff3af61fc upstream.

On 64-bit builds, we should not rely on "int $0x80" working (it only does if
CONFIG_IA32_EMULATION=y is enabled).

Without this patch, the move test may succeed, but the "int $0x80" causes
a segfault, resulting in a false negative output of this self-test.

Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
Cc: Andy Lutomirski <luto at kernel.org>
Cc: Dmitry Safonov <dsafonov at virtuozzo.com>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-kselftest at vger.kernel.org
Cc: shuah at kernel.org
Link: http://lkml.kernel.org/r/20180211111013.16888-4-linux at dominikbrodowski.net
Signed-off-by: Ingo Molnar <mingo at kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 tools/testing/selftests/x86/test_mremap_vdso.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/tools/testing/selftests/x86/test_mremap_vdso.c
+++ b/tools/testing/selftests/x86/test_mremap_vdso.c
@@ -90,8 +90,12 @@ int main(int argc, char **argv, char **e
 			vdso_size += PAGE_SIZE;
 		}
 
+#ifdef __i386__
 		/* Glibc is likely to explode now - exit with raw syscall */
 		asm volatile ("int $0x80" : : "a" (__NR_exit), "b" (!!ret));
+#else /* __x86_64__ */
+		syscall(SYS_exit, ret);
+#endif
 	} else {
 		int status;
 


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
