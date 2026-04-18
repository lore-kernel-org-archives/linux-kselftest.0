Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4F2C0F81
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776487252; cv=pass; b=RSZxFp80yd++vcXvF6uMaytBb7WLVFeXhrwyRX5FZspxgbsp1X5xR1DT7a1Z0j/jvtKgKA4CL3ItRbsnqTl1uGkh8v+ux6f+F+QoDENbhU7ba422QWw+AHfO1GtOnpjERdnNtWEyacjsfYyJI5Vob6ED1wtNnW6k3/iYk+Ckpq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776487252; c=relaxed/simple;
	bh=A3sVd3vzL46qtMbuj8X2oUC4Shw8+dNIcfaILcSfVAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bavKeV/FZRNhYfCrTwAo7ePy0kUpttMtOHlr09j5KMuTFOApmy2rEa8BGqYrJ6oDdaQBNTWFo0BR6Gfw49RGODS/w0nQp1EA/yUUseMEe6qMsMKWwbsQLSLkbJ4e2/eswafUN0/si0VlLKT12WLBM0zt3lHx3pbq8zsHN52Oy5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NokvJPJk; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NokvJPJk"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c19d23b19so1896361c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 21:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776487248; cv=none;
        d=google.com; s=arc-20240605;
        b=jLvD/FTfkApGqDRHSvPh7ZG0U3AvK2WeONcH2BabvNG4rpCpQjO/0JQjpoWpU9SNxT
         rHKt7bHhnTGNiPYh6ZtxVFAlD9HtCEomc6BcTX8LEQ/SbT9vq2mpe++mUnxcimp1Yxmj
         Y08S4P4IxW7zuAymZtFGpYgwNQDCtEiLrOlLP6ZqSghIn/gKBXLWqwmt+x/zO+t8JGVh
         1TwFyFBTLrkBhGserTI1JjDovqyMyHIE41jW5dp2v0sE0Xn2gHLpf577roTGVk02e5o1
         Hilmg3jrm0rCaZscI8vEUFxp7gHUrvM651PkS2DUtydE00JG6DF0m6sbWqRcTTTXjbxr
         oIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nED4c4lvsbAAD1/z1Em8h9MkhLtsQXpnQQiI0S9EvsU=;
        fh=RWFjUqP2UisYEfF508nSsVeIzslEY8I4nyMCQIG1NVo=;
        b=OzUECw5UGtABgcoLCLTSdrT7OOqQDj1J9tizuRfDZjeB8ayPYkTuP5pPliubLejkZv
         DiO1aK868JWrDYVhxv8M4R/YqSlejdePY7X50hYrQcDvYQFVstJusIJU3UuCIirH3HIg
         T482Z/N7s7DdxvdpbLSdPw5jkAgivgD9U7btN75uAxwwNTZNgODPoCB6Q7S1232gqwdt
         WtWZSa3Fvo1fgFSc8oKrJoprCvcK9cwI37cm6kGQJ5xgqJ7MpNaCkCYzkg+ajFI8a2NI
         uMrGlEwWPaNbtHOyQ2Z6jo/3X4EOQUjhzcjbnhWHlSOTr87aJkEPM0HUA3raPuKKKYdl
         Aphg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776487248; x=1777092048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nED4c4lvsbAAD1/z1Em8h9MkhLtsQXpnQQiI0S9EvsU=;
        b=NokvJPJkJfM/Q9IyZf+GSz5LDgDI1YrnBnoQX4e5xlnrspLLsfQiRuMEDNgwRDJxgA
         96tBXBzkL1lFNAWPd9eacPXnrsBa6EbHjUYzqmVZuzKVKe9xI6JWZASZDB6dlrgFLKoT
         uDfIOx8pGvBrbe4RLbGd1uJxukr4vywrtz5qJT8qzTF0WuOTsCfZkYwYC3w+5YwOPVgy
         QHlsfmgBvNoKv+8DhIClpny1cvyKdWUBlETWaSlEfObQJtHAu46pFExZTd8cu1TyccY3
         OrY5v4YdRypcGtzlMwPoKmPlNXZBi19brbzKkSnzAlE/dQFp4xk1EMtwjn7e80J3lCTY
         0czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776487248; x=1777092048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nED4c4lvsbAAD1/z1Em8h9MkhLtsQXpnQQiI0S9EvsU=;
        b=qmRFIAjsG3WtSNDrKksAlBXAepUP2T6FxrZqpFHuO3D2yPEB0QzMUc/+PaBIy+D6vx
         I5Ek5jFdFjX6AjGb5jGhO+Se9+DpxK3YE10brwrdiudmD+0D12b5iKvBV//49HQ1yIOX
         R1JiqqCOhoYr+iHTqU/14wVHABUuJzDC5DK8ZwMZuzdYHwx373sMTFaWXpetiPLT66/Y
         YH9nQRbTm6cJrXraVqpy0Nr0sT3dIxp59RSnrQGINHxKJBV+NgHVPYNU5taPuGfTJVDp
         yI+QXL7PCmqL5X4OFJ2Sx7w6fEuDgMUDZQr6ZyDpJ6p//kAwWZsXPQmUn9sEXaMjgU3a
         me8A==
X-Forwarded-Encrypted: i=1; AFNElJ9a2iHGqE1iUxuLvlTiR9OWExcRhV8grytaO/DeG25xQOzgCe7mZGhUzlaejtPL97Hcfv271PU/7pzsANkRKkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCnpJCbkzsgJFKnr3jyZZXKFQT891eMpiprVxyDgQcSQsXhoN
	u/QQ/V4xeJOgDND9RGtYw+y64+WWJRyHMA+lQXJqhf35F2lW3KDzxugVilPX9HYRCV+fgh3tMiI
	HgfFj6vJuEhYfiD9dWk+FeNs627VXZGvfU+Yrf80h
X-Gm-Gg: AeBDieubGprt2d6IXZpeX9fyw8n9adou41fgNHRZMgNqoMy1I/ZBmemwTjRDcA2hoc0
	slUz5rbV7nfx7/Itk3uq3kzQ6od86Xr8TRtC9cMXGF7tn7ZKJmvam+Y65eCI7CElc28D7roiSSt
	ogUinXFwS+MUJqc8AW2ZIihQrO6J/vdK6nIrzcBMcwJ+1Pj0c+iaAZR7ko3Qe7QpQvt08P6Auke
	T/PZubY4IfyYsmHpSI9uvgIwDWRHs42cIFRbW6TPg11LShBO5e1dpnASB6+eNrYZzVMs5TZ+/EP
	B16XpiX5dgfvUISUp6EAYc+kVYl6Nmd9O37hHMnQcuoUJ9088NkHMK8lLlH70NXCIYOANC59lnY
	zcmiUlDP0zheZW9POmd60FdmYhtcdBeqcPzjMbQPYFqAtiAmqcx23naakB7R/XkUfqRHKg2knOA
	==
X-Received: by 2002:a05:7022:3d0f:b0:12c:3d30:37c4 with SMTP id
 a92af1059eb24-12c73f6d846mr2601374c88.7.1776487247766; Fri, 17 Apr 2026
 21:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418041633.691435-1-jt26wzz@gmail.com> <20260418041633.691435-3-jt26wzz@gmail.com>
In-Reply-To: <20260418041633.691435-3-jt26wzz@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 17 Apr 2026 21:40:36 -0700
X-Gm-Features: AQROBzA_brUhsEcG4RljvbVc1-NGoTdZXXO6ltYunQ3Wpb0-T919g5FDUkKqHi8
Message-ID: <CAAVpQUDV952gd7RW_U_-HE1tUNFZb-PxuKaFdm0m3HzOvN+iFw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: add reuseport migration wakeup
 regression tests
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 9:17=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> wr=
ote:
>
> Add selftests that reproduce missing wakeups on the target listener
> after SO_REUSEPORT migration from inet_csk_listen_stop().
>
> The epoll case connects while only the first listener is active so the
> child lands on its accept queue, registers the second listener with
> epoll, then closes the first listener to trigger migration. It verifies
> that the target listener both accepts the migrated child and becomes
> readable via epoll.
>
> The blocking accept case starts a thread blocked in accept() on the
> target listener, closes the first listener to trigger migration, and
> verifies that the blocked accept() wakes and returns the migrated
> child. Wait until the helper thread is actually asleep in accept()
> before triggering migration so the test does not race waiter
> registration.
>
> Run the tests in a private network namespace and enable
> net.ipv4.tcp_migrate_req=3D1 there so they can exercise the migration
> path without relying on a sk_reuseport/migrate BPF program. Treat a
> missing or unwritable tcp_migrate_req sysctl as SKIP. Run both
> scenarios for IPv4 and IPv6.
>
> These tests cover the bug fixed by the preceding patch.
>
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> ---
>  tools/testing/selftests/net/Makefile          |   3 +
>  .../selftests/net/reuseport_migrate_accept.c  | 533 ++++++++++++++++++
>  .../selftests/net/reuseport_migrate_epoll.c   | 353 ++++++++++++
>  3 files changed, 889 insertions(+)
>  create mode 100644 tools/testing/selftests/net/reuseport_migrate_accept.=
c
>  create mode 100644 tools/testing/selftests/net/reuseport_migrate_epoll.c

Thanks for the series.

Instead of adding new tests, can you extend
tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c ?

It covers all migration scenarios and you can just add
the target listener to epoll and call non-blocking epoll_wait(,... 0)
before accept() to check if it returns 1 (the number of fd).


>
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftes=
ts/net/Makefile
> index a275ed584..2f8b6c44d 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -184,6 +184,8 @@ TEST_GEN_PROGS :=3D \
>         reuseport_bpf_cpu \
>         reuseport_bpf_numa \
>         reuseport_dualstack \
> +       reuseport_migrate_accept \
> +       reuseport_migrate_epoll \
>         sk_bind_sendto_listen \
>         sk_connect_zero_addr \
>         sk_so_peek_off \
> @@ -232,6 +234,7 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS +=3D -lnuma
>  $(OUTPUT)/tcp_mmap: LDLIBS +=3D -lpthread -lcrypto
>  $(OUTPUT)/tcp_inq: LDLIBS +=3D -lpthread
>  $(OUTPUT)/bind_bhash: LDLIBS +=3D -lpthread
> +$(OUTPUT)/reuseport_migrate_accept: LDLIBS +=3D -lpthread
>  $(OUTPUT)/io_uring_zerocopy_tx: CFLAGS +=3D -I../../../include/
>
>  include bpf.mk
> diff --git a/tools/testing/selftests/net/reuseport_migrate_accept.c b/too=
ls/testing/selftests/net/reuseport_migrate_accept.c
> new file mode 100644
> index 000000000..a516843a0
> --- /dev/null
> +++ b/tools/testing/selftests/net/reuseport_migrate_accept.c
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +
> +#include <arpa/inet.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <netinet/in.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <stdbool.h>
> +#include <stdatomic.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/socket.h>
> +#include <sys/syscall.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "../kselftest.h"
> +
> +#define ACCEPT_BLOCK_TIMEOUT_MS 1000
> +#define ACCEPT_CLEANUP_TIMEOUT_MS 1000
> +#define ACCEPT_WAKE_TIMEOUT_MS 2000
> +#define TCP_MIGRATE_REQ_PATH "/proc/sys/net/ipv4/tcp_migrate_req"
> +
> +struct reuseport_migrate_case {
> +       const char *name;
> +       int family;
> +       const char *addr;
> +};
> +
> +struct accept_result {
> +       int listener_fd;
> +       atomic_int started;
> +       atomic_int tid;
> +       int accepted_fd;
> +       int err;
> +};
> +
> +static const struct reuseport_migrate_case test_cases[] =3D {
> +       {
> +               .name =3D "ipv4 blocking accept wake after reuseport migr=
ation",
> +               .family =3D AF_INET,
> +               .addr =3D "127.0.0.1",
> +       },
> +       {
> +               .name =3D "ipv6 blocking accept wake after reuseport migr=
ation",
> +               .family =3D AF_INET6,
> +               .addr =3D "::1",
> +       },
> +};
> +
> +static void close_fd(int *fd)
> +{
> +       if (*fd >=3D 0) {
> +               close(*fd);
> +               *fd =3D -1;
> +       }
> +}
> +
> +static bool unsupported_addr_err(int family, int err)
> +{
> +       return family =3D=3D AF_INET6 &&
> +               (err =3D=3D EAFNOSUPPORT ||
> +                err =3D=3D EPROTONOSUPPORT ||
> +                err =3D=3D EADDRNOTAVAIL);
> +}
> +
> +static int make_sockaddr(const struct reuseport_migrate_case *test_case,
> +                        unsigned short port,
> +                        struct sockaddr_storage *addr,
> +                        socklen_t *addrlen)
> +{
> +       memset(addr, 0, sizeof(*addr));
> +
> +       if (test_case->family =3D=3D AF_INET) {
> +               struct sockaddr_in *addr4 =3D (struct sockaddr_in *)addr;
> +
> +               addr4->sin_family =3D AF_INET;
> +               addr4->sin_port =3D htons(port);
> +               if (inet_pton(AF_INET, test_case->addr, &addr4->sin_addr)=
 !=3D 1)
> +                       return -1;
> +
> +               *addrlen =3D sizeof(*addr4);
> +               return 0;
> +       }
> +
> +       if (test_case->family =3D=3D AF_INET6) {
> +               struct sockaddr_in6 *addr6 =3D (struct sockaddr_in6 *)add=
r;
> +
> +               addr6->sin6_family =3D AF_INET6;
> +               addr6->sin6_port =3D htons(port);
> +               if (inet_pton(AF_INET6, test_case->addr, &addr6->sin6_add=
r) !=3D 1)
> +                       return -1;
> +
> +               *addrlen =3D sizeof(*addr6);
> +               return 0;
> +       }
> +
> +       return -1;
> +}
> +
> +static int create_reuseport_socket(const struct reuseport_migrate_case *=
test_case)
> +{
> +       int one =3D 1;
> +       int fd;
> +
> +       fd =3D socket(test_case->family, SOCK_STREAM | SOCK_CLOEXEC, IPPR=
OTO_TCP);
> +       if (fd < 0)
> +               return -1;
> +
> +       if (test_case->family =3D=3D AF_INET6 &&
> +           setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &one, sizeof(one)))=
 {
> +               close(fd);
> +               return -1;
> +       }
> +
> +       if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one))) =
{
> +               close(fd);
> +               return -1;
> +       }
> +
> +       return fd;
> +}
> +
> +static int enable_tcp_migrate_req(void)
> +{
> +       int len;
> +       int fd;
> +
> +       fd =3D open(TCP_MIGRATE_REQ_PATH, O_RDWR | O_CLOEXEC);
> +       if (fd < 0) {
> +               if (errno =3D=3D ENOENT || errno =3D=3D EACCES ||
> +                   errno =3D=3D EPERM || errno =3D=3D EROFS)
> +                       return KSFT_SKIP;
> +               return KSFT_FAIL;
> +       }
> +
> +       len =3D write(fd, "1", 1);
> +       if (len !=3D 1) {
> +               if (errno =3D=3D EACCES || errno =3D=3D EPERM || errno =
=3D=3D EROFS) {
> +                       close(fd);
> +                       return KSFT_SKIP;
> +               }
> +
> +               close(fd);
> +               return KSFT_FAIL;
> +       }
> +
> +       close(fd);
> +       return KSFT_PASS;
> +}
> +
> +static void setup_netns(void)
> +{
> +       int ret;
> +
> +       if (unshare(CLONE_NEWNET))
> +               ksft_exit_skip("unshare(CLONE_NEWNET): %s\n", strerror(er=
rno));
> +
> +       if (system("ip link set lo up"))
> +               ksft_exit_skip("failed to bring up lo interface in netns\=
n");
> +
> +       ret =3D enable_tcp_migrate_req();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_exit_skip("failed to enable tcp_migrate_req\n");
> +       if (ret =3D=3D KSFT_FAIL)
> +               ksft_exit_fail_msg("failed to enable tcp_migrate_req\n");
> +}
> +
> +static void noop_handler(int sig)
> +{
> +       (void)sig;
> +}
> +
> +static void *accept_thread(void *arg)
> +{
> +       struct accept_result *result =3D arg;
> +
> +       atomic_store_explicit(&result->tid, (int)syscall(SYS_gettid),
> +                             memory_order_release);
> +       atomic_store_explicit(&result->started, 1, memory_order_release);
> +       result->accepted_fd =3D accept4(result->listener_fd, NULL, NULL,
> +                                     SOCK_CLOEXEC);
> +       if (result->accepted_fd < 0)
> +               result->err =3D errno;
> +
> +       return NULL;
> +}
> +
> +static int read_thread_state(int tid, char *state)
> +{
> +       char *close_paren;
> +       char path[64];
> +       char buf[256];
> +       ssize_t len;
> +       int fd;
> +
> +       snprintf(path, sizeof(path), "/proc/self/task/%d/stat", tid);
> +
> +       fd =3D open(path, O_RDONLY | O_CLOEXEC);
> +       if (fd < 0)
> +               return -errno;
> +
> +       len =3D read(fd, buf, sizeof(buf) - 1);
> +       close(fd);
> +       if (len < 0)
> +               return -errno;
> +       if (!len)
> +               return -EINVAL;
> +
> +       buf[len] =3D '\0';
> +       close_paren =3D strrchr(buf, ')');
> +       if (!close_paren || close_paren[1] !=3D ' ' || !close_paren[2])
> +               return -EINVAL;
> +
> +       *state =3D close_paren[2];
> +       return 0;
> +}
> +
> +static int wait_for_accept_to_block(const struct reuseport_migrate_case =
*test_case,
> +                                   int tid)
> +{
> +       char state =3D '\0';
> +       int ret;
> +       int i;
> +
> +       /*
> +        * A started thread is not enough here: we need to know the waite=
r
> +        * has actually gone to sleep in accept() before closing listener=
_a,
> +        * otherwise migration can race ahead of waiter registration. Pol=
l
> +        * /proc task state because the pthread APIs can tell us whether =
the
> +        * thread has exited, but not whether it is already blocked in th=
e
> +        * target syscall.
> +        */
> +       for (i =3D 0; i < ACCEPT_BLOCK_TIMEOUT_MS; i++) {
> +               ret =3D read_thread_state(tid, &state);
> +               if (!ret) {
> +                       if (state =3D=3D 'S' || state =3D=3D 'D')
> +                               return KSFT_PASS;
> +                       if (state =3D=3D 'Z')
> +                               break;
> +               } else if (ret =3D=3D -ENOENT) {
> +                       break;
> +               }
> +
> +               usleep(1000);
> +       }
> +
> +       ksft_print_msg("%s: accept waiter never blocked before migration\=
n",
> +                      test_case->name);
> +       return KSFT_FAIL;
> +}
> +
> +static int join_thread_with_timeout(pthread_t thread, int timeout_ms,
> +                                   bool *timed_out)
> +{
> +       struct timespec deadline;
> +       int err;
> +
> +       *timed_out =3D false;
> +
> +       if (clock_gettime(CLOCK_REALTIME, &deadline))
> +               return KSFT_FAIL;
> +
> +       deadline.tv_nsec +=3D timeout_ms * 1000000LL;
> +       deadline.tv_sec +=3D deadline.tv_nsec / 1000000000LL;
> +       deadline.tv_nsec %=3D 1000000000LL;
> +
> +       err =3D pthread_timedjoin_np(thread, NULL, &deadline);
> +       if (!err)
> +               return KSFT_PASS;
> +
> +       if (err !=3D ETIMEDOUT)
> +               return KSFT_FAIL;
> +
> +       *timed_out =3D true;
> +       return KSFT_FAIL;
> +}
> +
> +static int interrupt_accept_thread(pthread_t thread)
> +{
> +       int err;
> +
> +       err =3D pthread_kill(thread, SIGUSR1);
> +       if (err && err !=3D ESRCH)
> +               return KSFT_FAIL;
> +
> +       return KSFT_PASS;
> +}
> +
> +static int stop_accept_thread(pthread_t thread, bool *timed_out)
> +{
> +       if (interrupt_accept_thread(thread))
> +               return KSFT_FAIL;
> +
> +       return join_thread_with_timeout(thread, ACCEPT_CLEANUP_TIMEOUT_MS=
,
> +                                       timed_out);
> +}
> +
> +static int run_test(const struct reuseport_migrate_case *test_case)
> +{
> +       struct accept_result result =3D {
> +               .listener_fd =3D -1,
> +               .started =3D 0,
> +               .tid =3D -1,
> +               .accepted_fd =3D -1,
> +               .err =3D 0,
> +       };
> +       struct sockaddr_storage addr;
> +       struct sigaction sa =3D {
> +               .sa_handler =3D noop_handler,
> +       };
> +       bool thread_joined =3D false;
> +       bool cleanup_timed_out;
> +       int listener_a =3D -1;
> +       int listener_b =3D -1;
> +       int ret =3D KSFT_FAIL;
> +       socklen_t addrlen;
> +       pthread_t thread;
> +       int client =3D -1;
> +       bool timed_out;
> +       int probe =3D -1;
> +       int tid;
> +
> +       if (make_sockaddr(test_case, 0, &addr, &addrlen)) {
> +               ksft_print_msg("%s: failed to build socket address\n",
> +                              test_case->name);
> +               goto out;
> +       }
> +
> +       if (sigemptyset(&sa.sa_mask)) {
> +               ksft_perror("sigemptyset");
> +               goto out;
> +       }
> +
> +       if (sigaction(SIGUSR1, &sa, NULL)) {
> +               ksft_perror("sigaction(SIGUSR1)");
> +               goto out;
> +       }
> +
> +       listener_a =3D create_reuseport_socket(test_case);
> +       if (listener_a < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(listener_a)");
> +               goto out;
> +       }
> +
> +       if (bind(listener_a, (struct sockaddr *)&addr, addrlen)) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("bind(listener_a)");
> +               goto out;
> +       }
> +
> +       if (listen(listener_a, 1)) {
> +               ksft_perror("listen(listener_a)");
> +               goto out;
> +       }
> +
> +       addrlen =3D sizeof(addr);
> +       if (getsockname(listener_a, (struct sockaddr *)&addr, &addrlen)) =
{
> +               ksft_perror("getsockname(listener_a)");
> +               goto out;
> +       }
> +
> +       listener_b =3D create_reuseport_socket(test_case);
> +       if (listener_b < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(listener_b)");
> +               goto out;
> +       }
> +
> +       if (bind(listener_b, (struct sockaddr *)&addr, addrlen)) {
> +               ksft_perror("bind(listener_b)");
> +               goto out;
> +       }
> +
> +       client =3D socket(test_case->family, SOCK_STREAM | SOCK_CLOEXEC, =
IPPROTO_TCP);
> +       if (client < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(client)");
> +               goto out;
> +       }
> +
> +       /* Connect while only listener_a is listening, ensuring the
> +        * child lands in listener_a's accept queue deterministically.
> +        */
> +       if (connect(client, (struct sockaddr *)&addr, addrlen)) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("connect(client)");
> +               goto out;
> +       }
> +
> +       if (listen(listener_b, 1)) {
> +               ksft_perror("listen(listener_b)");
> +               goto out;
> +       }
> +
> +       result.listener_fd =3D listener_b;
> +       if (pthread_create(&thread, NULL, accept_thread, &result)) {
> +               ksft_perror("pthread_create");
> +               goto out;
> +       }
> +
> +       while (!atomic_load_explicit(&result.started, memory_order_acquir=
e))
> +               sched_yield();
> +
> +       tid =3D atomic_load_explicit(&result.tid, memory_order_acquire);
> +       if (wait_for_accept_to_block(test_case, tid))
> +               goto out_with_thread;
> +
> +       close_fd(&listener_a);
> +
> +       ret =3D join_thread_with_timeout(thread, ACCEPT_WAKE_TIMEOUT_MS, =
&timed_out);
> +       if (ret =3D=3D KSFT_PASS) {
> +               thread_joined =3D true;
> +               if (result.accepted_fd < 0) {
> +                       ksft_print_msg("%s: blocking accept() returned er=
r=3D%d (%s)\n",
> +                                      test_case->name, result.err,
> +                                      strerror(result.err));
> +                       ret =3D KSFT_FAIL;
> +               }
> +
> +               goto out_with_thread;
> +       }
> +
> +       if (!timed_out) {
> +               ksft_print_msg("%s: join_thread_with_timeout() failed\n",
> +                              test_case->name);
> +               goto out_with_thread;
> +       }
> +
> +       if (stop_accept_thread(thread, &cleanup_timed_out) =3D=3D KSFT_FA=
IL) {
> +               ksft_print_msg("%s: failed to stop blocking accept waiter=
\n",
> +                              test_case->name);
> +               goto out_with_thread;
> +       }
> +       thread_joined =3D true;
> +
> +       if (result.accepted_fd >=3D 0) {
> +               ksft_print_msg("%s: blocking accept() completed only in c=
leanup\n",
> +                              test_case->name);
> +               goto out_with_thread;
> +       }
> +
> +       if (result.err !=3D EINTR) {
> +               ksft_print_msg("%s: blocking accept() returned err=3D%d (=
%s)\n",
> +                              test_case->name, result.err,
> +                              strerror(result.err));
> +               goto out_with_thread;
> +       }
> +
> +       probe =3D accept4(listener_b, NULL, NULL, SOCK_NONBLOCK | SOCK_CL=
OEXEC);
> +       if (probe >=3D 0) {
> +               ksft_print_msg("%s: accept queue was populated, but block=
ing accept() timed out\n",
> +                              test_case->name);
> +       } else if (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK) {
> +               ksft_print_msg("%s: target listener had no queued child a=
fter migration\n",
> +                              test_case->name);
> +       } else {
> +               ksft_perror("accept4(listener_b)");
> +       }
> +
> +out_with_thread:
> +       close_fd(&probe);
> +       if (!thread_joined) {
> +               if (stop_accept_thread(thread, &cleanup_timed_out) =3D=3D=
 KSFT_FAIL) {
> +                       ksft_print_msg("%s: failed to stop blocking accep=
t waiter\n",
> +                                      test_case->name);
> +                       ret =3D KSFT_FAIL;
> +                       goto out;
> +               }
> +
> +               thread_joined =3D true;
> +       }
> +       if (thread_joined)
> +               close_fd(&result.accepted_fd);
> +
> +out:
> +       close_fd(&client);
> +       close_fd(&listener_b);
> +       close_fd(&listener_a);
> +
> +       return ret;
> +}
> +
> +int main(void)
> +{
> +       int status =3D KSFT_PASS;
> +       int ret;
> +       int i;
> +
> +       setup_netns();
> +
> +       ksft_print_header();
> +       ksft_set_plan(ARRAY_SIZE(test_cases));
> +
> +       for (i =3D 0; i < ARRAY_SIZE(test_cases); i++) {
> +               ret =3D run_test(&test_cases[i]);
> +               ksft_test_result_code(ret, test_cases[i].name, NULL);
> +
> +               if (ret =3D=3D KSFT_FAIL)
> +                       status =3D KSFT_FAIL;
> +       }
> +
> +       if (status =3D=3D KSFT_FAIL)
> +               ksft_exit_fail();
> +
> +       ksft_finished();
> +}
> diff --git a/tools/testing/selftests/net/reuseport_migrate_epoll.c b/tool=
s/testing/selftests/net/reuseport_migrate_epoll.c
> new file mode 100644
> index 000000000..9cbfb58c4
> --- /dev/null
> +++ b/tools/testing/selftests/net/reuseport_migrate_epoll.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +
> +#include <arpa/inet.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <netinet/in.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/epoll.h>
> +#include <sys/socket.h>
> +#include <unistd.h>
> +
> +#include "../kselftest.h"
> +
> +#define EPOLL_TIMEOUT_MS 500
> +#define TCP_MIGRATE_REQ_PATH "/proc/sys/net/ipv4/tcp_migrate_req"
> +
> +struct reuseport_migrate_case {
> +       const char *name;
> +       int family;
> +       const char *addr;
> +};
> +
> +static const struct reuseport_migrate_case test_cases[] =3D {
> +       {
> +               .name =3D "ipv4 epoll wake after reuseport migration",
> +               .family =3D AF_INET,
> +               .addr =3D "127.0.0.1",
> +       },
> +       {
> +               .name =3D "ipv6 epoll wake after reuseport migration",
> +               .family =3D AF_INET6,
> +               .addr =3D "::1",
> +       },
> +};
> +
> +static void close_fd(int *fd)
> +{
> +       if (*fd >=3D 0) {
> +               close(*fd);
> +               *fd =3D -1;
> +       }
> +}
> +
> +static bool unsupported_addr_err(int family, int err)
> +{
> +       return family =3D=3D AF_INET6 &&
> +               (err =3D=3D EAFNOSUPPORT ||
> +                err =3D=3D EPROTONOSUPPORT ||
> +                err =3D=3D EADDRNOTAVAIL);
> +}
> +
> +static int make_sockaddr(const struct reuseport_migrate_case *test_case,
> +                        unsigned short port,
> +                        struct sockaddr_storage *addr,
> +                        socklen_t *addrlen)
> +{
> +       memset(addr, 0, sizeof(*addr));
> +
> +       if (test_case->family =3D=3D AF_INET) {
> +               struct sockaddr_in *addr4 =3D (struct sockaddr_in *)addr;
> +
> +               addr4->sin_family =3D AF_INET;
> +               addr4->sin_port =3D htons(port);
> +               if (inet_pton(AF_INET, test_case->addr, &addr4->sin_addr)=
 !=3D 1)
> +                       return -1;
> +
> +               *addrlen =3D sizeof(*addr4);
> +               return 0;
> +       }
> +
> +       if (test_case->family =3D=3D AF_INET6) {
> +               struct sockaddr_in6 *addr6 =3D (struct sockaddr_in6 *)add=
r;
> +
> +               addr6->sin6_family =3D AF_INET6;
> +               addr6->sin6_port =3D htons(port);
> +               if (inet_pton(AF_INET6, test_case->addr, &addr6->sin6_add=
r) !=3D 1)
> +                       return -1;
> +
> +               *addrlen =3D sizeof(*addr6);
> +               return 0;
> +       }
> +
> +       return -1;
> +}
> +
> +static int create_reuseport_socket(const struct reuseport_migrate_case *=
test_case)
> +{
> +       int one =3D 1;
> +       int fd;
> +
> +       fd =3D socket(test_case->family, SOCK_STREAM | SOCK_CLOEXEC, IPPR=
OTO_TCP);
> +       if (fd < 0)
> +               return -1;
> +
> +       if (test_case->family =3D=3D AF_INET6 &&
> +           setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &one, sizeof(one)))=
 {
> +               close(fd);
> +               return -1;
> +       }
> +
> +       if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one))) =
{
> +               close(fd);
> +               return -1;
> +       }
> +
> +       return fd;
> +}
> +
> +static int set_nonblocking(int fd)
> +{
> +       int flags;
> +
> +       flags =3D fcntl(fd, F_GETFL);
> +       if (flags < 0)
> +               return -1;
> +
> +       return fcntl(fd, F_SETFL, flags | O_NONBLOCK);
> +}
> +
> +static int enable_tcp_migrate_req(void)
> +{
> +       int len;
> +       int fd;
> +
> +       fd =3D open(TCP_MIGRATE_REQ_PATH, O_RDWR | O_CLOEXEC);
> +       if (fd < 0) {
> +               if (errno =3D=3D ENOENT || errno =3D=3D EACCES ||
> +                   errno =3D=3D EPERM || errno =3D=3D EROFS)
> +                       return KSFT_SKIP;
> +               return KSFT_FAIL;
> +       }
> +
> +       len =3D write(fd, "1", 1);
> +       if (len !=3D 1) {
> +               if (errno =3D=3D EACCES || errno =3D=3D EPERM || errno =
=3D=3D EROFS) {
> +                       close(fd);
> +                       return KSFT_SKIP;
> +               }
> +
> +               close(fd);
> +               return KSFT_FAIL;
> +       }
> +
> +       close(fd);
> +       return KSFT_PASS;
> +}
> +
> +static void setup_netns(void)
> +{
> +       int ret;
> +
> +       if (unshare(CLONE_NEWNET))
> +               ksft_exit_skip("unshare(CLONE_NEWNET): %s\n", strerror(er=
rno));
> +
> +       if (system("ip link set lo up"))
> +               ksft_exit_skip("failed to bring up lo interface in netns\=
n");
> +
> +       ret =3D enable_tcp_migrate_req();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_exit_skip("failed to enable tcp_migrate_req\n");
> +       if (ret =3D=3D KSFT_FAIL)
> +               ksft_exit_fail_msg("failed to enable tcp_migrate_req\n");
> +}
> +
> +static int run_test(const struct reuseport_migrate_case *test_case)
> +{
> +       struct sockaddr_storage addr;
> +       struct epoll_event ev =3D {
> +               .events =3D EPOLLIN,
> +       };
> +       int listener_a =3D -1;
> +       int listener_b =3D -1;
> +       int ret =3D KSFT_FAIL;
> +       socklen_t addrlen;
> +       int accepted =3D -1;
> +       int client =3D -1;
> +       int epfd =3D -1;
> +       int n;
> +
> +       if (make_sockaddr(test_case, 0, &addr, &addrlen)) {
> +               ksft_print_msg("%s: failed to build socket address\n",
> +                              test_case->name);
> +               goto out;
> +       }
> +
> +       listener_a =3D create_reuseport_socket(test_case);
> +       if (listener_a < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(listener_a)");
> +               goto out;
> +       }
> +
> +       if (bind(listener_a, (struct sockaddr *)&addr, addrlen)) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("bind(listener_a)");
> +               goto out;
> +       }
> +
> +       if (listen(listener_a, 1)) {
> +               ksft_perror("listen(listener_a)");
> +               goto out;
> +       }
> +
> +       addrlen =3D sizeof(addr);
> +       if (getsockname(listener_a, (struct sockaddr *)&addr, &addrlen)) =
{
> +               ksft_perror("getsockname(listener_a)");
> +               goto out;
> +       }
> +
> +       listener_b =3D create_reuseport_socket(test_case);
> +       if (listener_b < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(listener_b)");
> +               goto out;
> +       }
> +
> +       if (bind(listener_b, (struct sockaddr *)&addr, addrlen)) {
> +               ksft_perror("bind(listener_b)");
> +               goto out;
> +       }
> +
> +       client =3D socket(test_case->family, SOCK_STREAM | SOCK_CLOEXEC, =
IPPROTO_TCP);
> +       if (client < 0) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("socket(client)");
> +               goto out;
> +       }
> +
> +       /* Connect while only listener_a is listening, ensuring the
> +        * child lands in listener_a's accept queue deterministically.
> +        */
> +       if (connect(client, (struct sockaddr *)&addr, addrlen)) {
> +               if (unsupported_addr_err(test_case->family, errno)) {
> +                       ret =3D KSFT_SKIP;
> +                       goto out;
> +               }
> +
> +               ksft_perror("connect(client)");
> +               goto out;
> +       }
> +
> +       if (listen(listener_b, 1)) {
> +               ksft_perror("listen(listener_b)");
> +               goto out;
> +       }
> +
> +       if (set_nonblocking(listener_b)) {
> +               ksft_perror("set_nonblocking(listener_b)");
> +               goto out;
> +       }
> +
> +       epfd =3D epoll_create1(EPOLL_CLOEXEC);
> +       if (epfd < 0) {
> +               ksft_perror("epoll_create1");
> +               goto out;
> +       }
> +
> +       ev.data.fd =3D listener_b;
> +       if (epoll_ctl(epfd, EPOLL_CTL_ADD, listener_b, &ev)) {
> +               ksft_perror("epoll_ctl(ADD listener_b)");
> +               goto out;
> +       }
> +
> +       close_fd(&listener_a);
> +
> +       n =3D epoll_wait(epfd, &ev, 1, EPOLL_TIMEOUT_MS);
> +       if (n < 0) {
> +               ksft_perror("epoll_wait");
> +               goto out;
> +       }
> +
> +       accepted =3D accept4(listener_b, NULL, NULL, SOCK_NONBLOCK | SOCK=
_CLOEXEC);
> +       if (accepted < 0) {
> +               if (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK) {
> +                       ksft_print_msg("%s: target listener had no queued=
 child after migration\n",
> +                                      test_case->name);
> +                       goto out;
> +               }
> +
> +               ksft_perror("accept4(listener_b)");
> +               goto out;
> +       }
> +
> +       if (n !=3D 1) {
> +               ksft_print_msg("%s: accept queue was populated, but epoll=
_wait() timed out\n",
> +                              test_case->name);
> +               goto out;
> +       }
> +
> +       if (ev.data.fd !=3D listener_b || !(ev.events & EPOLLIN)) {
> +               ksft_print_msg("%s: unexpected epoll event fd=3D%d events=
=3D%#x\n",
> +                              test_case->name, ev.data.fd, ev.events);
> +               goto out;
> +       }
> +
> +       ret =3D KSFT_PASS;
> +
> +out:
> +       close_fd(&accepted);
> +       close_fd(&epfd);
> +       close_fd(&client);
> +       close_fd(&listener_b);
> +       close_fd(&listener_a);
> +
> +       return ret;
> +}
> +
> +int main(void)
> +{
> +       int status =3D KSFT_PASS;
> +       int ret;
> +       int i;
> +
> +       setup_netns();
> +
> +       ksft_print_header();
> +       ksft_set_plan(ARRAY_SIZE(test_cases));
> +
> +       for (i =3D 0; i < ARRAY_SIZE(test_cases); i++) {
> +               ret =3D run_test(&test_cases[i]);
> +               ksft_test_result_code(ret, test_cases[i].name, NULL);
> +
> +               if (ret =3D=3D KSFT_FAIL)
> +                       status =3D KSFT_FAIL;
> +       }
> +
> +       if (status =3D=3D KSFT_FAIL)
> +               ksft_exit_fail();
> +
> +       ksft_finished();
> +}
> --
> 2.43.0
>
