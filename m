From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Thu, 23 May 2019 17:45:49 -0400
Subject: [PATCH net 2/4] net/udpgso_bench_tx: options to exercise TX CMSG
In-Reply-To: <20190523210651.80902-3-fklassen@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-3-fklassen@appneta.com>
Message-ID:
 <CAF=yD-Lcg2wkGoKm8yGNnb_z5925PJztEAej-ahvz=2G35ke4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523214549.vD_2FOSswvJ1_el8XPX4QvyJ0TnJjQU6LNirsyPqmK4@z>

On Thu, May 23, 2019@5:11 PM Fred Klassen <fklassen@appneta.com> wrote:
>
> This enhancement adds options that facilitate load testing with
> additional TX CMSG options, and to optionally print results of
> various send CMSG operations.
>
> These options are especially useful in isolating situations
> where error-queue messages are lost when combined with other
> CMSG operations (e.g. SO_ZEROCOPY).
>
> New options:
>
>     -T - add TX CMSG that requests TX software timestamps
>     -H - similar to -T except request TX hardware timestamps
>     -q - add IP_TOS/IPV6_TCLASS TX CMSG
>     -P - call poll() before reading error queue
>     -v - print detailed results
>
> Fixes: 3a687bef148d ("selftests: udp gso benchmark")

This is not a fix, but an extension. Fixes tags help with backporting
to stable kernels. There is something to be said to backport the main
change and support SO_TIMESTAMPING + UDP_GSO on older kernels,
especially since it is very concise. But the tests should probably be
in a separate patch set targeting net-next.


> Signed-off-by: Fred Klassen <fklassen at appneta.com>
> ---
>  tools/testing/selftests/net/udpgso_bench_tx.c | 290 ++++++++++++++++++++++++--
>  1 file changed, 273 insertions(+), 17 deletions(-)
>
> diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
> index 4074538b5df5..a900f016b9e7 100644
> --- a/tools/testing/selftests/net/udpgso_bench_tx.c
> +++ b/tools/testing/selftests/net/udpgso_bench_tx.c
> @@ -5,6 +5,8 @@
>  #include <arpa/inet.h>
>  #include <errno.h>
>  #include <error.h>
> +#include <linux/errqueue.h>
> +#include <linux/net_tstamp.h>
>  #include <netinet/if_ether.h>
>  #include <netinet/in.h>
>  #include <netinet/ip.h>
> @@ -19,6 +21,7 @@
>  #include <string.h>
>  #include <sys/socket.h>
>  #include <sys/time.h>
> +#include <sys/poll.h>
>  #include <sys/types.h>
>  #include <unistd.h>
>
> @@ -34,6 +37,10 @@
>  #define SO_ZEROCOPY    60
>  #endif
>
> +#ifndef SO_EE_ORIGIN_ZEROCOPY
> +#define SO_EE_ORIGIN_ZEROCOPY 5
> +#endif
> +
>  #ifndef MSG_ZEROCOPY
>  #define MSG_ZEROCOPY   0x4000000
>  #endif
> @@ -48,9 +55,14 @@ static uint16_t      cfg_mss;
>  static int     cfg_payload_len = (1472 * 42);
>  static int     cfg_port        = 8000;
>  static int     cfg_runtime_ms  = -1;
> +static bool    cfg_poll;
>  static bool    cfg_segment;
>  static bool    cfg_sendmmsg;
>  static bool    cfg_tcp;
> +static uint32_t        cfg_tx_ts = SOF_TIMESTAMPING_TX_SOFTWARE;
> +static bool    cfg_tx_tstamp;
> +static uint32_t        cfg_tos;
> +static bool    cfg_verbose;
>  static bool    cfg_zerocopy;
>  static int     cfg_msg_nr;
>  static uint16_t        cfg_gso_size;
> @@ -58,6 +70,10 @@ static uint16_t      cfg_gso_size;
>  static socklen_t cfg_alen;
>  static struct sockaddr_storage cfg_dst_addr;
>
> +struct my_scm_timestamping {
> +       struct timespec ts[3];
> +};
> +

This and the above should not be needed if including <linux/errqueue.h>

It may be absent if relying on the host header files, but the
kselftest build system should correctly use the files from the kernel
source tree.

>  static bool interrupted;
>  static char buf[NUM_PKT][ETH_MAX_MTU];
>
> @@ -89,20 +105,20 @@ static int set_cpu(int cpu)
>
>  static void setup_sockaddr(int domain, const char *str_addr, void *sockaddr)
>  {
> -       struct sockaddr_in6 *addr6 = (void *) sockaddr;
> -       struct sockaddr_in *addr4 = (void *) sockaddr;
> +       struct sockaddr_in6 *addr6 = (void *)sockaddr;
> +       struct sockaddr_in *addr4 = (void *)sockaddr;
>
>         switch (domain) {
>         case PF_INET:
>                 addr4->sin_family = AF_INET;
>                 addr4->sin_port = htons(cfg_port);
> -               if (inet_pton(AF_INET, str_addr, &(addr4->sin_addr)) != 1)
> +               if (inet_pton(AF_INET, str_addr, &addr4->sin_addr) != 1)
>                         error(1, 0, "ipv4 parse error: %s", str_addr);
>                 break;
>         case PF_INET6:
>                 addr6->sin6_family = AF_INET6;
>                 addr6->sin6_port = htons(cfg_port);
> -               if (inet_pton(AF_INET6, str_addr, &(addr6->sin6_addr)) != 1)
> +               if (inet_pton(AF_INET6, str_addr, &addr6->sin6_addr) != 1)

Please do not include style changes like these. Try to minimize
changes required to add the new feature.
