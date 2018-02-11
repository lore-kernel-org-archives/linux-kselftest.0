From: linux at dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 12:10:11 +0100
Subject: [Linux-kselftest-mirror] [PATCH 3/5] selftests/x86: do not rely on
	int $0x80 in test_mremap_vdso.c
In-Reply-To: <20180211111013.16888-1-linux@dominikbrodowski.net>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
Message-ID: <20180211111013.16888-4-linux@dominikbrodowski.net>

On 64bit builds, we should not rely on int $0x80 working (it only does if
CONFIG_IA32_EMULATION is enabled). Without this patch, the move test may
succeed, but the int $0x80 cause a segfault, resulting in a false negative
output of this selftest.

CC: Dmitry Safonov <dsafonov at virtuozzo.com>
CC: Andy Lutomirski <luto at kernel.org>
Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
---
 tools/testing/selftests/x86/test_mremap_vdso.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/x86/test_mremap_vdso.c b/tools/testing/selftests/x86/test_mremap_vdso.c
index bf0d687c7db7..64f11c8d9b76 100644
--- a/tools/testing/selftests/x86/test_mremap_vdso.c
+++ b/tools/testing/selftests/x86/test_mremap_vdso.c
@@ -90,8 +90,12 @@ int main(int argc, char **argv, char **envp)
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
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
