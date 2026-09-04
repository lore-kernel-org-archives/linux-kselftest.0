Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EF42378F
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549337; cv=pass; b=gUYl75BrCvV+qzZbezmDhPQTO6zygIfMvzIrsZk98e4IWRR75ZeiQHqsbhjQUZiRwPa9nD1YFu0aVIzvWeMHiX5fy88+A3aJC+8JggkubcHGVo5zIqc4SBMzLYz+F4CUv85pYH2XCI5aPfjBPCfogaOYG53FkxYSjZTv2Nqo87A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549337; c=relaxed/simple;
	bh=RJcDDgRgpaDIUsfuExKSBMWandyiKFZbShfF+mF/REM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5uLjpswKjeOWdLEjFgJ2xzFsf1ogCFzmvm2x/EPtEOnd9EC+igqX4s9Ld6BQMGvqvPcv17qRzdnvTlm9WPY7Twzqpohk/HHfoCObYVJJn4M52yu2dyUuafAFx5GNito+YerKNNPk4VncGgrh6FZb6p/zNn81j4qvpTpO0Ju8Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=Nw5jcjG7; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="Nw5jcjG7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso1338374b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 12:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788549332; cv=none;
        d=google.com; s=arc-20260327;
        b=kGGLFYZlH8HPEdewmVTrgVbXgUjr+OQxnafHqXzal8sYbqyfr5/kOqKG0Qfw70wjWJ
         mkSketwmoxH68pHaTUHothlc1XwqApmyAtsqiBcoGmxzPMe1vMRxmNnf6/q9WTLk4sHM
         75e92tz1i+IXmX0d9QhF0IDgejIROF+O9A0XdmWKrGxGX1rA2fij3QqnTNEQq4UlDVi7
         XEGVU2ddowMwvrE8GEmNCwcu6knt/Wh3t97kgbnezSGXqDHe+wLhpmt7+bzylODA2buP
         hjTUS3Siq0SL3qKJZ/c0hYb9q6oT3gQVL9CvbiH/40OQlyI9cXJDv+5rDonS2Kk/gkti
         G04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dYS5/w22YuJNpUyBa8hionV/tw+04HF3GDuU6FDXpFg=;
        fh=S4JqHmWbjewlhgmSNlxaSliQNLVZVtn/DWjexqoNz5E=;
        b=gbkU2KAgN0BPFSfMHj0BN9tc01MrzCp/Q0j25y31nHxUFUzhq/GZv390Jcytoi381b
         SMfv6Ue6SUcbWCw74Fwy2d1WDR1V3rC0QSlNz6/gfMbQwUVL1ossKMbDcTIng2peZ7WD
         EKDl/mxAQ469b+WEbHwav8L3V48eF5PVxZ/OOvKJ8uFdE6ZUN8hvL+O+BizyVAsyuiSY
         duvtYA6WwQhSB1SXGjSQLYLQgGhaLafw4xvXj2+Jcoe+wN0lBpwsVYMGa09dv+ZfgXMr
         LSSVEfgH92I7qa1dlznEbP9fXVFZ87OgYyXbiTeSX7+g4bUzs/QIT3x402RY6D+tW6jL
         pM7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788549332; x=1789154132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYS5/w22YuJNpUyBa8hionV/tw+04HF3GDuU6FDXpFg=;
        b=Nw5jcjG7Y+yWx6I60/FaTfMbrUBQUHz77/UklmKOtMsHfaLyw/MbO6wDf6EKiIcSoB
         u5T+iZsymQJa/56O4fCj+hooQ0t8+4SVI9bKCPmno3FkCKw11kBwv0F+eijzBzdLemJA
         RwJ1QKcflTHfkLWrFx/jybRj0jS0TnnFKozOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549332; x=1789154132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYS5/w22YuJNpUyBa8hionV/tw+04HF3GDuU6FDXpFg=;
        b=BD51Z1/DedBbOaYFAZX3ShG+IMsRgtbalbwmcLj0xUlEr0hUp001kVCR6qyoftp4cn
         ilZMPp/SDg5tPcirtiG3IYY+DcB8wIyqODzmOOsYQZy/jCTphW2SIS4Oy7bsIuZKunA3
         gmWi1iYGYpAHl+aLnfzRUAASdsj676XFQ+4snW9zLNKzx6EcMnO5mDTUq9X2RTjNXUQw
         H+/FMqOPRCJHoRV7g1oBTWuLgXIHiLvhfw12v6F4JS9wJ8pxPTfrsRbrI1EsOx4dMtOL
         Vg5bx0ngHT4T+HFlnmSMgwzMIqa//6LdJAd3EO2d6GY6SWqTqQupVKksPZSn6STd7Mqi
         VJKA==
X-Forwarded-Encrypted: i=1; AKwUvBzYeG/cq6V5d6CNOPdKkNHyJZ212RXrdELFRr1rUP3Wk0NUFvkRZx+vlcH9Jtkmw/68LFTkE1LlegATNu0iRDw=@vger.kernel.org
X-Gm-Message-State: AFuF++kz24keiVDAPRtAgl7iQittZ31ijxl84Z081NcYsSEQEzeRH94A
	q1+I7+Gs2+HVvbp+Zn1x2/Ta2FB7/Q31au+by5mS/vOs0qfpoIRcW2Vr3a7HEkS+n/YMuLNcRHM
	4R/OWOK1BFFQYPnvAzb6MdBLEUfqKwAE302a5adzF
X-Gm-Gg: AYBFou1mO5jFDD+xbGRfpPFPBxrzS5GX6PrTScFXXUw5v7OuuqS+WrjkmafwyhWiQEd
	yu9JSX7kkzw6shiCQJkUrfxNleDQhuxRrnRiwZSBP2HLvWz+TjyKoHZepY9R1ByVi/TBxFyjMGj
	JhCcn6+O3lcHCgdVJE6AS188S6yeFUeqUvp0iw6W9ovfyDO+xMDw4Lk08/EMt8i1yjniN4HE24O
	RWp49477tbR99TRTL9JZiIW4Uwl7fcuu1SF4OPKUYNkZ5cfx8dOpT2IIICUbaHPKhxPDzAjjSIF
	klNeLwTbQB6+jGwJo2FEFs0Hgnh7s5nzJ0CLv8SlJ50/6S6n1D+Bjsbzo5CLEMScg/zi1xVMa1E
	uHA6BTqnbRr3TpQUVz5dOindEwQmydoDEBA==
X-Received: by 2002:a05:6a00:950c:b0:855:74f7:40c2 with SMTP id
 d2e1a72fcca58-8616a36d628mr12602867b3a.14.1788549331694; Fri, 04 Sep 2026
 12:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.6> <178851496617.4131868.17637386620065749703@kernel.org>
In-Reply-To: <178851496617.4131868.17637386620065749703@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 15:15:19 -0400
X-Gm-Features: AcwNN1VgibR1p-Uw9b938VLE_oHi6L0x_m8biEC_EiOq_ihQAdY98OCRwHBuzRA
Message-ID: <CAM0EoMmPcFnbA3pV4wYBb-GiODmy9BR55obGHM-5Z8zuCeccyg@mail.gmail.com>
Subject: Re: [PATCH net v3 5/9] net/sched: dualpi2: clamp psched_mtu at all
 call sites
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, toke@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] Changelog/reproducer mismatch in "net/sched: dualpi2: clamp
>   psched_mtu at all call sites": the commit message blames "a crafted=E2=
=80=A6
> - [Low] netdev coding-style violation and triplicated open-coded clamp.
>

My conclusion:

1. [Medium] "changelog/reproducer mismatch =E2=80=94 stab does not reach
   psched_mtu()"
Valid point.
The real trigger is a large device MTU  (dummy accepts up to ~2^31-1
since dev->max_mtu =3D 0), not a size table; the changelog's stab-based
recipe exercises none of the three
 The correct reproducer is: "ip link set dev dummy0 mtu 2147483647"
Changelog issue only; the clamp is the right fix for the MTU path.

2. [Low] "declaration ordering + triplicated clamp"
Also valid:  Will fix the ordering (and consider a small helper) if
the series is ever resent.

On the deferred scope note (dequeue_packet() credit multiply,
deferred_drops_len accumulation): We verified separately the generic 1
MiB pkt_len cap bounds the multiply, but the s32 credit ACCUMULATION
can still wrap when the C queue is empty; filed as a follow-up
("under dualpi2 c_protection_credit s32 accumulation wrap
(C-queue-empty case)") .

cheers,
jamal

> --
>
> net/sched: dualpi2: clamp psched_mtu at all call sites
>
> The patch clamps psched_mtu(qdisc_dev(sch)) into [1, 1 << 20] at the thre=
e
> places sch_dualpi2.c uses it: dualpi2_calculate_c_protection(), must_drop=
()
> and get_memory_limit().  The stated goal is to avoid overflow of the sign=
ed
> multiply for c_protection_init and the wrap of 2 * psched_mtu().
>
> A couple of questions about the changelog and the style of the new code.
>
> [Severity: Medium]
>
> > With a crafted size table qdisc_pkt_len reaches ~2 GiB, causing a soft
> > lockup / denial of service.
> >
> >   tc qdisc add dev dummy0 root dualpi2
> >   tc qdisc change dev dummy0 root dualpi2 stab data 32768 size_log 15 c=
ell_log 0
>
> Do these two commands actually exercise any of the three changed lines?
>
> The patch only bounds psched_mtu(), which is derived from the netdevice:
>
> include/net/pkt_sched.h:
>         static inline unsigned int psched_mtu(const struct net_device *de=
v)
>         {
>                 return READ_ONCE(dev->mtu) + dev->hard_header_len;
>         }
>
> A TCA_STAB only rewrites qdisc_skb_cb(skb)->pkt_len in
> __qdisc_calculate_pkt_len(), so a size table cannot influence
> psched_mtu().  With the quoted commands dummy0 keeps its default MTU, so
> dualpi2_calculate_c_protection(), must_drop() and get_memory_limit()
> compute the same values before and after this patch.
>
> Is the "~2 GiB" qdisc_pkt_len reachable on this tree at all?
> __qdisc_calculate_pkt_len() already caps it, and that clamp is present in
> the baseline too:
>
> net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
>         ...
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>         qdisc_skb_cb(skb)->pkt_len =3D pkt_len;
> }
>
> with include/net/pkt_sched.h:
>
>         #define QDISC_PKT_LEN_MAX       (1 << 20)       /* 1 MiB */
>
> Would it be more accurate to describe the trigger as a large device MTU?
> dummy leaves the upper bound unset:
>
> drivers/net/dummy.c:dummy_setup() {
>         ...
>         dev->min_mtu =3D 0;
>         dev->max_mtu =3D 0;
> }
>
> and dev_validate_mtu() only enforces an upper limit when dev->max_mtu > 0=
,
> so "ip link set dev dummy0 mtu 2147483647" is what makes
> (s32)psched_mtu() * ((int)wc - (int)wl) overflow.  Note that
> TCA_DUALPI2_C_PROTECTION is range-limited to [0, MAX_WC] with MAX_WC 100,
> so the signed multiply only overflows above roughly 21.5 MiB of MTU, and
> 2 * psched_mtu() only wraps above 2 GiB.
>
> One more thing on scope: the size-table path the message mentions is left
> untouched in this file.  dequeue_packet() still does
>
>         *credit_change *=3D qdisc_pkt_len(skb);
>
> and drop_and_retry() still accumulates
>
>         q->deferred_drops_len +=3D qdisc_pkt_len(skb);
>
> Those are fine here because of the generic 1 MiB pkt_len cap, but the
> Fixes: tag points at trees that may not carry that cap.  Should the
> changelog say so?
>
> > diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
> > index 4f678d4ff10ec..4947def7c49ef 100644
> > --- a/net/sched/sch_dualpi2.c
> > +++ b/net/sched/sch_dualpi2.c
>
> [ ... ]
>
> > @@ -285,8 +287,9 @@ static bool must_drop(struct Qdisc *sch, struct dua=
lpi2_sched_data *q,
> >       u64 local_l_prob;
> >       bool overload;
> >       u32 prob;
> > +     u32 mtu =3D clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20);
>
> [Severity: Low]
> This isn't a bug, but the new declaration in must_drop() is the longest
> line of the block and is placed last, which breaks the netdev declaration
> ordering rule in Documentation/process/maintainer-netdev.rst ("Order the
> variable declaration lines longest to shortest").  Moving the
> initialization out of line, or reordering the block, would match the rule=
.
>
> >
> > -     if (sch->qstats.backlog < 2 * psched_mtu(qdisc_dev(sch)))
> > +     if (sch->qstats.backlog < 2 * mtu)
> >               return false;
> >
> >       prob =3D READ_ONCE(q->pi2_prob);
>
> [ ... ]
>
> > @@ -712,7 +715,8 @@ static u32 get_memory_limit(struct Qdisc *sch, u32 =
limit)
> >       /* Apply rule of thumb, i.e., doubling the packet length,
> >        * to further include per packet overhead in memory_limit.
> >        */
> > -     u64 memlim =3D mul_u32_u32(limit, 2 * psched_mtu(qdisc_dev(sch)))=
;
> > +     u64 memlim =3D mul_u32_u32(limit, 2 * clamp_t(u32, psched_mtu(qdi=
sc_dev(sch)),
> > +                                                  1, 1 << 20));
>
> Would a small helper, e.g. dualpi2_psched_mtu(sch), be preferable here?
> The same clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20) expression =
is
> now open-coded three times, including this line-wrapped copy inside
> mul_u32_u32(), so the "at all call sites" property has to be re-checked b=
y
> hand for any future psched_mtu() user or bound change.
>
> >
> >       if (upper_32_bits(memlim))
> >               return U32_MAX;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
