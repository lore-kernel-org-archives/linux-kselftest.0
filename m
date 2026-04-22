Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E82BFC60
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840036; cv=pass; b=m7KBLDQ675aWSl9057Ggu0Rth+SWzZMyQp18otvlb6PJqEs0YfrYDJjooj/X5kH6EMvMmxicTCPRm4YFKBLeQU8Phup8ZpGf2Yh5WQmUlL5rZuXj73sYce4F5DCRIGoF6FIMCMkAH0JjBVwsI+ptdc2l5xvd/gz7ynOuL2LNot8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840036; c=relaxed/simple;
	bh=Dub9yvFw6aVqsBwlj+o9QIz+Ydgw4jm4EZ6nTT2g1tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyUvDks3G3v8GSIcy0Xclgq5yoGUbGGkuoJzfOGfw3GgAfxmLwYQlX3ak+o0r+rb1Ip+SNRClTiRvt0FgPy1JVWWiWLga+b2vqDQ2poiTMmwJXiZgKv+zLQS57iwqgx+w6YZ7WMEsGepZ1sRG9L7gl+QXqLWN7KdlUIRIHe3Ctc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPZHSoSN; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPZHSoSN"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c1a170a50so6312968c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 23:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776840033; cv=none;
        d=google.com; s=arc-20240605;
        b=eeYoi6INCXdP9MHRusHRQ2phHjINAhvrTZysXsFNNg5GtL1ikv+I0FAIcAJxSHWb1a
         8CeE9BYGcoUz59rApe4lSKWFUOzxpW/sg1/OrOGrXBXO1KEoSbXy38iqWtwr0B4oWpdP
         /n4WUXW2Mg7rqwlU3PDK7iWLkFivpZn5+LdfcsdeiFSIcD3KSkxJjmujF8Z4OYGyqHKl
         ySnISplt8G6o60f24W205+f8XDW1mFIxDiG0W1qhUd+SGAZ8VeMDA230BsbHZDqdSbsb
         u6Kxd1Wk/xT0u78SEMtTo8LDVgfaGrIwIiU0vUsLvUS/KoBpLaP2PWWYgkdzPeTzPJYK
         7KZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkR7JxVUSSnzxmBjl0/viks3xyisurlnd8db9S4wWvM=;
        fh=nT5J/Rje/ys3v3cDpe8+BiRUMEpzFGTBWBDPQJFu2V4=;
        b=Cpb0kGYGDTr0mF8mTeC8QGP7RIH2WOOiPKgteEMZUxiFhIpJrsPvfTRuF5PNKnheBZ
         loZi9CDYAiodZESoKOrOA+IycsR1s1T/a1r6Oksq61Vpg99z2VO3ywa2xiLGop0W8ljF
         wltEhXwd5S4w79UIEGoiu9MkEsqnQOT5bCKfNsinCjV6GNRlG5OBrE5ufq7uYktvhNqN
         zYTzZy6YDsaES1vSb4K6lDZbd+kir4FKTXAbDJZGhsElG8hYsOR58mlVHFdHuohbNGUA
         z6yep5zDB2HCU7cGli/6KKfalnn2wEMfPVhQPfs/Io7BBwzvjdZqhF78ahlyWp0LqcB2
         rD2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776840033; x=1777444833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkR7JxVUSSnzxmBjl0/viks3xyisurlnd8db9S4wWvM=;
        b=vPZHSoSNGTyUCfSVRaRDnr33kc9nxRTWt9jYcZkcyXEKbwrg8J8oQGZ03zhAy+xy1P
         jFR6i6QKe1mwKnuwCwJWs4nSVlBl9wKlBfykg6a2niR1stl4rY7NWRXQ0lxhROdtXdiE
         Y9HV0NQgYTLLCN9B55qFG8go1YWmrjWvPfVuJUw9xCL9W+sFU6zkq8WuR9Km7qlaa6z0
         qxm2PxeiC0QW60tjvfJsDbLC+T+hjKH+vKLDFRoUTogP7hZ3z6lplSOwx2NNTkPe2QDv
         hpI4H9uF52ZZgNmfEw9cbWiHHbPzKa6teSVbjqp9KA8m9XvAISvckZ9dZJdfm9SCtH0q
         25/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840033; x=1777444833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkR7JxVUSSnzxmBjl0/viks3xyisurlnd8db9S4wWvM=;
        b=NTzpXcEyA41NBnCMBbxM7Nsd3FBXPKwIY/rf+BHJaReMLFXuAV5n6lT3KfCEL2DoO9
         3FClOLlg+d8/BVT7ABk5o7JzSljEp/unFdf9AfbuGx6rVuBnOeJoJir2JBo295V+Wjn+
         2BJT2wopTe0R+2Xx9+Wma2F5NjH6RmVnlVZIhWVAfUKTwIaQzRljllGF4k5qE8Ghq2Eb
         /t0+eKEzGBkAWnP/UZpSuVgvky0zF25b9dFkYeTr7uOcIFPB6hKn6MZ6u7I64tzs73bD
         pKSYBam0Rt/Lp/jaai0W0geuJWrQYj1ThcW83WdgXCE5ev3aX/3d6loi2uFWebm+HI9V
         I8gA==
X-Forwarded-Encrypted: i=1; AFNElJ+80Yh/2OjeSVRFJMY/WSGRswzEtWYhu3BrtJaPycnrkDg1RMhCho0bN97PeOX9VOdTT5ha/q4M4W2w/fMh4+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6Gu+Q+pUP0s6TZAZPbTXTa+HvjAYwTd6UMPakRQrEVwReoZB
	3Eu8Jk3BHnj7SfrN/6Ghu+hRhUydXn/6NrpYY20SrpcXRQn+sBntpqrs1X2RF9yUOniH+4NhEGG
	uuDqzoXYGPPlLgIdEw63dEKHfx7lAtRaNLY5oU+M3
X-Gm-Gg: AeBDieszBm1+lHqtjv63AAk78dYv5DVO3YFFaPhIWhNtjboRrDXEHH4jihmd5auyPJt
	CxT3qacTeunHQK+lnRATD93x7qLM/soivNhpgSemRKi4O8jf7WZudkXHVwobJ8nGhgoy3fs5FNz
	GeI1RGY/YvouMFzKi5SdhZ/GDhV/MZjBdZ92/3Cla0e0rbZbqcMJI/gZ3oUXuehi8ooYYm0ra8R
	gmINyPu2HBWphseEiVvd+fHTkyb5vkQqRBrRe6ELVBLorcaJQ29E8DmS0/A9YqsF4lHD1juD3Sv
	KFhnX4E64z2n+CBSDKPAR1rsIcnV2nzhOOPytWJd4FBrd3V0TCqqId4ph76JcWPHryshXY2xYTk
	RsDsXyMXPBYNGQOo+OrIhwXb+zoj6IaWkDQeEnm0TMwG2UY/C+Zt0Dzt5WS/QfhwIDh/XWYQBYg
	==
X-Received: by 2002:a05:7022:ef09:b0:11a:fec5:d005 with SMTP id
 a92af1059eb24-12c73f6c4f6mr11902651c88.10.1776840032640; Tue, 21 Apr 2026
 23:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422024554.130346-1-jt26wzz@gmail.com> <20260422024554.130346-3-jt26wzz@gmail.com>
 <CAJ-ks9=FKMoczH+Z=GQ7C40T42=zdknYzzHCa8UVFOtq2H69cw@mail.gmail.com> <CALgi0XnM49xUZm2-YAjPFoc_8j_F=y4gmVemGHacyH8aXeXaHw@mail.gmail.com>
In-Reply-To: <CALgi0XnM49xUZm2-YAjPFoc_8j_F=y4gmVemGHacyH8aXeXaHw@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 21 Apr 2026 23:40:21 -0700
X-Gm-Features: AQROBzA3HpMyxVD5ELxOaE3sdPdgu6IawCkniN8Ei1PdRzCSt78S6iEoyACymtQ
Message-ID: <CAAVpQUAKCDVPHhFjWch2-zpKp2rHEPzvwE4R1UrDTMd_6Y2HYA@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] selftests/bpf: check epoll readiness during
 reuseport migration
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, netdev@vger.kernel.org, edumazet@google.com, 
	ncardwell@google.com, davem@davemloft.net, dsahern@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:34=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> w=
rote:
>
> Thanks Tamir, I will fold this into v5 - there's already a precedent
> in socket_helpers.h, so I will just include it from there.

The test does not use cleanup in other places,
no need to mix them up.


>
> On Wed, Apr 22, 2026 at 11:04=E2=80=AFAM Tamir Duberstein <tamird@kernel.=
org> wrote:
> >
> > On Tue, Apr 21, 2026 at 7:46=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com=
> wrote:
> > >
> > > Inside migrate_dance(), add epoll checks around shutdown() to
> > > verify that the target listener is not ready before shutdown()
> > > and becomes ready immediately after shutdown() triggers migration.
> > >
> > > Cover TCP_ESTABLISHED and TCP_SYN_RECV. Exclude TCP_NEW_SYN_RECV
> > > as it depends on later handshake completion.
> > >
> > > Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > > ---
> > >  .../bpf/prog_tests/migrate_reuseport.c        | 49 ++++++++++++++++-=
--
> > >  1 file changed, 42 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport=
.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > index 653b0a20f..c62907732 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > @@ -7,24 +7,29 @@
> > >   *   3. call listen() for 1 server socket. (migration target)
> > >   *   4. update a map to migrate all child sockets
> > >   *        to the last server socket (migrate_map[cookie] =3D 4)
> > > - *   5. call shutdown() for first 4 server sockets
> > > + *   5. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> > > + *        that the last server socket is not ready before migration.
> > > + *   6. call shutdown() for first 4 server sockets
> > >   *        and migrate the requests in the accept queue
> > >   *        to the last server socket.
> > > - *   6. call listen() for the second server socket.
> > > - *   7. call shutdown() for the last server
> > > + *   7. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
> > > + *        that the last server socket is ready after migration.
> > > + *   8. call listen() for the second server socket.
> > > + *   9. call shutdown() for the last server
> > >   *        and migrate the requests in the accept queue
> > >   *        to the second server socket.
> > > - *   8. call listen() for the last server.
> > > - *   9. call shutdown() for the second server
> > > + *  10. call listen() for the last server.
> > > + *  11. call shutdown() for the second server
> > >   *        and migrate the requests in the accept queue
> > >   *        to the last server socket.
> > > - *  10. call accept() for the last server socket.
> > > + *  12. call accept() for the last server socket.
> > >   *
> > >   * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
> > >   */
> > >
> > >  #include <bpf/bpf.h>
> > >  #include <bpf/libbpf.h>
> > > +#include <sys/epoll.h>
> > >
> > >  #include "test_progs.h"
> > >  #include "test_migrate_reuseport.skel.h"
> > > @@ -350,21 +355,51 @@ static int update_maps(struct migrate_reuseport=
_test_case *test_case,
> > >
> > >  static int migrate_dance(struct migrate_reuseport_test_case *test_ca=
se)
> > >  {
> > > +       struct epoll_event ev =3D {
> > > +               .events =3D EPOLLIN,
> > > +       };
> > > +       int epoll =3D -1, nfds;
> > >         int i, err;
> > >
> > > +       if (test_case->state !=3D BPF_TCP_NEW_SYN_RECV) {
> > > +               epoll =3D epoll_create1(0);
> > > +               if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
> > > +                       return -1;
> > > +
> > > +               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> > > +               if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
> > > +                                        test_case->servers[MIGRATED_=
TO], &ev),
> > > +                              "epoll_ctl"))
> > > +                       goto close_epoll;
> > > +
> > > +               nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > > +               if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
> > > +                       goto close_epoll;
> > > +       }
> > > +
> > >         /* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
> > >          * to the last listener based on eBPF.
> > >          */
> > >         for (i =3D 0; i < MIGRATED_TO; i++) {
> > >                 err =3D shutdown(test_case->servers[i], SHUT_RDWR);
> > >                 if (!ASSERT_OK(err, "shutdown"))
> > > -                       return -1;
> > > +                       goto close_epoll;
> > >         }
> > >
> > >         /* No dance for TCP_NEW_SYN_RECV to migrate based on eBPF */
> > >         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
> > >                 return 0;
> > >
> > > +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > > +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> > > +close_epoll:
> > > +               if (epoll >=3D 0)
> > > +                       close(epoll);
> > > +               return -1;
> > > +       }
> >
> > I think you can avoid this goto using `__attribute__((cleanup(...))`:
> >
> >   static void close_fd(int *fd)
> >   {
> >         if (*fd >=3D 0)
> >                 close(*fd);
> >   }
> >
> >   #define __close_fd __attribute__((cleanup(close_fd)))
> >
> > then in the test:
> >
> > __close_fd int epoll =3D -1;
> >
> > there's an example of this in
> > tools/testing/selftests/bpf/prog_tests/socket_helpers.h.
