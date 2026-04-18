Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D929237CD48
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519074; cv=pass; b=qodJ9hYxi6c2K4y0d/4InvKFd7n0kKPhqZxFZm6na5qnJ4P07ezq/i8HxJCtwSX7z9BCRTIQvjIBiflXumc0qaM9vye+nqNGc3bZqXLqnCtPxmCX+wXypeUWQuxnWmkufJ7Fi8961EFU22/+Fk2jR6NcYOMRNf5VAZ5+OlKnfDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519074; c=relaxed/simple;
	bh=bCwZZOAmrkF68yCBfWzlCLDNALt2LE2uQMq0wLsUN6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAWMQFm2VqVC/pkTteGgtmO5wQPclj+1NX4lwNz335546l1uCOCotJHNen2h8GoYOfYJvWA6TkGF5arhJ5c1Dxs/cYf20TB+fBADs2ByJmijjj1RO4oFywscgZ0VzbxZkgwsuOeSnQf6lPqAapodF82SUA9mb9wsusDSqT7JCmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqe4POKP; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqe4POKP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0046078so14925155e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 06:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776519071; cv=none;
        d=google.com; s=arc-20240605;
        b=SblPBg9SVubfCYkfakWvU2IJ0hPMXQhmopYOduMooNrtuhpp63Kt9/OWRcodvRSmFb
         D4ekECT+I3Q8tGrjeATv8M0+K+ub4YE2DjTw6N8KyI4g0tm677yEp8G7iulia+EoGa7n
         52Ad/9Yhpk8PV+FQjM9lMouSWZFm0mKw9ODI/SpxHBoMRDQFsB5HH74VO75P9ZAs15It
         Xarq74PPW+GC9R5jRPI8Z4uEBgc61DObh4N4TZr2tTJi7BqgqcLsojjb8WnY4m7s0FnD
         iu3k+z+CqOhh3CfuWNxqGd2GK3nlkw64nmYiBT0mMRgd/L3/orx3viKG4CXvVzPtJOex
         h1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPxDtIL/dHAuVmHL3LN6nRPtuUfUzQdagiPbu8rpFsA=;
        fh=F9JheRIoDgbPFDpDa6QYp+ZAdYg7dSZ/7j3Jod5m40U=;
        b=IjyYiBzCoPViTPqjF2RwO8dzUboCExglbQgULhaijAHsTGFMDwkhxKm+dsmHJ9JALS
         VvDzfUrep+tXWIZ7EzL3iKr3z6WCxtvJwCCk8enn9zViDXk2r/hs5SOyvQWCGT783nv6
         PrR0yJUn1eI54zHs/cfB76fnYcsNL9jGCa5lwLAsx31lQhKeLaBHhugAznhcEihnKmou
         9gdTrgURVYoO4Kbq2gbi3gtVj1rxpq+ozMHAsckC9NrJNpVKqPee7DYu3A+dAkezf+ZL
         VO6c8RvlbxKzXeGupj9jOgGXhbd6uSlHkPv09eOPYsfgCdD6atRnLTutI3sNeVCxDyCH
         ElZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776519071; x=1777123871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPxDtIL/dHAuVmHL3LN6nRPtuUfUzQdagiPbu8rpFsA=;
        b=nqe4POKP7hoaHZ8oWFfDPaz142h+NbFtqH1qbrCD9UaeVjceH3DFvvFVb0SZLddFRu
         tdJMv88aj3YnsKkhQg3VuZdHxMbQtDoEhjFy0wGp2Wr3pmxKM6iMX244fjXew+BHThLF
         4GUQOycULtcyXDWRi8XtMUYQ3FyS1nx4/old23+QyBAB1lkd3lpRrNYyTcSD845kYrcP
         SmEEPpWr1NiX+ypuC9YRqKQwxE9D5+QTLF78WVcZyB4834e0X6Z3eWcDLOP0op6JR+jK
         Dg1VOSnAPK9k/KACbDawDVpVIQOSyWXTJkB6kGLN2UzJ5B0GWcLPOYKS8/atD68RQSzb
         b+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776519071; x=1777123871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPxDtIL/dHAuVmHL3LN6nRPtuUfUzQdagiPbu8rpFsA=;
        b=Lp5t9xdQmJOnxuUhPhv4evrxRjOJ7Dg4LofBubpL1BPihf49iLaxRqoddGG6c/mqRY
         WiHYuKMTtAx/EtnsC2sgLj/mtymudcEGCvvn7kF5y4z2/1O7TDeMsvvbZPGmCqqoELAN
         L02fLn4nFy3tWhCutpWagNCSFhAYyQxeair/4Jp9ahze3yTWam9+j5iqOFNFjT1bWFE4
         L56Zd6N68diVxdEYThvW/ZWHGkzILxvOR70YSKnzeF7/5/9N37Qr8hy46QBHY7civRp+
         Z3VfbdR8mZGu/BTgZhSKIBeC11E0P5A4iRKjT0i8Kp8tsymX8rHa5Xp9FvAhbdWQUN23
         ruIw==
X-Forwarded-Encrypted: i=1; AFNElJ8k0F3lMYBlc31Q9N+pXgVOH8wB7Sd7SnNcYd0eeZCvOfloBfmZMEGplvMm529ZKYIrgcLT8ZajvULErHPws40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2R2qRwgy/CdodRgM1OjBxo/MkVsCAXi/zlGb5Uw0E8TvwBdt
	2hQttWdzO7MACLAuZAU6+WpCzUMfJMSAGBK1azAh6SMCSyxgmi2DXSgHkPhAZ7g7GvpShz9gtRx
	0wfpVLasK0Z420YF6BibWhC7+BYgOD9M=
X-Gm-Gg: AeBDieugRBrnolKya5dgjm1x9N3UCvMiVoTX18nwMnBj7pFGX+UOLGn+3kZ7Xw+LTPy
	EOczAlQBBbmGjk4OxfNTOUT7OkGWwxOukPc4tSaqSCfjndhZAT7BgO25D8YPSEAanAZ7gOq7TfF
	A7/UEUE953lGAb0OWY91UuaFi2sJxhuGoAOR4cfta28ZI+SkVNSf22Dw6z85VjmxvIIY7TChOVm
	55xXb0XsZm93WYEhN8IOKp/KOmv4UI6yRciahzY0hk/W9Rf1trR/qgfNz1ZO6Y7MwUev7+wi4H8
	96lzdbhbJCW3OVT4kZ9j
X-Received: by 2002:a05:600c:c090:b0:488:c744:49b with SMTP id
 5b1f17b1804b1-488fb74a53dmr69112185e9.7.1776519070984; Sat, 18 Apr 2026
 06:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418041633.691435-1-jt26wzz@gmail.com> <20260418041633.691435-2-jt26wzz@gmail.com>
 <CANn89iJOfDB+5oORjWPbP7Z1SyqUhMzVR8u8i+8P8MPDgg_EGA@mail.gmail.com>
In-Reply-To: <CANn89iJOfDB+5oORjWPbP7Z1SyqUhMzVR8u8i+8P8MPDgg_EGA@mail.gmail.com>
From: =?UTF-8?B?5LiK5Yu+5ouz?= <jt26wzz@gmail.com>
Date: Sat, 18 Apr 2026 21:30:58 +0800
X-Gm-Features: AQROBzC_Q-GZ8-zgpzaaVdMpWl_DnGJZTBYhOtWPKNJNKNL5h8rrfVmdaVjYoyo
Message-ID: <CALgi0XnEePV0WukxhkYr5-anFRTAQFMEGKOGX7pHa-g+56O37w@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: call sk_data_ready() after listener migration
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Eric, you're right.

After inet_csk_reqsk_queue_add() succeeds, the ref acquired in
reuseport_migrate_sock() is effectively transferred to
nreq->rsk_listener. Another CPU can then dequeue nreq (via
accept() or listener shutdown), hit reqsk_put(), and drop that
listener ref.

Since listeners are SOCK_RCU_FREE, the post-queue_add()
dereferences of nsk should be under rcu_read_lock()/
rcu_read_unlock(), which also covers the existing sock_net(nsk)
access in that path.

I also checked reqsk_timer_handler(): reqsk_queue_migrated()
there is only accounting, and once nreq becomes visible via
inet_ehash_insert(), the handler no longer appears to
dereference nsk.

I'll fold this into v2.


Eric Dumazet <edumazet@google.com> =E4=BA=8E2026=E5=B9=B44=E6=9C=8818=E6=97=
=A5=E5=91=A8=E5=85=AD 14:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Apr 17, 2026 at 9:17=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> =
wrote:
> >
> > When inet_csk_listen_stop() migrates an established child socket from
> > a closing listener to another socket in the same SO_REUSEPORT group,
> > the target listener gets a new accept-queue entry via
> > inet_csk_reqsk_queue_add(), but that path never notifies the target
> > listener's waiters.
> >
> > As a result, a nonblocking accept() still succeeds because it checks
> > the accept queue directly, but waiters that sleep for listener
> > readiness can remain asleep until another connection generates a
> > wakeup. This affects poll()/epoll_wait()-based waiters, and can also
> > leave a blocking accept() asleep after migration even though the
> > child is already in the target listener's accept queue.
> >
> > This was observed in a local test where listener A completed the
> > handshake, queued the child, and was closed before userspace called
> > accept(). The child was migrated to listener B, but listener B never
> > received a wakeup for the migrated accept-queue entry.
> >
> > Call READ_ONCE(nsk->sk_data_ready)(nsk) after a successful migration
> > in inet_csk_listen_stop().
> >
> > The reqsk_timer_handler() path does not need the same change:
> > half-open requests only become readable to userspace when the final
> > ACK completes the handshake, and tcp_child_process() already wakes
> > the listener in that case.
> >
> > Fixes: 54b92e841937 ("tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets=
 in accept queues.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> > ---
> >  net/ipv4/inet_connection_sock.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection=
_sock.c
> > index 4ac3ae1bc..da1ce082f 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -1483,6 +1483,7 @@ void inet_csk_listen_stop(struct sock *sk)
> >                                         __NET_INC_STATS(sock_net(nsk),
> >                                                         LINUX_MIB_TCPMI=
GRATEREQSUCCESS);
> >                                         reqsk_migrate_reset(req);
> > +                                       READ_ONCE(nsk->sk_data_ready)(n=
sk);
>
> I think this is adding a potential UAF (Use Afte Free).
> @nsk might have been freed already by another thread/cpu.
> Note the existing code already has similar issues.
>
> Untested patch:
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 4ac3ae1bc1afc3a39f2790e39b4dda877dc3272b..287b6e01c4f71bfec3dd2a708=
f316224d9eb4a64
> 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -1479,6 +1479,7 @@ void inet_csk_listen_stop(struct sock *sk)
>                         if (nreq) {
>                                 refcount_set(&nreq->rsk_refcnt, 1);
>
> +                               rcu_read_lock();
>                                 if (inet_csk_reqsk_queue_add(nsk,
> nreq, child)) {
>                                         __NET_INC_STATS(sock_net(nsk),
>
> LINUX_MIB_TCPMIGRATEREQSUCCESS);
> @@ -1489,7 +1490,7 @@ void inet_csk_listen_stop(struct sock *sk)
>                                         reqsk_migrate_reset(nreq);
>                                         __reqsk_free(nreq);
>                                 }
> -
> +                               rcu_read_unlock();
>                                 /* inet_csk_reqsk_queue_add() has already
>                                  * called inet_child_forget() on failure =
case.
>                                  */
