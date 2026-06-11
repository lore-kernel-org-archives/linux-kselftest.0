Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947039185E
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168535; cv=pass; b=g1EM/UtgAZ0ffGs4prI9LtGjGJiwMGJVvRP+56WG2xgHjrpuyT6fwHeN0I4VVWapX+9ixgas5U7nHsc8uEuCBnIXCU/xONQ9ZeCq7SJndN+UqYTMv2Rh590NLhUhcqjQlm4ff2kWdmyXJIvREnlLFCqmz0CN9t8xM9sgaN5IB1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168535; c=relaxed/simple;
	bh=Q1PsgtMA+I3Pe0Hr6XqziPGeccF4AlHt2HLLuWMgILU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxhf8NBahe2WrB7U6dGDYFTinGFeDM5LMjaeQr3DQ6uml+XE/Cj5r7i33ze7M31z+QR26oBYj7psQnw2ItvIWB97GdAKjBbAx0FBeXC2zF9I1ucTOWmTf5/8msnCS9PLw65FhmGNhJlYVg2rjvslgoWtG8ZQ1s09GR3gfGZA4vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCGaCUu4; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCGaCUu4"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66077f6c438so6939291d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 02:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781168532; cv=none;
        d=google.com; s=arc-20240605;
        b=Tcrr1XFpkP85Ap/7ujl8TP5rpLG2CcXuAhg/pDs2eH2o3MfsPCbD/thcPuAHl0Gtn1
         b5P6FDpulslzYpAf4kK/iLuUO4QpHPnXWZ6MqqkE9MycfDVWM+55HhJ6iJiUrJaS9eOZ
         DM99yXn05BbyGA3EGiDqZ2KfeH+XPlwc+k7CZSFtyx6rGgPQUmiypyCEF+GN2D4UMHPg
         CqMSAFyjnHxiyGUCiieTNdFqyZjvwM5ve4yPXVvv73f5GG1iO/1usPnJRGXx7zij11jY
         SEcl5csYbSESDI3UeAnWde9e3mLENDbqMCGXZLm3UQjeMc2yNe32KgFH/SvownI0tyY2
         9eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jwgGnyW8OZXRqBLUH9knN6tol2cVMvAKSmD8wOWynoc=;
        fh=c8mtdL7XfSbAYlA+7G1wWTQRhZFJlfixmqO41vs4fLc=;
        b=itq0MuClZW3k0lO4HxjenNcC9xvOsPCMbeLu2TqORtlPobi8/NWvDiHvIM27u2gOq+
         idi/rfANXSy2Wa9kFCGB0fTiqwcei8b+Dh+nQB+rQmx181cLA8gcbjuAhmTw2XKIfImN
         9F9xYWcNdV0qyd66Oe20tcQ1ZUe3PSnPRShhWdjF7PVU0oEl+WVyJnvZ9sBTZZ32/5C1
         bOBJuaC1XBwtE0w3W23X9KdTqX6Nbpkio8CACainGogq5MoiRdQAoF2motY7DUbsnBj5
         oHkN+kr23rZAaIcyfnM0WM3/aI0pSEwSwz3iPAKLD/2b6N/4DfgvMiWI6D2WmIobW12v
         tuJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168532; x=1781773332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwgGnyW8OZXRqBLUH9knN6tol2cVMvAKSmD8wOWynoc=;
        b=OCGaCUu4Ub0Iozx6xOL6F/dl3Eg1b7rpzo1ZDasQvD+ZQWkggaxZmg7Y5/hW52hOFs
         Lg01MkAvSugVoGBJvm3NRDnoBUWyd+NPkr3GezdgT/r723iGQTLJ0KB8gxRI6T3lRDiX
         ZNXC9FJiyeXUDQ7+KQ6XRJWC864Vp7NfmwpT6lrGwBh1YPuWNDkjHY0jC7fdneq2480N
         4hkjCJGIu9gQiIKkTfO4bOWqRcOl4hDAXd4r5ePG6WXzRLXEwhTPrlkeWVNiUIyTQWxc
         oiMkH0oJiK+JRBIHuvR2r2mZMNbs+Z5wmol1CmTqlCvnUZsUPmORm8aX6l5UCUHO8S65
         MBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168532; x=1781773332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwgGnyW8OZXRqBLUH9knN6tol2cVMvAKSmD8wOWynoc=;
        b=cAi9kpQM2qXYr2CyLj52L3fXYLx0PInu4ah0blodMUOgPr/xauGV2dCJt6FXHRfpCo
         kpwcFaZ3cW+9aIqFgcG09zer4A7bqe8K1YNule/AuZFljjaCs7MN8VgTYhCzgC2a62YP
         4CaStoR7pMZKHaa04/N7DXn3D9zS1TTnaDqSyJVgqFq5C5XbyOGddZBd6sR2FXCynwA9
         itkkRREcos15Yqc1GV7lOGhHUN3qRTUI52G4mjynPH1MNuAc61hSccbd4b1QJa+5i7J5
         9lmx1DuKHo+Lo8Cc/1dbwY+zJZvgXWMB/nwrZAI8RJ+2N7/LsZWCeM4mIENlWRX2PNLZ
         ol0A==
X-Forwarded-Encrypted: i=1; AFNElJ8ApB379gdcVL91W57NRLaXZcD+h2cL8O/L7s+ues6bhgXIcIjEEfYblPu73aqqJ2ccuO/TsZBOOatDkNWK7RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQSJ6S6nxiYlId0dFSRdS4h8hmHe5byRVrDlLybUWCfdrOAYS
	m+SwEqR46yvSQDKSlh/n/biXjL9gZkIRXQmymOjZLVIKDlLXp1jE3iF6Ec2OprhddZ2fKWhNpX4
	Gv8hyswcgWjU8xeagXxHt9tnnxV8cYW0=
X-Gm-Gg: Acq92OHXXVDB3cfIM9/K7S8n8T/LPcZGG89ra7s3GBRoP2yV0VOtI41+Ic447CDJOrh
	eD2BvZzbyAC/1etT4UzaIqX0clNurJXqhL9B9n/ZmYWNzWegvmxMz82k/MofFvwuWozTA9PgBAc
	u+pv8WCtCChUYx8Wmq4IAE/IatS6FvSgnqxlKVQYl6PPWkNZvedwYN5KHRje6csgxjAfzmnTVp1
	yeZDbVCcp6JVwmwmKRwo6aKKaA5hwVTE+GCp6gm9CONhk/0T4elMt86kZWlvn/FPwmcwFun279i
	G1YN88O6JX7P9FxmZCu4DkHgnohZhu1s4fakZriYbZf3FKpjuKTbqU+ciSNmwVYeAtO0mg==
X-Received: by 2002:a05:690e:1289:b0:65e:40ef:dc8f with SMTP id
 956f58d0204a3-662699d47e2mr1333630d50.51.1781168532418; Thu, 11 Jun 2026
 02:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611080850.536996-1-sun.jian.kdev@gmail.com>
 <20260611080850.536996-2-sun.jian.kdev@gmail.com> <87se6t8ono.fsf@toke.dk>
In-Reply-To: <87se6t8ono.fsf@toke.dk>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 11 Jun 2026 17:02:01 +0800
X-Gm-Features: AVVi8Cf37KuwlUK8Z0rVVPD6yzLkCu6ujOmcxJpQ3mVeHP2o2QssOHKpn8udIUs
Message-ID: <CABFUUZHMomSb0_goXcWvamVhuRCrft-L18UgJ2TowEXiptsQqw@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Run generic devmap egress prog on private skb
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, davem@davemloft.net, kuba@kernel.org, 
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me, shuah@kernel.org, 
	jiayuan.chen@linux.dev, menglong.dong@linux.dev, emil@etsalapatis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:30=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Sun Jian <sun.jian.kdev@gmail.com> writes:
>
> > Generic XDP devmap multi redirect uses skb_clone() for intermediate
> > destinations and sends the last destination with the original skb. This
> > can leave multiple destinations sharing the same packet data.
> >
> > This becomes visible after generic devmap egress-program support was
> > added: a devmap egress program may mutate packet data, and another
> > destination sharing the same data can observe that mutation.
> >
> > Native XDP broadcast redirect does not have this issue because
> > xdpf_clone() copies the frame data for each destination. Generic XDP
> > should provide the same per-destination isolation before running a
> > devmap egress program.
> >
> > Fix this by making cloned skbs private before running the generic devma=
p
> > egress program. Use skb_copy() instead of skb_unshare() so allocation
> > failure does not consume the skb and the existing caller error paths ke=
ep
> > their ownership semantics.
> >
> > Fixes: 2ea5eabaf04a ("bpf: devmap: Implement devmap prog execution for =
generic XDP")
> > Suggested-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> >  kernel/bpf/devmap.c | 41 +++++++++++++++++++++++++++++++----------
> >  1 file changed, 31 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> > index cc0a43ebab6b..a3d6c60dbddb 100644
> > --- a/kernel/bpf/devmap.c
> > +++ b/kernel/bpf/devmap.c
> > @@ -512,35 +512,52 @@ static inline int __xdp_enqueue(struct net_device=
 *dev, struct xdp_frame *xdpf,
> >       return 0;
> >  }
> >
> > -static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dt=
ab_netdev *dst)
> > +static int dev_map_bpf_prog_run_skb(struct sk_buff **pskb,
> > +                                 struct bpf_dtab_netdev *dst,
> > +                                 u32 *act)
> >  {
> > +     struct sk_buff *skb =3D *pskb;
> >       struct xdp_txq_info txq =3D { .dev =3D dst->dev };
> >       struct xdp_buff xdp;
> > -     u32 act;
> >
> > -     if (!dst->xdp_prog)
> > -             return XDP_PASS;
> > +     if (!dst->xdp_prog) {
> > +             *act =3D XDP_PASS;
> > +             return 0;
> > +     }
> > +
> > +     if (skb_cloned(skb)) {
> > +             struct sk_buff *nskb;
> > +
> > +             nskb =3D skb_copy(skb, GFP_ATOMIC);
> > +             if (!nskb)
> > +                     return -ENOMEM;
> > +
> > +             nskb->mac_len =3D skb->mac_len;
> > +             consume_skb(skb);
> > +             skb =3D nskb;
> > +             *pskb =3D nskb;
> > +     }
>
> So with all this pointer soup and back and forth, the version you had in
> v2 (with the check and skb_copy() in dev_map_generic_redirect()) was
> much cleaner :/
>
> -Toke
>
Hi Toke,

Thanks, that makes sense. I agree that v4 made the helper interface less
clean.

I'll wait for more feedback before respinning.

Sun Jian
