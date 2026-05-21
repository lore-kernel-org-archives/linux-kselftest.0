Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFF3D7D91
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367143; cv=pass; b=uuLSwWYOoW2JK5pR4Eco1GuW2L0qEsAEmyP3OOrAVNcAts/Xuez/DSPctbhPebuoJobAZ7Z10/lSoL9AJPPwTp19MtsSwkE39VrIxG9Q4l4rNrmAjXjCbeMhSh8HTtCRImqottACOfji8rKSOtRYFKaT5wbKDuZu34dVsXIoKhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367143; c=relaxed/simple;
	bh=RiahDbEJAc+a6SEUc46bDIXeBBSM67xZIAhPJO19bM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXxeBYjTaJs1QgJ+292nI25g0+swRuN00dZU3Eb0iBdM9EO5mLNqv5n32Uwf4AWZqCrLtZSs/yYGzXY/HE85rRxsR7zvREmGDLAtq00wmfW+wm2mxksd+Ag0aPb6JpInodQQnKqi0x0UABZMw/sbM9Qt78tu7L+eAMrA5GtFNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6t7CYjH; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6t7CYjH"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso10014925a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 05:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779367140; cv=none;
        d=google.com; s=arc-20240605;
        b=LMXAQ6KxJkSjZsquSXNdn4Y49p0dbO6Gqi+cnaYr3R18VIrotna2exyv6ad/fjT9WR
         YslZOfygA7sOgcmXQVtDU7IxKFhCi5a5bcGMuzKfY15rT4Mr6A85wW6mrjNiUhhiVHRF
         YxS8Dfo/LXeoZYnBFNsYXHJF2KEX9ercPrexXS2tS/ciibYO6HjEW69q72SJJnkBfPKw
         ZPHyLGLgtPUlGXB7Ipq/YUQbsWIM2f8Hq9mecMtOb5HvD7RuakobwnAA2axlvdxw/TNH
         /ktaz5psilw6XU9vfNQ7mretBh0Bg7tsw0MGUugEc+I38dJdi5Q2kgDzGPiKqf87wMPw
         T8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dopi5lqgBCxQSuAudmyQPmhNkwArDVQ9G92RMimBsT4=;
        fh=5oq2YryHEkgdH6R/sa7PGnSoYtWl5HEUFdU8YpBM65o=;
        b=Gd16ZZNxaJac7VmD8CxPIfyKUJdT4uiPqegLrsE8c9j+w6o4nY5Tj+m88wTpRRbCdA
         G2VWo85zoyRVY4hBK0cf2ZQ7qvLg2QDBd0EQlHAOHFt8mUJSnpVlEDOFTo6367UyJCDI
         aDU2QUZVrNSQ9Y+kM1JVAHW96NSAdrH7ldpcU+zehmCwyAMzQl4tmi0Vg277whek2SVE
         iLJ7wWbEcgNvYta8dEK3W6+BaIvGaL9mTvGX8vKIDHeN1AAY5aoFCadlAPe00+8fC0uh
         tmpb3krd2AKKFz2JUkdRFnpm2KbCYjxzvYBakqdJLiRk99Uh5BXq9HGJHDe0ur5dolWB
         wSGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779367140; x=1779971940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dopi5lqgBCxQSuAudmyQPmhNkwArDVQ9G92RMimBsT4=;
        b=G6t7CYjHbyGZ7gGKlWqvPx9K0P/fFJ1Yqfdyz4G0HNiGlffzFndo64mp63NwSqJTBs
         5/EgLXZKHLt5OuPTzoEAPq/uRKMBsnEMzi10+Klv7VPdMV1p8B+iu6Zsi2Kf6LcjXMaO
         8Vn975La2iMumihnbYDIMZMktwezlaw3Wf1lIQHwBGv/KqG6He1OCCqm2DCbL+ggDEih
         U6rU9CJi2kMMRWX2nl4t1kz/1UuKerQ2BbVyvl4HOIoITmEqIPFWA3DO/sdDAefa70+E
         OSg/pK1DEnvCQ0hixSsoZC4H3OwbT+apMMiy70vnUEaHoINx4fHGb+XztwlbqhUmreKG
         dIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367140; x=1779971940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dopi5lqgBCxQSuAudmyQPmhNkwArDVQ9G92RMimBsT4=;
        b=Bjoe4l6cxTw/6jCbHk8owITkcIQUprjAmxi8gR4ncukYi1u8QV6hSHLA0Izsz/FIbM
         AZOTHdvmla6naGgaQ8/gUZ+5V6jbcKFbM+pAakFZrpeDXziUSIKevL0VtGblQySVbmLY
         sAu9TTi0BT3gbeVBxNN1ISZFGOtVuFx6C4B7DDrqpPFOCvQb2WrE0YvSY+AiItFaqTL6
         +OWi44HOT/azVW1XRIxH0u9/Z94N8PkJPQxN6Q/DDxASLQHbBcqv4x/EqInu70aPx6yP
         q+CnRGOJoWzVcR3EvV1bfYyQX9CZhFov+h4v080DpTZO9MitL5uvfqeizh3NFerok7fG
         Zhuw==
X-Forwarded-Encrypted: i=1; AFNElJ+15/bQ602u/dpi3gsJ1dTCm/lhwaK4IK4Z3HfaZxcXFINX69dUZaVlXIHYyw+AdI/TeDn63Pq205RAaSN+DKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaVFujHB/O5bCSvP3W1DTWgqX2HIKPSVRrZQkIo3RPukTjGcuI
	Y87aSErT2ehw6D/mjNoBL9FylRLTUJb9L71XH1qWlVC6OXZgR0ttsa6TbQ0m6aSt+v1C2K42yU+
	HAtL0w59Bh5xiIKL05L+KHcSOuRSRkuU=
X-Gm-Gg: Acq92OFGOziJoWL6y68auKkk0u+lTountgrfMUEfUbt4NlNgiWJbD4tfB4WSEsMVCbI
	bUSEyUzTNefRW3U+9qkrc4UTO4FqKPNDizofCWnup+AFqJhN22XnesT5RTTtDFyFX2QLIv8x/h2
	D+LEFeNigiNlyLBv6mhnDDWfeD2DrLUKugluyLjkEVKJzC4kNp6/+gw+7CKVo6sCWmcLil6cKGT
	0JNOMcp4UD1R/pBoYWi6ZRfO7r2lthU4crF72c5ChDat6ASyrFtiQdto1TUrPw6KwfU9HqppcTQ
	icMAKQ3KpUgnSXlPWxsxGU6BNLke5etx59sLfKsNsrzIgLC+0Q==
X-Received: by 2002:a05:6402:34c4:b0:683:1cc8:84ae with SMTP id
 4fb4d7f45d1cf-688356291damr1244493a12.7.1779367140215; Thu, 21 May 2026
 05:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1752824628.git.namcao@linutronix.de> <43d64ad765e2c47e958f01246320359b11379466.1752824628.git.namcao@linutronix.de>
 <CACSApvZT5F4F36jLWEc5v_AbqZVQpmH1W7UK21tB9nPu=OtmBA@mail.gmail.com>
 <20250718085948.3xXGcxeQ@linutronix.de> <20260429-november-speisen-3084d769d316@brauner>
 <87340exm2o.fsf@yellow.woof> <xbotidrmois5ygxtqtwqzczkt76wcc7uw5cz5lptda53coaavj@pzvxcpe534cu>
 <87cxzc62yp.fsf@yellow.woof>
In-Reply-To: <87cxzc62yp.fsf@yellow.woof>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 21 May 2026 14:38:47 +0200
X-Gm-Features: AVHnY4L3kuzvNft9YsihiRD6AmCZerhnkTxoTD2mo1YBA8rn2fL0bTYmJkGq3-c
Message-ID: <CAGudoHFGHsuGUXmefSrGfOkdcoPJnC5a1qbjc9_G4guC4LvJgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] eventpoll: Fix epoll_wait() report false negative
To: Nam Cao <namcao@linutronix.de>
Cc: Christian Brauner <brauner@kernel.org>, Soheil Hassas Yeganeh <soheil@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Khazhismel Kumykov <khazhy@google.com>, 
	Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@google.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 3:24=E2=80=AFPM Nam Cao <namcao@linutronix.de> wrote=
:
>
> Mateusz Guzik <mjguzik@gmail.com> writes:
> > Strictly speaking more error prone than the seq approach, but should be
> > faster on weaker-ordered archs thanks to avoided fences.
> >
> > I'm definitely not going to protest the seqc route.
>
> Linus probably wouldn't be thrilled if I break epoll again, so let's
> stay with the simpler seqcount route.
>
> Nam
>
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index a3090b446af1..22c3f0186476 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -38,6 +38,7 @@
>  #include <linux/compat.h>
>  #include <linux/rculist.h>
>  #include <linux/capability.h>
> +#include <linux/seqlock.h>
>  #include <net/busy_poll.h>
>
>  /*
> @@ -190,6 +191,9 @@ struct eventpoll {
>         /* Lock which protects rdllist and ovflist */
>         spinlock_t lock;
>
> +       /* Protect switching between rdllist and ovflist */
> +       seqcount_spinlock_t seq;
> +
>         /* RB tree root used to store monitored fd structs */
>         struct rb_root_cached rbr;
>
> @@ -382,8 +386,17 @@ static inline struct epitem *ep_item_from_wait(wait_=
queue_entry_t *p)
>   */
>  static inline int ep_events_available(struct eventpoll *ep)
>  {
> -       return !list_empty_careful(&ep->rdllist) ||
> -               READ_ONCE(ep->ovflist) !=3D EP_UNACTIVE_PTR;
> +       bool events_available;
> +       unsigned int seq;
> +
> +       do {
> +               seq =3D read_seqcount_begin(&ep->seq);
> +
> +               events_available =3D !list_empty_careful(&ep->rdllist) ||
> +                                  READ_ONCE(ep->ovflist) !=3D EP_UNACTIV=
E_PTR;
> +       } while (read_seqcount_retry(&ep->seq, seq));
> +
> +       return events_available;
>  }
>
>  #ifdef CONFIG_NET_RX_BUSY_POLL
> @@ -735,8 +748,12 @@ static void ep_start_scan(struct eventpoll *ep, stru=
ct list_head *txlist)
>          */
>         lockdep_assert_irqs_enabled();
>         spin_lock_irq(&ep->lock);
> +       write_seqcount_begin(&ep->seq);
> +
>         list_splice_init(&ep->rdllist, txlist);
>         WRITE_ONCE(ep->ovflist, NULL);
> +
> +       write_seqcount_end(&ep->seq);
>         spin_unlock_irq(&ep->lock);
>  }
>
> @@ -768,6 +785,9 @@ static void ep_done_scan(struct eventpoll *ep,
>                         ep_pm_stay_awake(epi);
>                 }
>         }
> +
> +       write_seqcount_begin(&ep->seq);
> +
>         /*
>          * We need to set back ep->ovflist to EP_UNACTIVE_PTR, so that af=
ter
>          * releasing the lock, events will be queued in the normal way in=
side
> @@ -779,6 +799,9 @@ static void ep_done_scan(struct eventpoll *ep,
>          * Quickly re-inject items left on "txlist".
>          */
>         list_splice(txlist, &ep->rdllist);
> +
> +       write_seqcount_end(&ep->seq);
> +
>         __pm_relax(ep->ws);
>
>         if (!list_empty(&ep->rdllist)) {
> @@ -1155,6 +1178,7 @@ static int ep_alloc(struct eventpoll **pep)
>
>         mutex_init(&ep->mtx);
>         spin_lock_init(&ep->lock);
> +       seqcount_spinlock_init(&ep->seq, &ep->lock);
>         init_waitqueue_head(&ep->wq);
>         init_waitqueue_head(&ep->poll_wait);
>         INIT_LIST_HEAD(&ep->rdllist);

Apologies for late reply.

The diff reads ok to me, but I would consider not looping in case of
seq mismatch.

So does it solve the problem?

I think a somewhat of a blocker here would be to bench the thing -- I
would expect some slowdown compared to stock kernel, but should be
still be faster than the previously proposed patch.
