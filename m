From: lizhijian@cn.fujitsu.com (Li Zhijian)
Date: Tue, 8 May 2018 17:14:30 +0800
Subject: [PATCH 2/2] tools/testing/selftests/x86: fix error: conflicting types
 for 'pkey_get|pkey_set'
In-Reply-To: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <1525770870-19067-2-git-send-email-lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508091430.qBQ9bfuXGEd3HA9bNAipRT1eGWIBEyBbYIwBoehTJxI@z>

pkey_get() and pkey_set() are implemented since glibc-2.27, here just
rename pkey_get|pkey_set to _pkey_get|_pkey_set simply

the compiling errors are like:
------------
protection_keys.c:399:5: error: conflicting types for 'pkey_get'
 u32 pkey_get(int pkey, unsigned long flags)
     ^
In file included from /usr/include/bits/mman-linux.h:115:0,
                 from /usr/include/bits/mman.h:45,
                 from /usr/include/sys/mman.h:41,
                 from protection_keys.c:37:
/usr/include/bits/mman-shared.h:64:5: note: previous declaration of 'pkey_get' was here
 int pkey_get (int __key) __THROW;
     ^
protection_keys.c:421:5: error: conflicting types for 'pkey_set'
 int pkey_set(int pkey, unsigned long rights, unsigned long flags)
     ^
In file included from /usr/include/bits/mman-linux.h:115:0,
                 from /usr/include/bits/mman.h:45,
                 from /usr/include/sys/mman.h:41,
                 from protection_keys.c:37:
/usr/include/bits/mman-shared.h:60:5: note: previous declaration of 'pkey_set' was here
 int pkey_set (int __key, unsigned int __access_rights) __THROW;
     ^
------------

Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/x86/protection_keys.c | 32 +++++++++++++++------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/x86/protection_keys.c b/tools/testing/selftests/x86/protection_keys.c
index 757bb16..ccbd81f 100644
--- a/tools/testing/selftests/x86/protection_keys.c
+++ b/tools/testing/selftests/x86/protection_keys.c
@@ -397,10 +397,14 @@ pid_t fork_lazy_child(void)
 	return forkret;
 }
 
-#define PKEY_DISABLE_ACCESS    0x1
-#define PKEY_DISABLE_WRITE     0x2
+#ifndef PKEY_DISABLE_ACCESS
+# define PKEY_DISABLE_ACCESS    0x1
+#endif
+#ifndef PKEY_DISABLE_WRITE
+# define PKEY_DISABLE_WRITE     0x2
+#endif
 
-u32 pkey_get(int pkey, unsigned long flags)
+u32 _pkey_get(int pkey, unsigned long flags)
 {
 	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
 	u32 pkru = __rdpkru();
@@ -422,7 +426,7 @@ u32 pkey_get(int pkey, unsigned long flags)
 	return masked_pkru;
 }
 
-int pkey_set(int pkey, unsigned long rights, unsigned long flags)
+int _pkey_set(int pkey, unsigned long rights, unsigned long flags)
 {
 	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
 	u32 old_pkru = __rdpkru();
@@ -456,15 +460,15 @@ void pkey_disable_set(int pkey, int flags)
 		pkey, flags);
 	pkey_assert(flags & (PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE));
 
-	pkey_rights = pkey_get(pkey, syscall_flags);
+	pkey_rights = _pkey_get(pkey, syscall_flags);
 
-	dprintf1("%s(%d) pkey_get(%d): %x\n", __func__,
+	dprintf1("%s(%d) _pkey_get(%d): %x\n", __func__,
 			pkey, pkey, pkey_rights);
 	pkey_assert(pkey_rights >= 0);
 
 	pkey_rights |= flags;
 
-	ret = pkey_set(pkey, pkey_rights, syscall_flags);
+	ret = _pkey_set(pkey, pkey_rights, syscall_flags);
 	assert(!ret);
 	/*pkru and flags have the same format */
 	shadow_pkru |= flags << (pkey * 2);
@@ -472,8 +476,8 @@ void pkey_disable_set(int pkey, int flags)
 
 	pkey_assert(ret >= 0);
 
-	pkey_rights = pkey_get(pkey, syscall_flags);
-	dprintf1("%s(%d) pkey_get(%d): %x\n", __func__,
+	pkey_rights = _pkey_get(pkey, syscall_flags);
+	dprintf1("%s(%d) _pkey_get(%d): %x\n", __func__,
 			pkey, pkey, pkey_rights);
 
 	dprintf1("%s(%d) pkru: 0x%x\n", __func__, pkey, rdpkru());
@@ -487,24 +491,24 @@ void pkey_disable_clear(int pkey, int flags)
 {
 	unsigned long syscall_flags = 0;
 	int ret;
-	int pkey_rights = pkey_get(pkey, syscall_flags);
+	int pkey_rights = _pkey_get(pkey, syscall_flags);
 	u32 orig_pkru = rdpkru();
 
 	pkey_assert(flags & (PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE));
 
-	dprintf1("%s(%d) pkey_get(%d): %x\n", __func__,
+	dprintf1("%s(%d) _pkey_get(%d): %x\n", __func__,
 			pkey, pkey, pkey_rights);
 	pkey_assert(pkey_rights >= 0);
 
 	pkey_rights |= flags;
 
-	ret = pkey_set(pkey, pkey_rights, 0);
+	ret = _pkey_set(pkey, pkey_rights, 0);
 	/* pkru and flags have the same format */
 	shadow_pkru &= ~(flags << (pkey * 2));
 	pkey_assert(ret >= 0);
 
-	pkey_rights = pkey_get(pkey, syscall_flags);
-	dprintf1("%s(%d) pkey_get(%d): %x\n", __func__,
+	pkey_rights = _pkey_get(pkey, syscall_flags);
+	dprintf1("%s(%d) _pkey_get(%d): %x\n", __func__,
 			pkey, pkey, pkey_rights);
 
 	dprintf1("%s(%d) pkru: 0x%x\n", __func__, pkey, rdpkru());
-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
