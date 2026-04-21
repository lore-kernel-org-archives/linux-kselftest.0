Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7723BE624
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770179; cv=pass; b=JzbdGRuw7B2qSx4hxpFVJipL1tTmjzxXRt1Wq0pyZFdg+3ctGSoC1x/ji5EXXHBO2rLz94EnTXEy2WIK6lmIjWBTt3mvQ/aFEdnmATRfn767wH5hrUM8FweO4n/h1VM4QHrNX78jHBVIql+Z6Ss54pQvnTtg3b8ZB4s+nBmVtJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770179; c=relaxed/simple;
	bh=xHtU+c81PCV+Q/mDHpL1ndBQSjxWRpiFVJjZ2lwUM9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqVVv6WiLr6PyW1lYXJmgf+/2GKKdXCAt8t/stnJ+TxCTsamjlg5ykOEo4PVPZBcEfVIifCCM4LraaAaH+zeb4iOc0WqA3STo571z+bGcB1orB1XLyuayH9SeOTLQPHjl1XhyO6iWFU1IdqqlYwjtcnenTk7gT/IJNdQ4ejAYXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgE4dPdA; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgE4dPdA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso55210585e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 04:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776770176; cv=none;
        d=google.com; s=arc-20240605;
        b=LcDflYhJo7kB/j9ljwL4kZUigTAsAa7gLkjghfL9DTnYTNu6G6F6tRhTKBPXk+iiYc
         H6RfDc7rr24oHfw++HXpwwUIpT16oDoV7vEMVI0I5sNXVdn9hlpRB4j1FCr6nHrNa+bF
         1nJUuYm+YUWkfF79ej4/utlo7o04KDhqgkTVx8Ko0ZZZfY++rIZARsUmpNoOsj/JHv+h
         yxZSJ4MTRb49xLW2BGrdFdVIJqZPVnNTnAScKv4ULmi/iiIu4ImRJK1rxcPgHOwgTUmK
         VK0kBFIqB1oJyXSQbGnpXC07hXBNkM59KEtHjaiyRc5Vuo/je8j1fZjiOvjmp/hKZQ+F
         zpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fq2YTgqHTIIyD2rszM0vRaUMqiq0NDdNvW+3dfjj9hc=;
        fh=LtZ2zVo0UjSTCH6rVjSWsmufiUbwaH5OaHH3RNTXopU=;
        b=VBHAkeIggnCdtkkU1/hRJdgQE1Yad9vNq/47yUiThkVmCfiA834d8Zq9Mq+g/F6pXt
         9wl3kOkxh5HuOCTl3fyZxoYSwh6Uubd5qXHDq3NHgVPdBJ8qDWXcwgG0N4d2lDboLAxX
         QbKi0Zm5AmFlaGpaHHOpoB7tx8ZePNy5kSn4V1Ym3+2vsBqR2ABsAbI/F6mHJZIwkQqo
         0wazHNTmXA3AUGXbLl3NPsci847/uskfykPxekwP8A0szo0vKaJ0qsf4QVR4/4YFytmZ
         Ctos9IH3YRyZQ629JbFvxeXMOXUyzECiqoSwplI4to9BH7+OktAzlCMnDsRaGvGPozlH
         quOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770176; x=1777374976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fq2YTgqHTIIyD2rszM0vRaUMqiq0NDdNvW+3dfjj9hc=;
        b=EgE4dPdAkIZHIf39obU0Zbkj8vLWDscdLtMB8ESx7LtQ4Pd27YLdDCgvQdB1W8t43U
         QaT+PyT2grZ+DoMmcJ4pFH6nTSYXeeFCf0hlvDEckoQjUAzwv0X4IiCPApW2eYIqZ2SG
         7su1Z249aMLn9/xORFNf5a28haSjDeVZWNACiKxbYQY+w5Xaiyj/79G/U0wbP2SaLz26
         RoQ/vj8UTGRYS/pTIljtVyTJEs2joE0E7JryBoASXtOMIkCyZkcY5fpUU0qIWrLkp8Oi
         ckiTLF9CRUYmytN0YFGvCDnMmTXal8sJelu5rjbTBXsVATXtFmwfYCU2D9o5cBVKjnmB
         su5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770176; x=1777374976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fq2YTgqHTIIyD2rszM0vRaUMqiq0NDdNvW+3dfjj9hc=;
        b=koZtTNNg+jY5ALFD+FnjtYl7bmgajp44C4bGhM6vHLyQ17Gdsa3N2Dbclqy6qu9M9s
         a/tGEd2RWhX7orOx6/Ig7xEnJEpHix2gM826Dp7C4UGf2KjQkIYwBZQ0OkcKz1JmplLu
         O4D0L/ucqCEgnYKMBkN/UyruRjwGSd00rM9jj97LeQnedLwy/RM4IUWE5u7hdDTLIlVl
         diS1Dpa5rCwWQoV0w1CvBTxVcEqxFxvkz7TapvRoprvQB3JLlcWNohOC+j3vuUWiWzO5
         TJ2CuYHSm8uys+2XBIfQ28dLq6muOaQhPif9RR7kNDOEz4iXZJP2+LjFBevZ2WyCRZon
         o7Og==
X-Forwarded-Encrypted: i=1; AFNElJ8QcnB77Cb3Wn1ksCEB9RfJnlP8HpSYy2dT+a0B4DcTPxTV2STy98EuWC0tWUe5nFnYTLz/OzmQ9gxtS/ZbLlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5vv6QzC8JYlOWkT1i5L8bMAH+ORBsxaQ4X0DH8CH2h9ZYjU9
	M0PbUIozMKjSzcjf3NI/a85jMxI/b0H/TMiLUPcNvVR6Yyf3Th/fmqxI3KukuqIKfWM3TZOCukf
	sl3rj+lTcl3JYPMG++UpRNedi4B17dU4=
X-Gm-Gg: AeBDieu+JJu9LkxkhUFhZvUiHvbGd0gnj0fpT0k/PFbgJVzxV/SBd3HujddRTnXIQwK
	qIc57+kWcwGDxj4wJ7/tGu4p0VFLaDT4UreeaAplNQwhjkUoTKcysaT5W9bDFTt6OZpF3G09IdA
	k1efJl6dBZ/d8g8+xu4k7XTx7GzPkI+xCMMcLx3BVBxFBDziUqy4ezOMRKRS8bTrKFKOKhITev4
	c9JuDIK852O9cCa3dHWutBXEWPGFx+PuiYUqKSNPts4rrbuRZn5oXUEw8r4WgNuW6CCdUtxls7J
	liVQeLHA3iZFjYu7bShq
X-Received: by 2002:a05:600c:3596:b0:48a:563c:c8c5 with SMTP id
 5b1f17b1804b1-48a563cd1b2mr30378475e9.8.1776770175648; Tue, 21 Apr 2026
 04:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418181333.1713389-3-jt26wzz@gmail.com> <20260421072017.1653163-1-kuniyu@google.com>
In-Reply-To: <20260421072017.1653163-1-kuniyu@google.com>
From: Zhenzhong Wu <jt26wzz@gmail.com>
Date: Tue, 21 Apr 2026 19:16:02 +0800
X-Gm-Features: AQROBzCfYeb2hFc2XS6OvyD81f4Di5fu65_4FeaU9mS2NrZi535PDG1ANc77Ggg
Message-ID: <CALgi0XnMTCZVEaq7+nEhZ5OANOJkwh4GCvtUNsZcsXDvXrg4bg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/bpf: check epoll readiness after
 reuseport migration
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, shuah@kernel.org, tamird@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kuniyuki, will fold this into v3.

Your approach of checking epoll right around shutdown() is much
better. I didn't think to put the check inside migrate_dance(). With
my original placement, the test still passed without patch 1 =E2=80=94 I
should have called this out in the cover letter instead of settling
for what was effectively just a smoke test.




On Tue, Apr 21, 2026 at 3:20=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> From: Zhenzhong Wu <jt26wzz@gmail.com>
> Date: Sun, 19 Apr 2026 02:13:33 +0800
> > After migrate_dance() moves established children to the target
> > listener, add it to an epoll set and verify that epoll_wait(..., 0)
> > reports it ready before accept().
> >
> > This adds epoll coverage for the TCP_ESTABLISHED reuseport migration
> > case in migrate_reuseport.
> >
> > Keep the check limited to TCP_ESTABLISHED cases. TCP_SYN_RECV and
> > TCP_NEW_SYN_RECV still depend on asynchronous handshake completion,
> > so a zero-timeout epoll_wait() would race there.
> >
> > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > ---
> >  .../bpf/prog_tests/migrate_reuseport.c        | 32 ++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c=
 b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > index 653b0a20f..580a53424 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > @@ -18,13 +18,16 @@
> >   *   9. call shutdown() for the second server
> >   *        and migrate the requests in the accept queue
> >   *        to the last server socket.
> > - *  10. call accept() for the last server socket.
> > + *  10. for TCP_ESTABLISHED cases, call epoll_wait(..., 0)
> > + *        for the last server socket.
> > + *  11. call accept() for the last server socket.
> >   *
> >   * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
> >   */
> >
> >  #include <bpf/bpf.h>
> >  #include <bpf/libbpf.h>
> > +#include <sys/epoll.h>
> >
> >  #include "test_progs.h"
> >  #include "test_migrate_reuseport.skel.h"
> > @@ -522,6 +525,33 @@ static void run_test(struct migrate_reuseport_test=
_case *test_case,
> >                       goto close_clients;
> >       }
> >
> > +     /* Only TCP_ESTABLISHED has already-migrated accept-queue entries
> > +      * here.  Later states still depend on follow-up handshake work.
> > +      */
> > +     if (test_case->state =3D=3D BPF_TCP_ESTABLISHED) {
> > +             struct epoll_event ev =3D {
> > +                     .events =3D EPOLLIN,
> > +             };
> > +             int epfd;
> > +             int nfds;
> > +
> > +             epfd =3D epoll_create1(EPOLL_CLOEXEC);
> > +             if (!ASSERT_NEQ(epfd, -1, "epoll_create1"))
> > +                     goto close_clients;
> > +
> > +             ev.data.fd =3D test_case->servers[MIGRATED_TO];
> > +             if (!ASSERT_OK(epoll_ctl(epfd, EPOLL_CTL_ADD,
> > +                                      test_case->servers[MIGRATED_TO],=
 &ev),
> > +                            "epoll_ctl"))
> > +                     goto close_epfd;
> > +
> > +             nfds =3D epoll_wait(epfd, &ev, 1, 0);
> > +             ASSERT_EQ(nfds, 1, "epoll_wait");
>
> Thanks for the update, but the test passes without patch 1.
>
> I think it would be best to test just after shutdown()
> where migration happens.
>
> Also, TCP_SYN_RECV should be covered in the same way.
>
> ---8<---
> diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b=
/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> index 580a534249a7..66fea936649e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> @@ -353,8 +353,29 @@ static int update_maps(struct migrate_reuseport_test=
_case *test_case,
>
>  static int migrate_dance(struct migrate_reuseport_test_case *test_case)
>  {
> +       struct epoll_event ev =3D {
> +               .events =3D EPOLLIN,
> +       };
> +       int epoll, nfds;
>         int i, err;
>
> +       if (test_case->state !=3D BPF_TCP_NEW_SYN_RECV) {
> +               epoll =3D epoll_create1(0);
> +               if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
> +                       return -1;
> +
> +               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> +               if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
> +                                        test_case->servers[MIGRATED_TO],=
 &ev),
> +                              "epoll_ctl")) {
> +                       goto close_epoll;
> +               }
> +
> +               nfds =3D epoll_wait(epoll, &ev, 1, 0);
> +               if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
> +                       goto close_epoll;
> +       }
> +
>         /* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
>          * to the last listener based on eBPF.
>          */
> @@ -368,6 +389,15 @@ static int migrate_dance(struct migrate_reuseport_te=
st_case *test_case)
>         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
>                 return 0;
>
> +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> +close_epoll:
> +               close(epoll);
> +               return -1;
> +       }
> +
> +       close(epoll);
> +
>         /* Note that we use the second listener instead of the
>          * first one here.
>          *
> @@ -525,33 +555,6 @@ static void run_test(struct migrate_reuseport_test_c=
ase *test_case,
>                         goto close_clients;
>         }
>
> -       /* Only TCP_ESTABLISHED has already-migrated accept-queue entries
> -        * here.  Later states still depend on follow-up handshake work.
> -        */
> -       if (test_case->state =3D=3D BPF_TCP_ESTABLISHED) {
> -               struct epoll_event ev =3D {
> -                       .events =3D EPOLLIN,
> -               };
> -               int epfd;
> -               int nfds;
> -
> -               epfd =3D epoll_create1(EPOLL_CLOEXEC);
> -               if (!ASSERT_NEQ(epfd, -1, "epoll_create1"))
> -                       goto close_clients;
> -
> -               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> -               if (!ASSERT_OK(epoll_ctl(epfd, EPOLL_CTL_ADD,
> -                                        test_case->servers[MIGRATED_TO],=
 &ev),
> -                              "epoll_ctl"))
> -                       goto close_epfd;
> -
> -               nfds =3D epoll_wait(epfd, &ev, 1, 0);
> -               ASSERT_EQ(nfds, 1, "epoll_wait");
> -
> -close_epfd:
> -               close(epfd);
> -       }
> -
>         count_requests(test_case, skel);
>
>  close_clients:
> ---8<---
