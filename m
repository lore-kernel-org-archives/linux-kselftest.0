From: lizhijian@cn.fujitsu.com (Li Zhijian)
Date: Tue, 8 May 2018 17:14:29 +0800
Subject: [PATCH 1/2] tools/testing/selftests/x86: fix warning:
 "SEGV_PKUERR|SEGV_BNDERR" redefined
Message-ID: <1525770870-19067-1-git-send-email-lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508091429.LNvF9Q59cldIpCQC5KXwXFNsZ7UEhLdFf2D1Ho9nEAM@z>

SEGV_PKUERR and SEGV_BNDERR are defined since glibc-2.27

fix the following issue:
-------------------
root at vm-lkp-nex04-4G-5 /usr/src/linux-selftests-x86_64-rhel-7.2-75bc37fefc4471e718ba8e651aa74673d4e0a9eb/tools/testing/selftests/x86# make
gcc -m32 -o /usr/src/linux-selftests-x86_64-rhel-7.2-75bc37fefc4471e718ba8e651aa74673d4e0a9eb/tools/testing/selftests/x86/protection_keys_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 protection_keys.c -lrt -ldl -lm
gcc -m64 -o /usr/src/linux-selftests-x86_64-rhel-7.2-75bc37fefc4471e718ba8e651aa74673d4e0a9eb/tools/testing/selftests/x86/protection_keys_64 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 protection_keys.c -lrt -ldl
protection_keys.c:228:0: warning: "SEGV_BNDERR" redefined
 #define SEGV_BNDERR     3  /* failed address bound checks */
 ^
In file included from /usr/include/signal.h:58:0,
                 from protection_keys.c:33:
/usr/include/bits/siginfo-consts.h:117:0: note: this is the location of the previous definition
 #  define SEGV_BNDERR SEGV_BNDERR
 ^
protection_keys.c:229:0: warning: "SEGV_PKUERR" redefined
 #define SEGV_PKUERR     4
 ^
In file included from /usr/include/signal.h:58:0,
                 from protection_keys.c:33:
/usr/include/bits/siginfo-consts.h:119:0: note: this is the location of the previous definition
 #  define SEGV_PKUERR SEGV_PKUERR
 ^
protection_keys.c:228:0: warning: "SEGV_BNDERR" redefined
 #define SEGV_BNDERR     3  /* failed address bound checks */
 ^
In file included from /usr/include/signal.h:58:0,
                 from protection_keys.c:33:
/usr/include/x86_64-linux-gnu/bits/siginfo-consts.h:117:0: note: this is the location of the previous definition
 #  define SEGV_BNDERR SEGV_BNDERR
 ^
protection_keys.c:229:0: warning: "SEGV_PKUERR" redefined
 #define SEGV_PKUERR     4
 ^
In file included from /usr/include/signal.h:58:0,
                 from protection_keys.c:33:
/usr/include/x86_64-linux-gnu/bits/siginfo-consts.h:119:0: note: this is the location of the previous definition
 #  define SEGV_PKUERR SEGV_PKUERR
 ^
-------------------

Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/x86/protection_keys.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/protection_keys.c b/tools/testing/selftests/x86/protection_keys.c
index f15aa5a..757bb16 100644
--- a/tools/testing/selftests/x86/protection_keys.c
+++ b/tools/testing/selftests/x86/protection_keys.c
@@ -225,8 +225,12 @@ void dump_mem(void *dumpme, int len_bytes)
 	}
 }
 
-#define SEGV_BNDERR     3  /* failed address bound checks */
-#define SEGV_PKUERR     4
+#ifndef SEGV_BNDERR
+# define SEGV_BNDERR     3  /* failed address bound checks */
+#endif
+#ifndef SEGV_PKUERR
+# define SEGV_PKUERR     4
+#endif
 
 static char *si_code_str(int si_code)
 {
-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
