Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBEE34A76A
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201158; cv=pass; b=jNy+N/2rLFnfZ/sZM9+gdGpoP4PxNPY7RpjY7QhIjJbyPKaQcXMxzrLvf6fKtbuMGAN9Jls/7wHsAdipoilF2mXYHcKysj5gnb4Rkxu7Ueb0gmTSVilYzuVQykeKdd9vi4TaLpfPhX2gV4FRMenFhfSBkROlMbt///FFG9JNb5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201158; c=relaxed/simple;
	bh=QzJaR5J8RyQ1tSvYBbCR8p3++ETasbsBmRkAIgSzkcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rydun17x3UTv16KDtpNQIkIjEbtQUZVC9EHjOKyeTekjJz8UlfPD74dNjm4URiqWKspsrk3m6PahYm5uZlsCc8kqyxhVB/gxKZdWMGVGXWell7hyftz+Qwwr12jPRi3R5OLU8N7NjjomLcUtDUw4XSdCuheGdqt08gm5UnTiLfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20251104.gappssmtp.com header.i=@mojatatu-com.20251104.gappssmtp.com header.b=B08oLEGj; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20251104.gappssmtp.com header.i=@mojatatu-com.20251104.gappssmtp.com header.b="B08oLEGj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f69adeecbso3815586b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 03:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777201156; cv=none;
        d=google.com; s=arc-20240605;
        b=XlJjTAr63EvLBcOhWSF2VVBcvlNUBq7ADm4sEPOP/kRjXlc07xG8H1ETqDQsYlihzB
         dx+SHtjsD442EreE7Xrme2YNH6pX7tUw2eZXHVs5YN76/VLZxLCHoaE84S6MNDt6d7y4
         34o9phPqx0f2M+lC2RVHsyie7FMYNeGvZyG93lZyDAtjv88l3F7gPyBZZRU3Ps3JXTZ6
         vKkBkWrkywO5YEAvEmrvuf77L8ao1wwZ18qDiWh2NC3rKaYoDrqkTTZiSnQeR184gALR
         m7a4P2onWVCqckTEEcPu50S7OUUFlnG5NnYaqwdcw8buYrv14bwDFSFVAzAfT4bGVwMO
         33pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z43G+siVNfTfqwol+9vvew4HXuMyxWOD6fgODyjOUvQ=;
        fh=z4fanKVurQ+7KFD9cvEF0cXoUgzb9xn6oKCkKUYG8i4=;
        b=MFcAXxSBOHa0P8LWMGAdz5y248ion4sNBAX5fNNDHEFHh64N3Lp/LJkf4SSCHRHffB
         qCBhsKPrkLcqzHKqPAtppBSoTSPcc15bECAu2V9LMUhm62L7u1QJtAUsx4yzb5tWOJG2
         3onmpe+l10wkPE7YbfAAUToLUPX+9BZ64P0aiKHT6XJr3JY28tIqyKPJe1Qop4v//5U4
         TqKuBFHb0jrDlE+pTiv3+EgjgFYFXPwwDF37hQfa1mhNhWbM7YCktiJACwJmpk2eWbJI
         LfqbJrEF4FT0byZ6F3xKWOveMWG/BM3DyajEqJyjNCaCmJW6JUR9/Gfhy8FGVJJmhHFD
         2s5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20251104.gappssmtp.com; s=20251104; t=1777201156; x=1777805956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z43G+siVNfTfqwol+9vvew4HXuMyxWOD6fgODyjOUvQ=;
        b=B08oLEGj/zc12Ig6OaXkOTVYSJcqLydB+YVE9o1A6uO4L1/YnkefZaBQ6W8RNaoHcf
         vu6XB7WSzmX34fTDGkvo56i8YHnY8lqI15kH+NU5L2chPGStXtdS494PDFvZ3TNBAUju
         lKqWYgbnAR47FuWb0+nWmGLganAeIAXxYbBCSeFypb9onrsjjIsrOuLbIoNoDKp592DY
         jXMoCWfIuN5UPNEB6uvx+2opwUOZMwkvCY6wCvjXKzVbLwXSJu9R1lfURZvVigK9rmrU
         LdSOwGHrtwrlH7fzyjb6AgdJ7XdRh6TgbagRVpTHY8JQ4XvjGdPN/4MwaG0zNgK9ozss
         dhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201156; x=1777805956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z43G+siVNfTfqwol+9vvew4HXuMyxWOD6fgODyjOUvQ=;
        b=F8NqaliHjYEX0FvzEGTVNBdFykORVTwp4qa/IxxK27tgEskxAjRdDDKEfA66rR44a5
         BdmJm2j/6wY/z9m7aCgB/XGRKEUSK2tjhbTlbt9J6XKJiMBHnMEKzdy5YNSk+DSvUieH
         c0VeP5g6L7FFL58scx9k2jpkP+q9OB1DFMrP+qjA+8meJyhmzkKGGzH5x/lYsot295vR
         9W88rooQwTE+9D5zVo4/9ZBgl3Ec25lvlKh26jRNz9RJ1GonYPUO0uFwHKnY27klRZ40
         qW9ipY4iYAaGacAZJHeb5MetRSyghMa0dc+ii1Ee1N/t1XlJBuIbOjkUvtxhZnLurh9y
         GwMA==
X-Forwarded-Encrypted: i=1; AFNElJ8Dyan4X2ic1dKX7lNK7l5vacgeFrdwOFtLY2uPTMI4kNb5+SEauwbbDjbFvAzgi5OKnuPbhUySE9ar50Zlso4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCvKLrYgSbBOH6/KjYwUDcKqGcdtzr4kqcea7gNVNOT8YWdXK
	lm6c9aE4G2MKp8e20jXB2rSO3GdBdIrAxSuAfIKYqTLhMGwT3ZaLhd911FDgyl3KmqYTu+HX16H
	/zW+Q3puTYhRcd8gno9swbHPRslI2KPLKhcO4juXb
X-Gm-Gg: AeBDiesJftvcEgQ9+FtoCTOLJKTWelX1BK3wXh2j9ixcgzTAbJW46gffLrCH4crf7rv
	shkL7vMjZFr5sT6UHlEI1Z/ZAVA4ayzTAlUshsNb/n81jUMzlVbO9mVV2TwZasU4OlK1ZLzGTUl
	gK67mOGhguo8umvaDs5eAGKsUUX9XB0FZjuHkUln4puhwDsHxiMZKFL9tJVyE2J4nCJLQKBTqmR
	eVoECMi01TfUCbn+PGHy9NTaZrGgiT3LQ3Vp/EHdnb4mgiPLy0NaZYxf3V3vbFaS2FbmDiWsjZ4
	+aqXD2FK1PKI67GQFAbIjYwAHVRFLohRFoLgw3D0
X-Received: by 2002:a05:6a00:1bc6:b0:82f:1b1b:e166 with SMTP id
 d2e1a72fcca58-82f8c99159emr41296406b3a.33.1777201156605; Sun, 26 Apr 2026
 03:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422161958.2517539-2-bestswngs@gmail.com> <20260422161958.2517539-3-bestswngs@gmail.com>
In-Reply-To: <20260422161958.2517539-3-bestswngs@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 26 Apr 2026 06:59:05 -0400
X-Gm-Features: AQROBzDdlUOYkMaP9cdvY9lBi6RpAH3mvy83bOI6hcc8joAewAsu9FYK5nmnDUU
Message-ID: <CAM0EoMka18Lsu94wTFZU3ntXP9Z3vNy0Get+=THPdsCafcoPnw@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] net/sched: taprio: fix NULL pointer
 dereference in class dump
To: Weiming Shi <bestswngs@gmail.com>
Cc: vinicius.gomes@intel.com, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladimir.oltean@nxp.com, shuah@kernel.org, xmei5@asu.edu, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:20=E2=80=AFPM Weiming Shi <bestswngs@gmail.com> =
wrote:
>
> When a TAPRIO child qdisc is deleted via RTM_DELQDISC, taprio_graft()
> is called with new =3D=3D NULL and stores NULL into q->qdiscs[cl - 1].
> Subsequent RTM_GETTCLASS dump operations walk all classes via
> taprio_walk() and call taprio_dump_class(), which calls taprio_leaf()
> returning the NULL pointer, then dereferences it to read child->handle,
> causing a kernel NULL pointer dereference.
>
> The bug is reachable with namespace-scoped CAP_NET_ADMIN on any kernel
> with CONFIG_NET_SCH_TAPRIO enabled. On systems with unprivileged user
> namespaces enabled, an unprivileged local user can trigger a kernel
> panic by creating a taprio qdisc inside a new network namespace,
> grafting an explicit child qdisc, deleting it, and requesting a class
> dump. The RTM_GETTCLASS dump itself requires no capability.
>
>  Oops: general protection fault, probably for non-canonical address 0xdff=
ffc0000000007: 0000 [#1] SMP KASAN NOPTI
>  KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
>  RIP: 0010:taprio_dump_class (net/sched/sch_taprio.c:2478)
>  Call Trace:
>   <TASK>
>   tc_fill_tclass (net/sched/sch_api.c:1966)
>   qdisc_class_dump (net/sched/sch_api.c:2326)
>   taprio_walk (net/sched/sch_taprio.c:2514)
>   tc_dump_tclass_qdisc (net/sched/sch_api.c:2352)
>   tc_dump_tclass_root (net/sched/sch_api.c:2370)
>   tc_dump_tclass (net/sched/sch_api.c:2431)
>   rtnl_dumpit (net/core/rtnetlink.c:6864)
>   netlink_dump (net/netlink/af_netlink.c:2325)
>   rtnetlink_rcv_msg (net/core/rtnetlink.c:6959)
>   netlink_rcv_skb (net/netlink/af_netlink.c:2550)
>   </TASK>
>
> Fix this by substituting &noop_qdisc when new is NULL in
> taprio_graft(), a common pattern used by other qdiscs (e.g.,
> multiq_graft()) to ensure the q->qdiscs[] slots are never NULL.
> This makes control-plane dump paths safe without requiring individual
> NULL checks.
>
> Since the data-plane paths (taprio_enqueue and taprio_dequeue_from_txq)
> previously had explicit NULL guards that would drop/skip the packet
> cleanly, update those checks to test for &noop_qdisc instead. Without
> this, packets would reach taprio_enqueue_one() which increments the root
> qdisc's qlen and backlog before calling the child's enqueue; noop_qdisc
> drops the packet but those counters are never rolled back, permanently
> inflating the root qdisc's statistics.
>
> After this change *old can be a valid qdisc, NULL, or &noop_qdisc.
> Only call qdisc_put(*old) in the first case to avoid decreasing
> noop_qdisc's refcount, which was never increased.
>
> Fixes: 665338b2a7a0 ("net/sched: taprio: dump class stats for the actual =
q->qdiscs[]")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-6

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

Please add Tested-by: if you tested it with the tdc patch in 2/2

cheers,
jamal
> ---
>  net/sched/sch_taprio.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 8e37528119506..a7daf34593e07 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -634,7 +634,7 @@ static int taprio_enqueue(struct sk_buff *skb, struct=
 Qdisc *sch,
>         queue =3D skb_get_queue_mapping(skb);
>
>         child =3D q->qdiscs[queue];
> -       if (unlikely(!child))
> +       if (unlikely(child =3D=3D &noop_qdisc))
>                 return qdisc_drop(skb, sch, to_free);
>
>         if (taprio_skb_exceeds_queue_max_sdu(sch, skb)) {
> @@ -717,7 +717,7 @@ static struct sk_buff *taprio_dequeue_from_txq(struct=
 Qdisc *sch, int txq,
>         int len;
>         u8 tc;
>
> -       if (unlikely(!child))
> +       if (unlikely(child =3D=3D &noop_qdisc))
>                 return NULL;
>
>         if (TXTIME_ASSIST_IS_ENABLED(q->flags))
> @@ -2183,6 +2183,9 @@ static int taprio_graft(struct Qdisc *sch, unsigned=
 long cl,
>         if (!dev_queue)
>                 return -EINVAL;
>
> +       if (!new)
> +               new =3D &noop_qdisc;
> +
>         if (dev->flags & IFF_UP)
>                 dev_deactivate(dev, false);
>
> @@ -2196,14 +2199,14 @@ static int taprio_graft(struct Qdisc *sch, unsign=
ed long cl,
>         *old =3D q->qdiscs[cl - 1];
>         if (FULL_OFFLOAD_IS_ENABLED(q->flags)) {
>                 WARN_ON_ONCE(dev_graft_qdisc(dev_queue, new) !=3D *old);
> -               if (new)
> +               if (new !=3D &noop_qdisc)
>                         qdisc_refcount_inc(new);
> -               if (*old)
> +               if (*old && *old !=3D &noop_qdisc)
>                         qdisc_put(*old);
>         }
>
>         q->qdiscs[cl - 1] =3D new;
> -       if (new)
> +       if (new !=3D &noop_qdisc)
>                 new->flags |=3D TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
>
>         if (dev->flags & IFF_UP)
> --
> 2.43.0
>
