From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 17:35:35 -0400
Subject: [PATCH net-next v2 1/3] net/udpgso_bench_tx: options to exercise
 TX CMSG
In-Reply-To: <20190528184708.16516-2-fklassen@appneta.com>
References: <20190528184708.16516-1-fklassen@appneta.com>
 <20190528184708.16516-2-fklassen@appneta.com>
Message-ID:
 <CAF=yD-KcA5NZ2_tp3zaxW5sbf75a17DLX+VR9hyZo7MTcYAxiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528213535.3HVDF2hd-TGjuxBVeSdIg6XVSYM_PJM20Fv1YLFG0yI@z>

On Tue, May 28, 2019@3:24 PM Fred Klassen <fklassen@appneta.com> wrote:
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
>     -a - count all CMSG messages and match to sent messages
>     -T - add TX CMSG that requests TX software timestamps
>     -H - similar to -T except request TX hardware timestamps
>     -P - call poll() before reading error queue
>     -v - print detailed results
>
> v2: Enhancements as per Willem de Bruijn <willemb at google.com>
>     - Updated control and buffer parameters for recvmsg
>     - poll() parameter cleanup
>     - fail on bad audit results
>     - remove TOS options
>     - improved reporting
>
> Signed-off-by: Fred Klassen <fklassen at appneta.com>
> ---

> -static void flush_zerocopy(int fd)
> +static void flush_cmsg(struct cmsghdr *cmsg)
>  {
> -       struct msghdr msg = {0};        /* flush */
> +       switch (cmsg->cmsg_level) {
> +       case SOL_SOCKET:
> +               if (cmsg->cmsg_type == SO_TIMESTAMPING) {
> +                       int i;
> +
> +                       i = (cfg_tx_ts == SOF_TIMESTAMPING_TX_HARDWARE) ? 2 : 0;
> +                       struct scm_timestamping *tss;

Please don't mix declarations and code.

> +
> +                       tss = (struct scm_timestamping *)CMSG_DATA(cmsg);
> +                       if (tss->ts[i].tv_sec == 0)
> +                               stat_tx_ts_errors++;
> +               } else {
> +                       error(1, 0,
> +                             "unknown SOL_SOCKET cmsg type=%u level=%u\n",
> +                             cmsg->cmsg_type, cmsg->cmsg_level);

Technically, no need to repeat cmsg_level
> +               }
> +               break;
> +       case SOL_IP:
> +       case SOL_IPV6:
> +               switch (cmsg->cmsg_type) {
> +               case IP_RECVERR:
> +               case IPV6_RECVERR:
> +               {
> +                       struct sock_extended_err *err;
> +
> +                       err = (struct sock_extended_err *)CMSG_DATA(cmsg);
> +                       switch (err->ee_origin) {
> +                       case SO_EE_ORIGIN_TIMESTAMPING:
> +                               // Got a TX timestamp from error queue
> +                               stat_tx_ts++;
> +                               break;
> +                       case SO_EE_ORIGIN_ICMP:
> +                       case SO_EE_ORIGIN_ICMP6:
> +                               if (cfg_verbose)
> +                                       fprintf(stderr,
> +                                               "received ICMP error: type=%u, code=%u\n",
> +                                               err->ee_type, err->ee_code);
> +                               break;
> +                       case SO_EE_ORIGIN_ZEROCOPY:
> +                       {
> +                               __u32 lo = err->ee_info;
> +                               __u32 hi = err->ee_data;
> +
> +                               if (hi == lo - 1) {
> +                                       // TX was aborted

where does this come from?

> +                                       stat_zcopy_errors++;
> +                                       if (cfg_verbose)
> +                                               fprintf(stderr,
> +                                                       "Zerocopy TX aborted: lo=%u hi=%u\n",
> +                                                       lo, hi);
> +                               } else if (hi == lo) {

technically, no need to special case

> +                                       // single ID acknowledged
> +                                       stat_zcopies++;
> +                               } else {
> +                                       // range of IDs acknowledged
> +                                       stat_zcopies += hi - lo + 1;
> +                               }
> +                               break;

> +static void set_tx_timestamping(int fd)
> +{
> +       int val = SOF_TIMESTAMPING_OPT_CMSG | SOF_TIMESTAMPING_OPT_ID;

Could consider adding SOF_TIMESTAMPING_OPT_TSONLY to not have to deal
with a data buffer on recv from errqueue.
