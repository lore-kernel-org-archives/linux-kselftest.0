Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320621256C
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777208497; cv=none; b=AWd3MrZw69WgDdPLdPIMQjWl5jf0ATDbKtojVXnd9ADkJ8hSObigyWggQPPrTzML3iFtFpI20R11YlZb+fLYLmBwUNhzvOEMqxxDHBso3BRLVyAA6ezfpNFt1g8FblKFQzBr23hX/sYBwF581pSZ898uvbaF+huOdmi9l+I+dhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777208497; c=relaxed/simple;
	bh=TCoSibuEHDVGM9Nbq10rloswURUgdUub3SsgD2V6WOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ9kI4Oz+b9JZWsSKYPUFxHvLNX7CBQRwXa1fbxIMypfwqTBWe+eevBK9vjY2p2Xyq/tLMV8M3OZFcViRV+fgfkw/HA6MPqK2JZ6pD22sGc+Jh0o12IznNtCB3VJMXMEMdZqbL13UoGXPV/Rz8Th2sY7fTgJtfvWPvtZRkKSqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv9WzeKA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv9WzeKA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so6077055a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208495; x=1777813295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hz+a2+HfJFQcmnAlUttTKf4fXe/Se+UaNtVUmto+Owo=;
        b=hv9WzeKAxovJbKRnxjfiWZqKm5Ho3B6n21GZLqe+0k9jTmPSCYZESsoaanEhX3Z0zC
         gndQZWrzLQN8u9uPB8e336WrFpmao48OPYtIfiaJwmTuUXsgPoDq9Pd2BxHjaZZbgQJh
         SP2I6XIF1ZTg9vk1E2nv2uA35sQqG9wPko1tHPL1rV1+Bl766rptSPBtO/goVmjia1ox
         88de6Yk7ZWgK0vVi2BPf8Fvbg7ZMmp1JrV9UmD33Fycc2ysJeNUc3DgIU0SJKP0JP/MD
         TBHNSe0Q78O+7/1UKLN0XuyVGTjqv2L3aBnwmEmL5Uafowr2RCUyiIsyAHq0I+Bp7hUD
         2wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208495; x=1777813295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hz+a2+HfJFQcmnAlUttTKf4fXe/Se+UaNtVUmto+Owo=;
        b=BXOIw+CJJJgJZZTZqs+e6zDPMspbpjJaqU8gE5xecyKcLJ8SnBv/G/c20ekuJbf+78
         pjDpMGflgl6cZKUn5EwxOB9WapFbS30hoeLr619bP+V59JJiO5Xeh97j0xFrX5YKaQgA
         yCsQWYsC3DiVn/nqxDkgoe7/Y+YfoJdBRYxzwCtWvOlUoLNjX3/TC3Wb42A8rPj1KtwI
         kDcMfPReOy6Zv2cL0/pXpmkb0F+iIYJm6GiKmR1jVCSVjevlycPrtU+/bf4PmpOsLmDu
         ZzIJxBmbfh6LBXxViGCqEFZBO5OVgNZ5YM2hMrNgPWrzGqscJfN89GW2lj3J+cCzNfJl
         mFRA==
X-Forwarded-Encrypted: i=1; AFNElJ9l6dcxA1uPO5A8dnAaf0F754Vw0Nn6IhOL8ZjOhQM1p2JgDlCqDMqtwZVzApR9pohHJTmfN1DMKtj+SiT720Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGiA2NfUuGxhbrYYHhfb5JZfyjarWedkivr1fqmlC+u5U6zg8
	xR+AYGp2SqFUxI9l55G+AcbwNmi1ilSyefChbhsZfCn0TDCkqzKvNcV+
X-Gm-Gg: AeBDiesp2eUw9M1oJjSAPkY00SRJRw+MC/wjf/1JCaJcjd3cbc9i0MPh4r6iHlIlCuH
	UULbhatu/F8ujQ/ppXfePQ94SGcHm9O09CqJE76m90+7GL8D8w6rAcVT8vbU8p5x5+VsXDUM9uU
	AINNNuSIKZ3bj6PcYNFozG0AOLITYdi7cHMbCtLgsckUj0dkmCjMH+bKrl+EAJ5gomTKDnnGbVf
	K5KWUZAqM73DgYawl2oMdghU4smEImKLbT5iKTm2u6GLnCXLUbfdxFryekPBvDHmDCKrH7NdpzO
	og7rC/1MR3dEqJkzTfV5WHopKIItF3Qfj6ATMMnH0Dh+XnRf8WnHCXPPLluD9fPIEdGGpUhiVxy
	PVdCQI/YwZhonMI7/UVGSwtuIL60isvCZnkKH13i+dZyrxedKjnHnl8EVAsYR0gsQaku7dM8eqc
	NuWC1ctg8hoapjhCpIuhNj+xR3ddMdVlCMnK6TxggiOfKy0TNcpMfLSLv2cW/XeQ==
X-Received: by 2002:a17:90b:37cb:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-3614041bc7cmr35776295a91.12.1777208495116;
        Sun, 26 Apr 2026 06:01:35 -0700 (PDT)
Received: from Air.local ([198.176.50.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36145fe05f4sm13222157a91.0.2026.04.26.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:01:34 -0700 (PDT)
Date: Sun, 26 Apr 2026 21:01:22 +0800
From: Weiming Shi <bestswngs@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: vinicius.gomes@intel.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladimir.oltean@nxp.com, shuah@kernel.org, xmei5@asu.edu, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v5 1/2] net/sched: taprio: fix NULL pointer
 dereference in class dump
Message-ID: <ae4MazwnHXufRYRU@Air.local>
References: <20260422161958.2517539-2-bestswngs@gmail.com>
 <20260422161958.2517539-3-bestswngs@gmail.com>
 <CAM0EoMka18Lsu94wTFZU3ntXP9Z3vNy0Get+=THPdsCafcoPnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0EoMka18Lsu94wTFZU3ntXP9Z3vNy0Get+=THPdsCafcoPnw@mail.gmail.com>

On 26-04-26 06:59, Jamal Hadi Salim wrote:
> On Wed, Apr 22, 2026 at 12:20 PM Weiming Shi <bestswngs@gmail.com> wrote:
> >
> > When a TAPRIO child qdisc is deleted via RTM_DELQDISC, taprio_graft()
> > is called with new == NULL and stores NULL into q->qdiscs[cl - 1].
> > Subsequent RTM_GETTCLASS dump operations walk all classes via
> > taprio_walk() and call taprio_dump_class(), which calls taprio_leaf()
> > returning the NULL pointer, then dereferences it to read child->handle,
> > causing a kernel NULL pointer dereference.
> >
> > The bug is reachable with namespace-scoped CAP_NET_ADMIN on any kernel
> > with CONFIG_NET_SCH_TAPRIO enabled. On systems with unprivileged user
> > namespaces enabled, an unprivileged local user can trigger a kernel
> > panic by creating a taprio qdisc inside a new network namespace,
> > grafting an explicit child qdisc, deleting it, and requesting a class
> > dump. The RTM_GETTCLASS dump itself requires no capability.
> >
> >  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000007: 0000 [#1] SMP KASAN NOPTI
> >  KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
> >  RIP: 0010:taprio_dump_class (net/sched/sch_taprio.c:2478)
> >  Call Trace:
> >   <TASK>
> >   tc_fill_tclass (net/sched/sch_api.c:1966)
> >   qdisc_class_dump (net/sched/sch_api.c:2326)
> >   taprio_walk (net/sched/sch_taprio.c:2514)
> >   tc_dump_tclass_qdisc (net/sched/sch_api.c:2352)
> >   tc_dump_tclass_root (net/sched/sch_api.c:2370)
> >   tc_dump_tclass (net/sched/sch_api.c:2431)
> >   rtnl_dumpit (net/core/rtnetlink.c:6864)
> >   netlink_dump (net/netlink/af_netlink.c:2325)
> >   rtnetlink_rcv_msg (net/core/rtnetlink.c:6959)
> >   netlink_rcv_skb (net/netlink/af_netlink.c:2550)
> >   </TASK>
> >
> > Fix this by substituting &noop_qdisc when new is NULL in
> > taprio_graft(), a common pattern used by other qdiscs (e.g.,
> > multiq_graft()) to ensure the q->qdiscs[] slots are never NULL.
> > This makes control-plane dump paths safe without requiring individual
> > NULL checks.
> >
> > Since the data-plane paths (taprio_enqueue and taprio_dequeue_from_txq)
> > previously had explicit NULL guards that would drop/skip the packet
> > cleanly, update those checks to test for &noop_qdisc instead. Without
> > this, packets would reach taprio_enqueue_one() which increments the root
> > qdisc's qlen and backlog before calling the child's enqueue; noop_qdisc
> > drops the packet but those counters are never rolled back, permanently
> > inflating the root qdisc's statistics.
> >
> > After this change *old can be a valid qdisc, NULL, or &noop_qdisc.
> > Only call qdisc_put(*old) in the first case to avoid decreasing
> > noop_qdisc's refcount, which was never increased.
> >
> > Fixes: 665338b2a7a0 ("net/sched: taprio: dump class stats for the actual q->qdiscs[]")
> > Reported-by: Xiang Mei <xmei5@asu.edu>
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > Assisted-by: Claude:claude-opus-4-6
> 
> Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>
> 
> Please add Tested-by: if you tested it with the tdc patch in 2/2
> 
> cheers,
> jamal

Tested-by: Weiming Shi <bestswngs@gmail.com>

Thanks,
Weiming Shi

> > ---
> >  net/sched/sch_taprio.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> > index 8e37528119506..a7daf34593e07 100644
> > --- a/net/sched/sch_taprio.c
> > +++ b/net/sched/sch_taprio.c
> > @@ -634,7 +634,7 @@ static int taprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
> >         queue = skb_get_queue_mapping(skb);
> >
> >         child = q->qdiscs[queue];
> > -       if (unlikely(!child))
> > +       if (unlikely(child == &noop_qdisc))
> >                 return qdisc_drop(skb, sch, to_free);
> >
> >         if (taprio_skb_exceeds_queue_max_sdu(sch, skb)) {
> > @@ -717,7 +717,7 @@ static struct sk_buff *taprio_dequeue_from_txq(struct Qdisc *sch, int txq,
> >         int len;
> >         u8 tc;
> >
> > -       if (unlikely(!child))
> > +       if (unlikely(child == &noop_qdisc))
> >                 return NULL;
> >
> >         if (TXTIME_ASSIST_IS_ENABLED(q->flags))
> > @@ -2183,6 +2183,9 @@ static int taprio_graft(struct Qdisc *sch, unsigned long cl,
> >         if (!dev_queue)
> >                 return -EINVAL;
> >
> > +       if (!new)
> > +               new = &noop_qdisc;
> > +
> >         if (dev->flags & IFF_UP)
> >                 dev_deactivate(dev, false);
> >
> > @@ -2196,14 +2199,14 @@ static int taprio_graft(struct Qdisc *sch, unsigned long cl,
> >         *old = q->qdiscs[cl - 1];
> >         if (FULL_OFFLOAD_IS_ENABLED(q->flags)) {
> >                 WARN_ON_ONCE(dev_graft_qdisc(dev_queue, new) != *old);
> > -               if (new)
> > +               if (new != &noop_qdisc)
> >                         qdisc_refcount_inc(new);
> > -               if (*old)
> > +               if (*old && *old != &noop_qdisc)
> >                         qdisc_put(*old);
> >         }
> >
> >         q->qdiscs[cl - 1] = new;
> > -       if (new)
> > +       if (new != &noop_qdisc)
> >                 new->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
> >
> >         if (dev->flags & IFF_UP)
> > --
> > 2.43.0
> >
