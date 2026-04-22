Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457C36C5AC
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842059; cv=pass; b=Hh6mQCbpD5zFSPSb30rCFsw2sOZTa1jvNdf68RtFbS0fn1i5tJmutv4bfgfzCusJF0OdWcS3CNmoFkceTnZJ1+mpBto/rr7kOwlLOytHiysPfK3ZaqHRt3gnMu9lKPaHz+B3s6P3zRyw8JfIbyZK77nO6pHdpp6TLqkA+K1bN7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842059; c=relaxed/simple;
	bh=XowSd59N4h93jym+TJycNOip1Un2FoiepuvLyVCQEyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw/gxvKu4pB0UVhDr7V38QkwPwvwTpKaWMIx3oNZC9c/h/v11+2zeuRRp7QYMPCRMQkTZm5dnd57roNruD1aUWA/YOyGTP83wEM0neMxmEoY5czgi8xVRtUsGkuGYdOso42W4MlNH74CmvudqTVlqR34/+SRMNm8v0g+7Detfug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STFUNdij; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STFUNdij"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so43893315e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 00:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776842056; cv=none;
        d=google.com; s=arc-20240605;
        b=lkwpE74GYnvLi4twczfA4zl1d31Yr9GbWEcfLKju//WusWGmP0OAPJka3slHsOXAVv
         05HMoXw0TErTD31TLbmq401lPw54rD2vxSJilF8MyfnLvFfnO1xw+lqGNRm2YoOSnho0
         vdnyfrAEEV1HuIVbxtSmYcudtVE1/wHpL65KWU1jOEH0s027KFSFyApTFA3MBhsrBwjb
         7hLKJ6BhZu76XVjbtMQUmZ14yWcb3R1rZE/sM750DWzv0TFtFFiseO90hrHk212JljGb
         GsdW8hy7cSKuwtl6LW+3DibHs+rPA19bsozGjomEl3GufDJwI+5EcMR2KzDNF9namYmT
         nA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqnR6HI2Fa/Xow2KsNl3iKJdbqbKp2MgpRDTzxPIh/8=;
        fh=TW/ZV6lDQDu85Cz1CqdTEBuV05l4I/hMr1EpOO0ljAk=;
        b=V/ZcMl9KWv5WvpauvQGXohs0KX0GsfBhycibEIuhDsAnB8M7k4AOWH2WFNbDQCkfNp
         ++mWYJBs4AzqR2m2nCsfdNscYxzdq4HUUfa3Nl6q/tvjUwAenir46KD1cT/WCRQwBbcw
         s0rAMBQ6AfoCBt0bSRIRdt9gpTolMVtlYmaCM8GwO3RRr7TBEByXhXVlO2nt63tf4a9H
         gqdMHkJwi7NPM4Gc0n9G/Fe5I7DNQo3Ulxd4AKVZMqHwqCzHAnlj/0Xl+FAk3qUSKIFo
         Tj18FYJH2r7GWfDe96Q2X06KOov442AVg8pyT/4R7xbo88EeJ8nnD+C02Ill95BwZAYV
         iyig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776842056; x=1777446856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqnR6HI2Fa/Xow2KsNl3iKJdbqbKp2MgpRDTzxPIh/8=;
        b=STFUNdijZrCHWnDhAbFY77gtD4bOPf0qPu5JXOD6cwNYNm2Pow4futGiRlCh3zeVlQ
         igeb3L8sSkj+H4WZOpSZx/9d3p0xl4aJ3yq+YBtI/4dzFFEyJAF6/r5O+1hMVmLSJI6s
         Y7jfQ5NBkOfWew1mQj9onTdyR7mpjj9npxRLb1xVtqC0cCvwkIwYSlFGireBfKliyGr8
         YL0ajtsTkpCWpPFHfvn3zWBG1AgKSrXqJDBPsqBgG+RDtSeF1IRW/aybEucmqSrVQWaV
         NbCTdc0tQiDIjgq06G7ezeVeN4Os2a7RX7LiCNJ/l67MYMam6+ZzSJjvpdo0pRqNGsZV
         ZyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842056; x=1777446856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bqnR6HI2Fa/Xow2KsNl3iKJdbqbKp2MgpRDTzxPIh/8=;
        b=SpB9Ta769GHGaplXTG2XrgMBSIUBGxvc6lpqqNiGJTaHELbE/ZslNS0bvV9SPWzaRO
         0r8SbDn+FpETX9zhBVGh7GC6FJZj4qWh0zt9RDeTCVtClcBV0dPubMwKJd6LzzcwhBRF
         WA+kVg42PV7pgj8puPaqPnOVByeHHKcA5FONdvd9zV2RTLPgf7Ab5zQcKlxMKsQF1yIb
         tbPbcX83k3VtcfJJYZvzbwdYLozh0dMIg/lkXU6S/NyJLTvwGsyYjzrx1PML4UBXFJf5
         PTsjZXHg0Ld3lfAS2b7ob9pj0lk4DKkA9zUis30vQOd50QpiCsB0rltsctXNQcSKPDBt
         i9Cg==
X-Forwarded-Encrypted: i=1; AFNElJ//3nFByeulcRS/9XZvUxTxAfatCrI8ZrkkexOEet9MMprclilrX/9RoxkIIbjGJpHA1p3a5vvdFXwWxd9e5jU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy74O0uEE/2Pg9L4BgWLn1K+Puj8H2KXNKh+N4SeWYV142D9ifg
	sV3xpGzBhHHGwR1iW1K5/3oycCL4JVfB2OJrj9EeAYc7zvq3jzMV5WnlWgh2SPm5I62tm3oi06K
	C5FttF+GcZ0zyesaqayIsbqLbyV2jg7w=
X-Gm-Gg: AeBDieuBjMVRe9kA30onU2pN2qexzSR31pdohNN9qaSgimQMXoBvvqDq+0YiPsNkTei
	aupwlAPUSSJmIXacARwj7d6uNu4HKhIpFG5iHnNf8dVhyPpngd/xXoJKPaEUweIyzS7/+NlbeEZ
	/q4HQkJW/uY6b2y80xpcCgVFlJSaUbS88CNn2ipAamLt1FjedhovFtpvZO4dSwOZmZQahbpIFJ3
	wAdRQZMUsFg/3bYHHgjBW4svST04TxCcVzz1FgQo4gUbWlVaZLrXgsOoaCb5Urg12SMNgi/cI9i
	yWipfsMnyxSL7e1Rb0lqYCrQvA==
X-Received: by 2002:a05:600c:8b55:b0:48a:57e1:d8cc with SMTP id
 5b1f17b1804b1-48a57e1d8d4mr65879105e9.9.1776842055910; Wed, 22 Apr 2026
 00:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422024554.130346-1-jt26wzz@gmail.com> <20260422024554.130346-3-jt26wzz@gmail.com>
 <CAJ-ks9=FKMoczH+Z=GQ7C40T42=zdknYzzHCa8UVFOtq2H69cw@mail.gmail.com>
 <CALgi0XnM49xUZm2-YAjPFoc_8j_F=y4gmVemGHacyH8aXeXaHw@mail.gmail.com> <CAAVpQUAKCDVPHhFjWch2-zpKp2rHEPzvwE4R1UrDTMd_6Y2HYA@mail.gmail.com>
In-Reply-To: <CAAVpQUAKCDVPHhFjWch2-zpKp2rHEPzvwE4R1UrDTMd_6Y2HYA@mail.gmail.com>
From: Zhenzhong Wu <jt26wzz@gmail.com>
Date: Wed, 22 Apr 2026 15:14:03 +0800
X-Gm-Features: AQROBzBPry-HAb88G-Fx1bXIMUprfrxusGK4mpwNqFKy-bWEEZuX23LA3vZxfvI
Message-ID: <CALgi0Xm7+_uREQ3Sv19O8vfFyuwXNxVdUS9KQEvtkQHc=g2B4g@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] selftests/bpf: check epoll readiness during
 reuseport migration
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Tamir Duberstein <tamird@kernel.org>, netdev@vger.kernel.org, edumazet@google.com, 
	ncardwell@google.com, davem@davemloft.net, dsahern@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks both. Keeping the goto for consistency with the rest of the test.

On Wed, Apr 22, 2026 at 2:40=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 11:34=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com>=
 wrote:
> >
> > Thanks Tamir, I will fold this into v5 - there's already a precedent
> > in socket_helpers.h, so I will just include it from there.
>
> The test does not use cleanup in other places,
> no need to mix them up.
>
>
> >
> > On Wed, Apr 22, 2026 at 11:04=E2=80=AFAM Tamir Duberstein <tamird@kerne=
l.org> wrote:
> > >
> > > On Tue, Apr 21, 2026 at 7:46=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.c=
om> wrote:
> > > >
> > > > Inside migrate_dance(), add epoll checks around shutdown() to
> > > > verify that the target listener is not ready before shutdown()
> > > > and becomes ready immediately after shutdown() triggers migration.
> > > >
> > > > Cover TCP_ESTABLISHED and TCP_SYN_RECV. Exclude TCP_NEW_SYN_RECV
> > > > as it depends on later handshake completion.
> > > >
> > > > Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > > > ---
> > > >  .../bpf/prog_tests/migrate_reuseport.c        | 49 +++++++++++++++=
+---
> > > >  1 file changed, 42 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reusepo=
rt.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > > index 653b0a20f..c62907732 100644
> > > > --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > > +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > > > @@ -7,24 +7,29 @@
> > > >   *   3. call listen() for 1 server socket. (migration target)
> > > >   *   4. update a map to migrate all child sockets
> > > >   *        to the last server socket (migrate_map[cookie] =3D 4)
> > > > - *   5. call shutdown() for first 4 server sockets
> > > > + *   5. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epo=
ll
> > > > + *        that the last server socket is not ready before migratio=
n.
> > > > + *   6. call shutdown() for first 4 server sockets
> > > >   *        and migrate the requests in the accept queue
> > > >   *        to the last server socket.
> > > > - *   6. call listen() for the second server socket.
> > > > - *   7. call shutdown() for the last server
> > > > + *   7. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epo=
ll
> > > > + *        that the last server socket is ready after migration.
> > > > + *   8. call listen() for the second server socket.
> > > > + *   9. call shutdown() for the last server
> > > >   *        and migrate the requests in the accept queue
> > > >   *        to the second server socket.
> > > > - *   8. call listen() for the last server.
> > > > - *   9. call shutdown() for the second server
> > > > + *  10. call listen() for the last server.
> > > > + *  11. call shutdown() for the second server
> > > >   *        and migrate the requests in the accept queue
> > > >   *        to the last server socket.
> > > > - *  10. call accept() for the last server socket.
> > > > + *  12. call accept() for the last server socket.
> > > >   *
> > > >   * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
> > > >   */
> > > >
> > > >  #include <bpf/bpf.h>
> > > >  #include <bpf/libbpf.h>
> > > > +#include <sys/epoll.h>
> > > >
> > > >  #include "test_progs.h"
> > > >  #include "test_migrate_reuseport.skel.h"
> > > > @@ -350,21 +355,51 @@ static int update_maps(struct migrate_reusepo=
rt_test_case *test_case,
> > > >
> > > >  static int migrate_dance(struct migrate_reuseport_test_case *test_=
case)
> > > >  {
> > > > +       struct epoll_event ev =3D {
> > > > +               .events =3D EPOLLIN,
> > > > +       };
> > > > +       int epoll =3D -1, nfds;
> > > >         int i, err;
> > > >
> > > > +       if (test_case->state !=3D BPF_TCP_NEW_SYN_RECV) {
> > > > +               epoll =3D epoll_create1(0);
> > > > +               if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
> > > > +                       return -1;
> > > > +
> > > > +               ev.data.fd =3D test_case->servers[MIGRATED_TO];
> > > > +               if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
> > > > +                                        test_case->servers[MIGRATE=
D_TO], &ev),
> > > > +                              "epoll_ctl"))
> > > > +                       goto close_epoll;
> > > > +
> > > > +               nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > > > +               if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
> > > > +                       goto close_epoll;
> > > > +       }
> > > > +
> > > >         /* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
> > > >          * to the last listener based on eBPF.
> > > >          */
> > > >         for (i =3D 0; i < MIGRATED_TO; i++) {
> > > >                 err =3D shutdown(test_case->servers[i], SHUT_RDWR);
> > > >                 if (!ASSERT_OK(err, "shutdown"))
> > > > -                       return -1;
> > > > +                       goto close_epoll;
> > > >         }
> > > >
> > > >         /* No dance for TCP_NEW_SYN_RECV to migrate based on eBPF *=
/
> > > >         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
> > > >                 return 0;
> > > >
> > > > +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > > > +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> > > > +close_epoll:
> > > > +               if (epoll >=3D 0)
> > > > +                       close(epoll);
> > > > +               return -1;
> > > > +       }
> > >
> > > I think you can avoid this goto using `__attribute__((cleanup(...))`:
> > >
> > >   static void close_fd(int *fd)
> > >   {
> > >         if (*fd >=3D 0)
> > >                 close(*fd);
> > >   }
> > >
> > >   #define __close_fd __attribute__((cleanup(close_fd)))
> > >
> > > then in the test:
> > >
> > > __close_fd int epoll =3D -1;
> > >
> > > there's an example of this in
> > > tools/testing/selftests/bpf/prog_tests/socket_helpers.h.
