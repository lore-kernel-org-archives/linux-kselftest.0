From: sergey.senozhatsky at gmail.com (Sergey Senozhatsky)
Date: Wed, 20 Mar 2019 21:53:34 +0900
Subject: [PATCHv2 bpf-next 2/3] bpf,
 tests: drop unused __bpf_constant_foo defines
In-Reply-To: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
References: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
Message-ID: <20190320125335.19621-2-sergey.senozhatsky@gmail.com>

Additionally, simplify bpf_ntohs/bpf_ntohl/bpf_htons/bpf_htonl
by switching to UAPI swab().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
---
 tools/testing/selftests/bpf/bpf_endian.h | 37 +++++-------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_endian.h b/tools/testing/selftests/bpf/bpf_endian.h
index 1ed268b2002b..ba06222963d5 100644
--- a/tools/testing/selftests/bpf/bpf_endian.h
+++ b/tools/testing/selftests/bpf/bpf_endian.h
@@ -20,38 +20,17 @@
  * use different targets.
  */
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-# define __bpf_ntohs(x)			__swab16(x)
-# define __bpf_htons(x)			__swab16(x)
-# define __bpf_constant_ntohs(x)	___constant_swab16(x)
-# define __bpf_constant_htons(x)	___constant_swab16(x)
-# define __bpf_ntohl(x)			__swab32(x)
-# define __bpf_htonl(x)			__swab32(x)
-# define __bpf_constant_ntohl(x)	___constant_swab32(x)
-# define __bpf_constant_htonl(x)	___constant_swab32(x)
+# define bpf_ntohs(x)		__swab16(x)
+# define bpf_htons(x)		__swab16(x)
+# define bpf_ntohl(x)		__swab32(x)
+# define bpf_htonl(x)		__swab32(x)
 #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-# define __bpf_ntohs(x)			(x)
-# define __bpf_htons(x)			(x)
-# define __bpf_constant_ntohs(x)	(x)
-# define __bpf_constant_htons(x)	(x)
-# define __bpf_ntohl(x)			(x)
-# define __bpf_htonl(x)			(x)
-# define __bpf_constant_ntohl(x)	(x)
-# define __bpf_constant_htonl(x)	(x)
+# define bpf_ntohs(x)		(x)
+# define bpf_htons(x)		(x)
+# define bpf_ntohl(x)		(x)
+# define bpf_htonl(x)		(x)
 #else
 # error "Fix your compiler's __BYTE_ORDER__?!"
 #endif
 
-#define bpf_htons(x)				\
-	(__builtin_constant_p(x) ?		\
-	 __bpf_constant_htons(x) : __bpf_htons(x))
-#define bpf_ntohs(x)				\
-	(__builtin_constant_p(x) ?		\
-	 __bpf_constant_ntohs(x) : __bpf_ntohs(x))
-#define bpf_htonl(x)				\
-	(__builtin_constant_p(x) ?		\
-	 __bpf_constant_htonl(x) : __bpf_htonl(x))
-#define bpf_ntohl(x)				\
-	(__builtin_constant_p(x) ?		\
-	 __bpf_constant_ntohl(x) : __bpf_ntohl(x))
-
 #endif /* __BPF_ENDIAN__ */
-- 
2.21.0
