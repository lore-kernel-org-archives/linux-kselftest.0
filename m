Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224F30F95F
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839681; cv=pass; b=X6lrsJJssqI5+7BAhSCC2mcPT4fiWj9EMfvNgx+E/Dnrnt2gVzQXHsm+Q+s3FLHzez2N2/QEFdCLMf6tnfKmfWlu/bnJL4povKpMNcUVLufGf+pCt9uMfmn1pwLvhssdTxUA6QL6ZA6+DJyEVfQGOpZVdTYWPKMX+FiMm1//3rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839681; c=relaxed/simple;
	bh=L5xw+IE6r4iubLQXw2KRZiyATRr5PhUz8ChPPezbBD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3gQ5eQEo4rj1G+tPe1vcxxSH2S6xVisaJIbmg4mrAmf8jLpx7B70zn+s0FhMy9NkBRgXTKB04eZJ/+eXlCphMrhcpEXbedRbLyuzenMIG7BUYbW9NvFgIIi4JcvyXDPT8RnnzZBrjm324OgxZexjL+WBi2M0cZ4cNiLhDVXWas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ok4uYw1Q; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok4uYw1Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so35345515e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 23:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839678; cv=none;
        d=google.com; s=arc-20240605;
        b=WLZx1ua9X9TGP3rCfDq6VJ91wlUjoHyw8BMhGzhki7GGCKFAuzAL849Bn5wS58hyc1
         MAKaSigO+YlU9D/Esr0u55e9eV/TcXnfhn17biepFg3VNrilBVlpFfpOdatfHEOwjxY+
         ETF/UOeMA+FMytubxrbNwob8cDYdhKMwkiPg6N+X24Lv4yMsyPSaJG6ENpUzx92jmIP4
         unDdFwntIyX70ynYoFrX38UgNKzP6OQnIxrJuzXvWHe4CVX6AvkQL93JEZUNQoijunDp
         AYDczPPnrIlVBoaBTVJ0mzstQQKnzcvgjde7HkE6l8JkWZ899XO+LGoP3/gD7iCSs8hs
         5VUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shDKR9F1B5bz8bwMraZHyZozJCPGpiT8/hqG0ENFR6g=;
        fh=3ZxpAnEAfNTn7sPacJoFi+LGvUfcWy/UU0gsSV7AyD4=;
        b=RtDSRqYFSrOrQh9TDGq4dy0NnwboCkIMY74qXV7rolw3fmzm1b4ZH7E5EbdV21wlr+
         vMwVhd1otdU0UB3jeCzkwRw1ofdYYgijdwVz7jAVtO2KDx3geaa9BP7GTzvU1W+WiV6D
         8O8bcSRZzRtuJJffOP/CdTfL6HJ2jTJiMLvzaxQl6UpuVVgXAtbEDRKkV3Q09cBGBuKP
         8ghp5ps3n6muLXQKHxHr2pl59DSs8nEP2U3MzKjQusGWcgN9m7hFvPFVKHyoAdKzAsfo
         1tVP1r+obOhPk1PK7Xu7MyJ/UqlCvt42D7z6IJb9xjNch+obwMB/n6SNY6JB4LWVLKUX
         U4pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839678; x=1777444478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shDKR9F1B5bz8bwMraZHyZozJCPGpiT8/hqG0ENFR6g=;
        b=ok4uYw1QPkKjNVFvbFhzbEJtl6vyk8TfekSxM1yIScj9TkM8sG7qlyq3mBMSfaUNKK
         I1u9ZTXLZzTV6xBxWOm5n3pt+BWXq4irskUj9zIgFqkTBRtkYHkr86LWeFEjvvO8HXZu
         Fs0qi270IouOBvsZmQ+yjxJ/MmgVVwuwX5Ff+y4giK7mrnRIS5r1rA18cGbFmIHmd85L
         RC8mQJTc4rV47s42PuuNj4y6VJUis3/hwCzuYStM/cLsL40lRhz3a0tqZTRhqYujt6qQ
         hFcADLdv9jmDADAh2f4BIyEAGChJdhBcLr4c/x80okRhg3FtTARiFos6mDwMQ/gEbDmB
         Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839678; x=1777444478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shDKR9F1B5bz8bwMraZHyZozJCPGpiT8/hqG0ENFR6g=;
        b=dk/i1e/9kugsbr2tRpDxkm1Zc1n8f4pkyMDMrHyrBZY4aJaQGwgrF749E5IE0uCQfb
         TU5MCQ3HFDOcJg8y1soldhF3vdJpASRfd/UtUp0tuTFMzWRv53tLJjyI2zH/OkSsd4pv
         /+NL5TJC7Nr3RUzrIz6C2aNiy75MwNILVtNH1JoZuvNqCwjiljuCmrILjd2gWjBo8Ayz
         OB09W9EqbETyiFjAu4QjKCspmSvE6kTufgypfd9yC2JGBAWpLO8Jr9DrhZ9sq+vhYJRX
         l7W9KFdl/Wbm6wT6COJDJOKxpCPCTQwEQOj6bG6wWqsSUtYh/3yoqdtz/AQpyETzOz6a
         TXzw==
X-Forwarded-Encrypted: i=1; AFNElJ9q6Pd/xBJoemFjqOj5Oejs4T1A34+NaFkL7OvW+DIB4fH4BLlVo45Ob/XB23PR+UWdu4L5d/uD1B6yS2ImsoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGOaS+3/bJsxCl0H5zYt1ckPKmVx79wYinUAWOhhWQWc4D4GA
	LAx1zaOHHJ9aILt8FVvvJRncyRo87bpXk3Ebz6EsyRTbWgLQAc6ExAog5/uuH5/OvagpdpcXKiJ
	Xp0L1U/ERcOSWf67oRyyEbI58SvI/IAE=
X-Gm-Gg: AeBDievfwob60Y3aOVG7qzacXlWCR8mzthorL9c6C5aai/3r9i3xQs6lwI+pb13w0ni
	W2pPBTchdg2KxU9WbgVJm1wYyQgEbqQsOqeueEbQ+EINZMR/z/ZMumn3k3cyiCWc+s2Xukxueqo
	Hzj6RnVoaAv+Lw/wdXtW13Ys8TVgimvz1qGPJYcvgl6Lvl2J2WiQpDbtzXv5jAX7lcPQj5Zdomu
	qUmroIuI8QkiHnOXWFyHNcA224tHwjLk+RoyBXCVIglINcjnX3wrXwESr5SUhU00KmSiXFzRIf/
	cxaCVyMrSICUHF5oedKlnAI7UQ==
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-488fb780463mr287378505e9.22.1776839677598; Tue, 21 Apr 2026
 23:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422024554.130346-1-jt26wzz@gmail.com> <20260422024554.130346-3-jt26wzz@gmail.com>
 <CAJ-ks9=FKMoczH+Z=GQ7C40T42=zdknYzzHCa8UVFOtq2H69cw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=FKMoczH+Z=GQ7C40T42=zdknYzzHCa8UVFOtq2H69cw@mail.gmail.com>
From: Zhenzhong Wu <jt26wzz@gmail.com>
Date: Wed, 22 Apr 2026 14:34:25 +0800
X-Gm-Features: AQROBzC_BaY3iZ1CRhgFDwy25PnKfhx-Ku3vnltXXcbsiy_AoyisatnBkns9kC0
Message-ID: <CALgi0XnM49xUZm2-YAjPFoc_8j_F=y4gmVemGHacyH8aXeXaHw@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] selftests/bpf: check epoll readiness during
 reuseport migration
To: Tamir Duberstein <tamird@kernel.org>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	kuniyu@google.com, davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Tamir, I will fold this into v5 - there's already a precedent
in socket_helpers.h, so I will just include it from there.

On Wed, Apr 22, 2026 at 11:04=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Apr 21, 2026 at 7:46=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> =
wrote:
> >
> > Inside migrate_dance(), add epoll checks around shutdown() to
> > verify that the target listener is not ready before shutdown()
> > and becomes ready immediately after shutdown() triggers migration.
> >
> > Cover TCP_ESTABLISHED and TCP_SYN_RECV. Exclude TCP_NEW_SYN_RECV
> > as it depends on later handshake completion.
> >
> > Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > ---
> >  .../bpf/prog_tests/migrate_reuseport.c        | 49 ++++++++++++++++---
> >  1 file changed, 42 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c=
 b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > index 653b0a20f..c62907732 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > @@ -7,24 +7,29 @@
> >   *   3. call listen() for 1 server socket. (migration target)
> >   *   4. update a map to migrate all child sockets
> >   *        to the last server socket (migrate_map[cookie] =3D 4)
> > - *   5. call shutdown() for first 4 server sockets
> > + *   5. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> > + *        that the last server socket is not ready before migration.
> > + *   6. call shutdown() for first 4 server sockets
> >   *        and migrate the requests in the accept queue
> >   *        to the last server socket.
> > - *   6. call listen() for the second server socket.
> > - *   7. call shutdown() for the last server
> > + *   7. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> > + *        that the last server socket is ready after migration.
> > + *   8. call listen() for the second server socket.
> > + *   9. call shutdown() for the last server
> >   *        and migrate the requests in the accept queue
> >   *        to the second server socket.
> > - *   8. call listen() for the last server.
> > - *   9. call shutdown() for the second server
> > + *  10. call listen() for the last server.
> > + *  11. call shutdown() for the second server
> >   *        and migrate the requests in the accept queue
> >   *        to the last server socket.
> > - *  10. call accept() for the last server socket.
> > + *  12. call accept() for the last server socket.
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
> > @@ -350,21 +355,51 @@ static int update_maps(struct migrate_reuseport_t=
est_case *test_case,
> >
> >  static int migrate_dance(struct migrate_reuseport_test_case *test_case=
)
> >  {
> > +       struct epoll_event ev =3D {
> > +               .events =3D EPOLLIN,
> > +       };
> > +       int epoll =3D -1, nfds;
> >         int i, err;
> >
> > +       if (test_case->state !=3D BPF_TCP_NEW_SYN_RECV) {
> > +               epoll =3D epoll_create1(0);
> > +               if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
> > +                       return -1;
> > +
> > +               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> > +               if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
> > +                                        test_case->servers[MIGRATED_TO=
], &ev),
> > +                              "epoll_ctl"))
> > +                       goto close_epoll;
> > +
> > +               nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > +               if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
> > +                       goto close_epoll;
> > +       }
> > +
> >         /* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
> >          * to the last listener based on eBPF.
> >          */
> >         for (i =3D 0; i < MIGRATED_TO; i++) {
> >                 err =3D shutdown(test_case->servers[i], SHUT_RDWR);
> >                 if (!ASSERT_OK(err, "shutdown"))
> > -                       return -1;
> > +                       goto close_epoll;
> >         }
> >
> >         /* No dance for TCP_NEW_SYN_RECV to migrate based on eBPF */
> >         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
> >                 return 0;
> >
> > +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> > +close_epoll:
> > +               if (epoll >=3D 0)
> > +                       close(epoll);
> > +               return -1;
> > +       }
>
> I think you can avoid this goto using `__attribute__((cleanup(...))`:
>
>   static void close_fd(int *fd)
>   {
>         if (*fd >=3D 0)
>                 close(*fd);
>   }
>
>   #define __close_fd __attribute__((cleanup(close_fd)))
>
> then in the test:
>
> __close_fd int epoll =3D -1;
>
> there's an example of this in
> tools/testing/selftests/bpf/prog_tests/socket_helpers.h.
