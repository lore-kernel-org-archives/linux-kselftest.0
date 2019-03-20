From: sergey.senozhatsky@gmail.com (Sergey Senozhatsky)
Date: Wed, 20 Mar 2019 21:53:33 +0900
Subject: [PATCHv2 bpf-next 1/3] bpf, tests: tweak endianness selection
Message-ID: <20190320125335.19621-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320125333.dACEK0aLND8HQ1QORTUGrU3vT8B-W_1_RNIzfWZeRWM@z>

Not all compilers have __builtin_bswap16() and __builtin_bswap32(),
thus not all compilers are able to compile the following code:

        (__builtin_constant_p(x) ? \
                ___constant_swab16(x) : __builtin_bswap16(x))

That's the reason why bpf_ntohl() doesn't work on GCC < 4.8, for
instance:

        error: implicit declaration of function '__builtin_bswap16'

We can use __builtin_bswap16() only if compiler has this built-in,
that is, only if __HAVE_BUILTIN_BSWAP16__ is defined. Standard UAPI
__swab16()/__swab32() take care of that, and, additionally, handle
__builtin_constant_p() cases as well:

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

v2: fixed build error, reshuffled patches (Stanislav Fomichev)

 tools/testing/selftests/bpf/bpf_endian.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_endian.h b/tools/testing/selftests/bpf/bpf_endian.h
index b25595ea4a78..1ed268b2002b 100644
--- a/tools/testing/selftests/bpf/bpf_endian.h
+++ b/tools/testing/selftests/bpf/bpf_endian.h
@@ -20,12 +20,12 @@
  * use different targets.
  */
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-# define __bpf_ntohs(x)			__builtin_bswap16(x)
-# define __bpf_htons(x)			__builtin_bswap16(x)
+# define __bpf_ntohs(x)			__swab16(x)
+# define __bpf_htons(x)			__swab16(x)
 # define __bpf_constant_ntohs(x)	___constant_swab16(x)
 # define __bpf_constant_htons(x)	___constant_swab16(x)
-# define __bpf_ntohl(x)			__builtin_bswap32(x)
-# define __bpf_htonl(x)			__builtin_bswap32(x)
+# define __bpf_ntohl(x)			__swab32(x)
+# define __bpf_htonl(x)			__swab32(x)
 # define __bpf_constant_ntohl(x)	___constant_swab32(x)
 # define __bpf_constant_htonl(x)	___constant_swab32(x)
 #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-- 
2.21.0
