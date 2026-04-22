Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089086329
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 00:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776818315; cv=pass; b=XUCaFF+sRzdRYNNy+aL/ZEwB4fVc55iqMFt5izul4r9CjXFibRY9V+tEDRAZCbQ7TUwx7nbl3yuWFxZpVPYwMGqpUQabjKceoG7yJLcO78DkkcrBsnnZ31y2586vbj+fy6LicQ16TwhX60RQUt1mrlQ6Q4vVtm4Xv5nABNx+/rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776818315; c=relaxed/simple;
	bh=MvfDZ3IJ+pAGJgyo/drGyRM18kwJEa8gkPZl9/L5ZYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jv98YiDJDf5ZLoVqjx5ajeCBHIttK2/Gv0KHJRCGXs3I8HxWTTkiDV8n1KtAKA8OOaRhAlVDfVubz9UHkR4XKnMd1i6DXf9/kikR39O0JuzT0A2ylBqg2UXoUlkfYWGjBqtlo4wKh5hYW6dRBtTWmtmPca3GsKXiSiIO47deE1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5kxBIlT; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5kxBIlT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so63440115e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 17:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776818311; cv=none;
        d=google.com; s=arc-20240605;
        b=VbiEj4xpFLCTvr0ZYBJ2P3Y2xQi83tJAkux1kuJuXORc0s5ppahYf5H/vHY6XNOsBq
         12kYPf66eXp35z/HVZs6Aib7Yh/s7VJir7IQi8kq0t244YR5XPIY9I6WNq+U1pc+uzds
         7xecfHCGyrRq1i1Ld6ap3P+gdJDJymDvQx9pr50ihMiieqCApgB95fbuCSjFZJrQsTsR
         uetOe3FejItW/0J2R+RsCI1O4TXQmQcQh5yi2XX0L4M6Ku9U/kSifgjcLR9wTaXlJ4ws
         2WKzJtfWaN6Gcg4FS+2tbR4ecZVvienFKf2K4xYP0mw9DT9IAjHRtb/sHUc+WpzYG6j5
         QWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WKb54h3+M8yqPA04t5MI5hcgx20ftmUyS8BLYJJG/8=;
        fh=dkjrMo125kTPNXQ1DLSi7q0MIFX/YkDoGuErXmExLDQ=;
        b=VmY2FgrUvHOuH+N1OXiAyPeBflqH7/aIh4jLgeuogzknVysg6sYqGj8RWq3DKvrUTs
         8oQ2coQymiuKRz/4Vm6JWyRlakEWnfix/T3NQBTIlNb34BJxk318pI9WDNW7oZ6PlQds
         hdpw/Z8TROyKUW8NjA/KJcaVzGU0lwdqqph42nkeAa+mTbdBz3zHwlYMrg2M7MCH+1sH
         SE94/DVnmqK2ObshGYc5bPYjE89D1g/lLKht6D0JdHjuPhSkJFwI/JF7ubHEGCxsQleI
         kXgTc1Pk1Zz2kfB6/n20DDE0U0QWBx61wK/pEUDIEif4DuDBPLg61KYgiXE7b435/h8e
         Bx+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776818311; x=1777423111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WKb54h3+M8yqPA04t5MI5hcgx20ftmUyS8BLYJJG/8=;
        b=m5kxBIlTVn6ZKCeppYmncCsJTHG2uz0FsM4jM5ulXCpzKvm/Sz4YH7kndEnklJ6u8t
         61r9oB2QdaIMLTE/NUD/L3akTBZLCfSCREnbTLJUi1stuxVWza5QEeunM5Vw0erSzB/8
         sXrkls0EREBnqH6NQMY9YlmstfmBx4EQeTSWVFFN11jbAg20IbjMM2xtekpwf4PWcnRe
         tLkAsZYHrtjTxrZYzym58uRjbap35TrIQjlGL6TgignW1hCY/3io4l/BJ96aPheTLZ82
         F9STgzrfBKVq/uaE6WbZxTJorgiIuqJ1pJW9ECzyBZw9rZ1FntcZD9wJwlHQRly695Zm
         HVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776818311; x=1777423111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+WKb54h3+M8yqPA04t5MI5hcgx20ftmUyS8BLYJJG/8=;
        b=DCWq1sPHLbgpryQ7RuQhpcYL3JeSRWm/ey7e6jpS8rhcMn32gvmpI1NPcLCmKgXsJu
         q0ISNAZt0uRHz6ppRPJ8bShr5uBL18OTl8rGJwTgkM+InlhH0ANdeexys5JHHqs85Dg0
         b2RjkHzvQG61W8+70EqriESbF1H54zu0xZ38Mq3SHbTNDGW7cLBnpa39nNnbhJ6Y/jIy
         3qoNrgQEBkTREimrGvlAjIrQPkUmcEXpnqUBe+R7ADG5qZ7q6ByLCEow8/SSnci2QfdO
         MjXP7+icb4970ugwCscXAq+YanU4ApmLNsISz/EU3pm8EO6kVqffe6Ii8TZULRKL8wjB
         y45Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zaK5RtxOLl8RpEvlRGxO6EiPQaFRX5PE/VawTJ8IQ5uAhvNtEAYP922CG4yPlp0qsXufIxcL9QspbhgMMzVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrxtgPwY4zWvs34BMpbeSs4xx/vju2hXsuMsEfqRGT3k5FTIl
	jTIYTsm7qbl2gyGtXfdjYSfmoMLTgrhBOVpWvPgaTWOoD3gKmL11dtVq9WCWfeinayoQK25Vchj
	3P26GOCS+wsvUErSMajvsDDFeoLG4xBk=
X-Gm-Gg: AeBDieu5h58luFlrR5VX6RkhRa0BunAUIMAh1baPi+d+sCA9cfzFghQgvIB4rYr2M9U
	b8z6pvSDo0lQYxVQuL6BUlNzGO7B+kuhpekRVEVEgzIdwpndRkPJ8SWI2fTDjIesqg0R05blBiK
	2+DGUI3yHbMt4KV+QEcVmICcqzYZZbakMy0bQT6JwxpEGuI7apRsOhMj8Ha3a9QiUZExOPI6+Av
	NAsZYFM79Ebnwg1RSRRBLOoCrOGwVNdXg3fkQz78POBSdA+D+H6gzqwH76f/dzKb4j+vvF6c6NZ
	xp0vPJ5ztwmaC80BO7GB
X-Received: by 2002:a05:600c:1549:b0:48a:761:5808 with SMTP id
 5b1f17b1804b1-48a07615c09mr115171035e9.0.1776818311060; Tue, 21 Apr 2026
 17:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421123106.142299-1-jt26wzz@gmail.com> <20260421123106.142299-3-jt26wzz@gmail.com>
 <CAAVpQUDv28sNCYdo6oH25FNKnddZibwrmxMUf4GqgS4fRA8+og@mail.gmail.com>
In-Reply-To: <CAAVpQUDv28sNCYdo6oH25FNKnddZibwrmxMUf4GqgS4fRA8+og@mail.gmail.com>
From: Zhenzhong Wu <jt26wzz@gmail.com>
Date: Wed, 22 Apr 2026 08:38:18 +0800
X-Gm-Features: AQROBzDtNVk9nUAZ66hTEwsTtVGb7ULx7HPZCe8RDVQWcoUKKjcCT-p_wXZJDOg
Message-ID: <CALgi0XmFRv06yWbd4fuVmssg923nEEF1XWyA8t_QuiH21eVMeA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests/bpf: check epoll readiness during
 reuseport migration
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I'll fix the `shutdown()` error path to `goto close_epoll` in v4.

On Wed, Apr 22, 2026 at 6:59=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 5:31=E2=80=AFAM Zhenzhong Wu <jt26wzz@gmail.com> =
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
> > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > ---
> >  .../bpf/prog_tests/migrate_reuseport.c        | 46 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c=
 b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> > index 653b0a20f..6180a79a7 100644
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
> > @@ -350,8 +355,28 @@ static int update_maps(struct migrate_reuseport_te=
st_case *test_case,
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
>
> Sorry I forgot to update return -1 to goto close_epoll
> when shutdown() fails.
>
> Otherwise looks good.
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>
>
> > @@ -365,6 +390,15 @@ static int migrate_dance(struct migrate_reuseport_=
test_case *test_case)
> >         if (test_case->state =3D=3D BPF_TCP_NEW_SYN_RECV)
> >                 return 0;
> >
> > +       nfds =3D epoll_wait(epoll, &ev, 1, 0);
> > +       if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
> > +close_epoll:
> > +               close(epoll);
> > +               return -1;
> > +       }
> > +
> > +       close(epoll);
> > +
> >         /* Note that we use the second listener instead of the
> >          * first one here.
> >          *
> > --
> > 2.43.0
> >
