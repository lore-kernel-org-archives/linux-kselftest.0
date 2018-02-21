From: daniel.diaz at linaro.org (=?UTF-8?Q?Daniel_D=c3=adaz?=)
Date: Wed, 21 Feb 2018 15:38:45 -0600
Subject: [PATCH] selftests/bpf: tcpbpf_kern: use in6_* macros from glibc
In-Reply-To: <20180221165116.9754-1-anders.roxell@linaro.org>
References: <20180221165116.9754-1-anders.roxell@linaro.org>
Message-ID: <02cb5e7d-5119-8501-01b7-9ea0f4b95450@linaro.org>

On 02/21/2018 10:51 AM, Anders Roxell wrote:
> Both glibc and the kernel have in6_* macros definitions. Build fails
> because it picks up wrong in6_* macro from the kernel header and not the
> header from glibc.
> 
> Fixes build error below:
> clang -I. -I./include/uapi -I../../../include/uapi
>      -Wno-compare-distinct-pointer-types \
>          -O2 -target bpf -emit-llvm -c test_tcpbpf_kern.c -o - |      \
> llc -march=bpf -mcpu=generic -filetype=obj
>      -o .../tools/testing/selftests/bpf/test_tcpbpf_kern.o
> In file included from test_tcpbpf_kern.c:12:
> .../netinet/in.h:101:5: error: expected identifier
>     IPPROTO_HOPOPTS = 0,   /* IPv6 Hop-by-Hop options.  */
>     ^
> .../linux/in6.h:131:26: note: expanded from macro 'IPPROTO_HOPOPTS'
>                                 ^
> In file included from test_tcpbpf_kern.c:12:
> /usr/include/netinet/in.h:103:5: error: expected identifier
>     IPPROTO_ROUTING = 43,  /* IPv6 routing header.  */
>     ^
> .../linux/in6.h:132:26: note: expanded from macro 'IPPROTO_ROUTING'
>                                 ^
> In file included from test_tcpbpf_kern.c:12:
> .../netinet/in.h:105:5: error: expected identifier
>     IPPROTO_FRAGMENT = 44, /* IPv6 fragmentation header.  */
>     ^
> 
> Since both glibc and the kernel have in6_* macros definitions, use the
> one from glibc.  Kernel headers will check for previous libc definitions
> by including include/linux/libc-compat.h.
> 
> Reported-by: Daniel Díaz <daniel.diaz at linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

FWIW, this was
Tested-by: Daniel Díaz <daniel.diaz at linaro.org>

> ---
>  tools/testing/selftests/bpf/test_tcpbpf_kern.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_tcpbpf_kern.c b/tools/testing/selftests/bpf/test_tcpbpf_kern.c
> index 57119ad57a3f..3e645ee41ed5 100644
> --- a/tools/testing/selftests/bpf/test_tcpbpf_kern.c
> +++ b/tools/testing/selftests/bpf/test_tcpbpf_kern.c
> @@ -5,7 +5,6 @@
>  #include <linux/if_ether.h>
>  #include <linux/if_packet.h>
>  #include <linux/ip.h>
> -#include <linux/in6.h>
>  #include <linux/types.h>
>  #include <linux/socket.h>
>  #include <linux/tcp.h>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
