Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793453540;
	b=k5O3wH6s/lZCuej7OjVkkc0GNEbLfGzWhOiKrykChfVNLBlIHklTQthDC62jrBQQczD7
	 RqCcCpyg0AYlMKWUuSUI9fv+cMVppoMfQ9zYkmfssf4+CdcHAymfeRW/PhOdWC3csJvyu
	 frngb8fg4RN+g6LlSvboiocbmvGjjEil4sCssTuMK04svsWLn0X13d4ZWAIVPWjPnI3Ai
	 SDq3STt4E+/LNUZWTvL5EhH2EIKWDZ44WK6J24sW0J41tVJUmyCGygO4tdGOuCVaBX6Bw
	 wO4IoNre9YTtF2J+ZKlfe0IYCInvuSQEE7bePtmEzyqFiYIC83hJdqUEQYaEb9eilnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QrhJINBYjJTT5louKFAwSUTUsf/5n1vYlK1qTtlzMCY=;
	b=EQ2d/bJfaAo0Vvegwtwnj3+yZKHCYKuFRmWETgwvBGzCcVFkgwInktp4Pic21w4glL65
	 QSxy/r+KjG8V5l6Nhd0Jop/M1gOJI7S4jr9Y5tFZ9xlo/Bxxdc674B236J+ytOrRZIRbk
	 j7IPDNdFKFt+uKy5zwdwpRfHMW1DTX6G1M5dAVTZ2g6GxrsRGFrU1uO9V+QSNrM8Yvpri
	 z4WMQxaTRLTvHFQIttFmw7JmoO18Z49FN8TfqAS0PekrGAHgdSbLBHm76kHWMl1SWzrZr
	 cBxwqSd09XTVGiWHjnii203OWgjflldQa+xCs8FkT5Ds2kodOjSkvvMe9TYBMV8TARw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=XKnOjMRP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AD606A31E
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 13:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=XKnOjMRP
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso604007b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 06:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793453538; cv=none;
        d=google.com; s=arc-20260327;
        b=M/H2G49P9LN0JHtqPSaX44vXJ1CsdZvoxtwMfB9g8JlbyqN8TjtTgtWNlHw6qgMgiC
         fXhyS2+7JEkQKXCZvA+qVX6tp5JV6GMWHcatYgsvye7+3vbnlIq+jpfg8zPFm9hYQViE
         q+mZPDW2/xWcGpv1Jnqo8F2kT8b4ZFc5GpwlIuLrx16yOZogg1VD5aaEFI4Ik8b3lj0/
         fwsSD4IqGJ5gE4FeabH4uWlJtaZtZP/rz3vjag5/AJqiOubPWO9NgBiQlAGYTg5tidSY
         4c+NIlUmgetnM/rUpi+uVHhxN+4YJBV+qcjBKgAHI7CLfQKPTTnZUHe/81fH3kcXODNS
         FfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrhJINBYjJTT5louKFAwSUTUsf/5n1vYlK1qTtlzMCY=;
        fh=84o+MRmw+H2sCshEk/laUvAF5ySVkpmthlHI1znJdlk=;
        b=LwwDbwhoK0b9rlFZ0EvtnChPadZMtzD0RGqodLwOumF54RlUCcRGD5y/6XCpQeHijA
         lIypes/i/qZmQAe05wusUP4BleTZv/7D6aqlI/18TofIHelgHDrG2RgmIqR+EPgKffBz
         KY04TpfuVp5y3xDmyC8jR2MscuYvJyeZ3j6Ou0P6yCQHKtpVszMLVGYIEQctRjkRW4ri
         ZQtSiPABHNOG7Ate46O5gmA0gJ3cZXXCEMmsDnmsBIfqKjOMKeGYOl+iOHMlFAfc4qCK
         k+3VwtssPNuUp4ubziDwHb82RZoCZ7ytai6e0kxcxRVqT17lWTlJE2iIa/zS8778mzBI
         BbJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793453538; x=1794058338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrhJINBYjJTT5louKFAwSUTUsf/5n1vYlK1qTtlzMCY=;
        b=XKnOjMRPi1xowFEnisIR1z4LU2wkmPn460uIbnYFo262VHWeQFoTh/HoQdkw60dc1a
         1zdDrd+OqzuW41lm62mCj7dcoHFjgW2MOlHyj83i9lgrOZCcxL6XKUo55Ov0N0HUDQ5d
         EdoSbP9yfU2qWOluiS20Xn3hWPcx7/ZppJ26A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453538; x=1794058338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrhJINBYjJTT5louKFAwSUTUsf/5n1vYlK1qTtlzMCY=;
        b=Ly0628UnUNtdsHBMoL/DG965Zkw7WBzqNDOvO9azlG0KQrK3nD9GTNIlBwa+i9cb6x
         XHE12uWptQelTerHeIFv/EEYu57UMjAY/gzBGrCi665g3XzlNykO4WcckDtJ4vPwtS1p
         cpaL/1i8hBzY8ilZQXX+v6MRUTLP/gZTEU0DdvJenEdD7+/rJe0xj2KeLZyoD2wMLFo1
         ReTtmM/HvcJJDJuVocDVAFg+mGknkX0b3MTOImCe7B2d+iG7ojMGB9DmjV4SkKx5vaMB
         7NUNxOTEDYglsJVSANXggrddYGl0NrVifW4TINPu/tMHZeb0mS4MopWOTpsYgN5kxQXI
         dZpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnPynIG3WLUmjnrogf30owGZuIrzK1k73pCQX1THTH2dJbcHcVSROqVA6W1/R/xWtANvVsek5YrfsEetTrsJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKanuKoRlWZJb7Jpo9OmahN8BIjzNOWhleWAZerrV66Vt3u/PUl
	2U1ekXncOYCFaFN3tgy873vNpurSLptex0KO3io3e8E50E3Kb0XuqfFKxJ36OOWD30Yda/0exBt
	RauvGlk80PWJFhlcaZKJ/Coru1w3j8KycfvWYFOL0
X-Gm-Gg: AYBFou2LcPPO4BG8aHGUkf9rgDBOYdXd0AzRB6eAwK6+Oy5JOndmzHZZLgAbJnDYGSu
	CQbvGRUTL76KW2/UP95MWxGzQDE/SjGXDO1dOPpBlkkK0zmaJJNVjngIFrmauyqZQfRHyN+dmMd
	Z47ecVZprrKzxEbQ5tyhONuFvORV65lcepqkvrGuCedN41n3wWJf4FtcOAvwobLmpPaBC1LH2ip
	cHn9/VU5tjveGhD5YFHIEEfXWeF5I3PX+Rtfob5gHtVPT6S1tdiRXZAoEyoLzuicgEI3QH1Cq70
	vhV/MVwcEsBn21hCleL3T8wtjJxS95V0Jo+aQ2V+MdJ/g5lVyk3Ueve+qFsKThEAKsKvLNYICAe
	cM9c3DVf0Sm91t3b7OP+wZaAFSLHUBlaQurWxmDhxDWN/aEs+M0Wxw1EabD5A2p5hLbwSd3HdfA
	CYVp1kFpJAuwg7xHE=
X-Received: by 2002:a05:6a00:4b12:b0:89e:fc56:a25e with SMTP id
 d2e1a72fcca58-8a9bfa02bd4mr4056675b3a.41.1793453538349; Sat, 31 Oct 2026
 06:32:18 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bpf_redirect_neigh_short_linear.v2.r0.20261028080316-1@mojatatu.com>
 <DMII4JGTEUEG.2WRJPT6ODT6J0@gmail.com>
In-Reply-To: <DMII4JGTEUEG.2WRJPT6ODT6J0@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 31 Oct 2026 09:32:06 -0400
X-Gm-Features: AclHuK-ddqUaxwQGu_QsdsX_5VreQz3XrjlPaOLjbuJHGuyWX_YBYrjskp5eDDg
Message-ID: <CAM0EoMn7kvsfZbsOdU3jHiT1Ypc6OHHu_+empy=Fmu33Etfhug@mail.gmail.com>
Subject: Re: [PATCH net v2] bpf: Fix skb_pull() BUG in __bpf_redirect_neigh()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, bpf@vger.kernel.org, 
	bot+bpf-ci@kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	David Ahern <dsahern@gmail.com>, Martin KaFai Lau <kafai@fb.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>, linux-kselftest@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:47=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 02:36 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > Add egress coverage to tc_redirect_neigh: the existing test only attach=
es
> > redirect_neigh at ingress, where mac_len is populated.
>
> This test cannot hit the BUG.

It was reachable _before_ the fix, normally useful to include such tests.
I will drop it, but if you think it is still useful and you catch me
before i send v3 i can include it (or can be sent afterwards).


> Just drop it and respin as [PATCH bpf v3].
>

Will do a v3 sometimes today for below...

cheers,
jamal
> >  static int __bpf_redirect_neigh(struct sk_buff *skb, struct net_device=
 *dev,
> >                               struct bpf_nh_params *nh)
> >  {
> > -     struct ethhdr *ethh =3D eth_hdr(skb);
> > +     struct ethhdr *ethh;
> >
> >       if (unlikely(skb->mac_header >=3D skb->network_header))
> >               goto out;
> > +     if (unlikely(skb_mac_header_len(skb) < ETH_HLEN ||
> > +                  !pskb_may_pull(skb, ETH_HLEN)))
> > +             goto out;
> > +     ethh =3D eth_hdr(skb);
>
> ETH_HLEN is not enough.
> __bpf_redirect_neigh_v4() and __bpf_redirect_neigh_v6() read ip_hdr()
> and ipv6_hdr() right after the pull. Nothing makes these headers linear.
> Take the AF_PACKET frame from the commit log without pop_eth and
> bpf_skb_change_head():
>
>   packet_snd()                     headlen =3D=3D 14, IP header in frags
>   skb_pull(skb, ETH_HLEN)          headlen =3D=3D 0
>   skb_reset_network_header(skb)    network header =3D=3D skb->tail
>   ip4h->daddr, ip4h->saddr         read past skb->tail
>
> The route lookup runs on garbage.
>
> Eric's skb_network_offset() check also covers
> mac_header >=3D network_header. No need for two checks.
>
> Something like this:
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2290,10 +2290,14 @@ static int bpf_out_neigh_v6(struct net *net, stru=
ct sk_buff *skb,
>  static int __bpf_redirect_neigh_v6(struct sk_buff *skb, struct net_devic=
e *dev,
>                                    struct bpf_nh_params *nh)
>  {
> -       const struct ipv6hdr *ip6h =3D ipv6_hdr(skb);
>         struct net *net =3D dev_net(dev);
>         int err, ret =3D NET_XMIT_DROP;
> +       const struct ipv6hdr *ip6h;
> +
> +       if (unlikely(!pskb_may_pull(skb, sizeof(*ip6h))))
> +               goto out_drop;
> +       ip6h =3D ipv6_hdr(skb);
>
>         if (!nh) {
>                 struct dst_entry *dst;
>                 struct flowi6 fl6 =3D {
> @@ -2399,10 +2403,14 @@ static int bpf_out_neigh_v4(struct net *net, stru=
ct sk_buff *skb,
>  static int __bpf_redirect_neigh_v4(struct sk_buff *skb, struct net_devic=
e *dev,
>                                    struct bpf_nh_params *nh)
>  {
> -       const struct iphdr *ip4h =3D ip_hdr(skb);
>         struct net *net =3D dev_net(dev);
>         int err, ret =3D NET_XMIT_DROP;
> +       const struct iphdr *ip4h;
> +
> +       if (unlikely(!pskb_may_pull(skb, sizeof(*ip4h))))
> +               goto out_drop;
> +       ip4h =3D ip_hdr(skb);
>
>         if (!nh) {
>                 struct flowi4 fl4 =3D {
>                         .flowi4_flags =3D FLOWI_FLAG_ANYSRC,
> @@ -2451,15 +2459,14 @@ static int __bpf_redirect_neigh_v4(struct sk_buff=
 *skb, struct net_device *dev,
>  static int __bpf_redirect_neigh(struct sk_buff *skb, struct net_device *=
dev,
>                                 struct bpf_nh_params *nh)
>  {
> -       struct ethhdr *ethh =3D eth_hdr(skb);
> -
> -       if (unlikely(skb->mac_header >=3D skb->network_header))
> +       if (unlikely(skb_network_offset(skb) < ETH_HLEN ||
> +                    !pskb_may_pull(skb, ETH_HLEN)))
>                 goto out;
>         bpf_push_mac_rcsum(skb);
> -       if (is_multicast_ether_addr(ethh->h_dest))
> +       if (is_multicast_ether_addr(eth_hdr(skb)->h_dest))
>                 goto out;
>
> -       skb_pull(skb, sizeof(*ethh));
> +       skb_pull(skb, ETH_HLEN);
>         skb_unset_mac_header(skb);
>         skb_reset_network_header(skb);
>
>
> pw-bot: cr
