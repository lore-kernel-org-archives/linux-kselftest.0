From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Thu, 23 May 2019 17:52:53 -0400
Subject: [PATCH net 2/4] net/udpgso_bench_tx: options to exercise TX CMSG
In-Reply-To: <20190523210651.80902-3-fklassen@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-3-fklassen@appneta.com>
Message-ID:
 <CAF=yD-JBf6k7VLa6FQowuD5xDFbq5cB4ScTi7kb1hieQFDKnbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523215253.i2CdVi5aa5QkgySBwMukzTWIietwWPLP9GbbY9k5PLI@z>

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

To ensure that we do not regress, when adding options, please consider
(just a general suggestion, not a strong request for this patch set)
updating the kselftest to run a variant of the test with the new code
coverage. In this case, make the code pass/fail instead of only user
interpretable and add variants to udpgso.sh.

>     -P - call poll() before reading error queue
>     -v - print detailed results
>
> Fixes: 3a687bef148d ("selftests: udp gso benchmark")
> Signed-off-by: Fred Klassen <fklassen at appneta.com>

> +static void flush_errqueue_recv(int fd)
>  {
>         struct msghdr msg = {0};        /* flush */
> +       struct cmsghdr *cmsg;
> +       struct iovec entry;
> +       char control[1024];

can use more precise CMSG_SPACE based on worst case expectations, like
in udp_sendmmsg

> +       char buf[1500];

no need for payload

> +static void flush_errqueue(int fd)
> +{
> +       if (cfg_poll) {
> +               struct pollfd fds = { 0 };
> +               int ret;
> +
> +               fds.fd = fd;
> +               fds.events = POLLERR;

no need to pass POLLERR, it is always returned in revents.
