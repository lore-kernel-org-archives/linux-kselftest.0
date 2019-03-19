From: sergey.senozhatsky.work at gmail.com (Sergey Senozhatsky)
Date: Tue, 19 Mar 2019 11:33:31 +0900
Subject: [PATCH] bpf, tests: tweak endianness selection
Message-ID: <20190319023331.23207-1-sergey.senozhatsky@gmail.com>

Not all compilers have __builtin_bswap16() and __builtin_bswap32(),
thus not all compilers are able to compile the following code
(bpf_htons):

	(__builtin_constant_p(x) ? \
	 	___constant_swab16(x) : __builtin_bswap16(x))

That's why, for instance, bpf_htons() doesn't work on GCC < 4.8:

	error: implicit declaration of function '__builtin_bswap16'

We can use __builtin_bswap16() only if compiler has this built-in,
that is, only if __HAVE_BUILTIN_BSWAP16__ is defined. Standard UAPI
__swab16()/__swab32() take care of that, and, additionally, handle
__builtin_constant_p() cases as well (if compiler doesn't provide
builtin bswap with constants folding):

 #ifdef __HAVE_BUILTIN_BSWAP16__
 #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
 #else
 #define __swab16(x)                             \
         (__builtin_constant_p((__u16)(x)) ?     \
         ___constant_swab16(x) :                 \
         __fswab16(x))
 #endif

So we can tweak selftests/bpf/bpf_endian.h and use UAPI
__swab16()/__swab32().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
---
 tools/testing/selftests/bpf/bpf_endian.h | 37 +++++-------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_endian.h b/tools/testing/selftests/bpf/bpf_endian.h
index b25595ea4a78..ba06222963d5 100644
--- a/tools/testing/selftests/bpf/bpf_endian.h
+++ b/tools/testing/selftests/bpf/bpf_endian.h
@@ -20,38 +20,17 @@
  * use different targets.
  */
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-# define __bpf_ntohs(x)			__builtin_bswap16(x)
-# define __bpf_htons(x)			__builtin_bswap16(x)
-# define __bpf_constant_ntohs(x)	___constant_swab16(x)
-# define __bpf_constant_htons(x)	___constant_swab16(x)
-# define __bpf_ntohl(x)			__builtin_bswap32(x)
-# define __bpf_htonl(x)			__builtin_bswap32(x)
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
