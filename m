Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D23A1A21
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952139; cv=pass; b=i+0gJv+/IsQ74lGvsGMa81z6NmROf+UsEdtEPeXeYrgkRzYm5NK6k6GXy1Z2twS91cIW0QwRpdPXGzmlhjoqniXrSZd7aWfBGxz0u2ABziTVt9v/VyUv2kjdqWflvJamBxEXt5RVpsAU+4XoSaUlpO37Thek5G3NSi/FA70CaAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952139; c=relaxed/simple;
	bh=bGtzFFBnoXEhZVNSTDAVHXSCy3yikKw674g7i910kvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie3fnNX8KdB0LmsclquGQRn/rvqBcguNcWSCU9nodBdNXVhVr2sF3ssC60CbGz5D4s7ykSmXPAwrWppxF5YROUcRFBMjJXMsGAnPSVPi9O+kn97Kaxo46f0WM1R4vIAxKiAbW3Le3STQcvo1wflSoncCq0RoLwpvl2XlEKf+V9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2QqLDp9; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2QqLDp9"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1363fe80fe8so6879249c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 13:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780952138; cv=none;
        d=google.com; s=arc-20240605;
        b=EfCcqfRuz59o7oDpeDA/HmIAcNxU4jp7qShfPRR3+7/pamhVQfZr7siTxSrNoy1Djk
         UbhEH8uOc8uAEItlveFuFReocrFU6Q2y99mWpn4ydXCjEw8G+QwjWLCisSL9oJCvE454
         BARZsMV0o7dmeYo1S/0HlGuozqUsovPisIsOvLKqvjjTiII9XLpuQy+64KsCTtqYzPCQ
         bz6VetkRAgvupf05vUv1Lj2pZzy1rbqZ9SuJklgnMl83CmQ20eJ3pwe+P9lOsUG8FBUp
         jZK9GXViUaJ1FGfckRMH6x3jHvAieHScVjCShwx7hZIjlw6kWxrgvtUGF1KADVJ1mP6g
         L7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cj99u35GkuQHW83anj+PxNMaqIiv5iTy7TcOXLK7r+Y=;
        fh=fLDg8OzFP0oBTXumRYa85sAt4PrETyCDA5OLb21BmKs=;
        b=ePDZC5LNm0Vs+MdGheaXeGGl5mcALeF4KVOgSI9ZczGrWyZklp9aF8aQ/Vb7+9Q/Bs
         qZP1hk4/guIvjJ84kqncMonw+nZFN6w7Kb9Us9Wwfy7/YGLrYDvEvls34/6L1w5KO0wr
         9Kerbe/FY5krHubcb10r90sTg0t8vFGip6klQwxWyDb9m/WJdZ5slO0T04tIYteRgfXp
         NcgCozRkYwO1mAE98/qp4+inMJuMvdVk8GSOPoJvj2B1kTIM2c58BqfCQHz/9Jz7pXjP
         Zb2fKbxcLuGdX/+W+67JEgm3FEmKcR1PTtA2rv+hiLPQ32K2GpYVYAp7MDaWhjF+yPI3
         LKhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780952138; x=1781556938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj99u35GkuQHW83anj+PxNMaqIiv5iTy7TcOXLK7r+Y=;
        b=s2QqLDp9XrrWOGmFJ1MKZT1i60QMzpv5ZpxkPwapPijH56t6sLElVNYhpagFn4tHhW
         qDZQ02PjzDY+FtkwsSDmLNFSjnM3hLM/Q287EAJ/T6xU70EjB+MYhib9sP60ho4WKeWF
         eVADLhMM2TrOgM2Th8VfqZ5xmrKaEMH2cLPOY19nhnpBQYL5J3DRZPubvIe8mGArNdsd
         2a8SVRSdzy72XgUTQgv4Hn/sB5nTBC5qrDBjQN5U3rwD6QDeGstnQpZP06RsOK4O4Q0j
         mnryWYSwQ5cuTcw9ZOYYenuHZH9JT2eHlY2lYUlowwWcuTAGb//PRZlpWg/xyzOUmhV3
         1GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780952138; x=1781556938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cj99u35GkuQHW83anj+PxNMaqIiv5iTy7TcOXLK7r+Y=;
        b=U5EttKIxYuUXv316ekPTIgLzNmBwbVlfKqckEfEpXXTbSftt7oTBimePbe0H8bxV/s
         dvU44IICSLBZR7PwQHSED+m3KOtsRjujzXvOiG2mCTB0nnbb2TOiMGAsI79zT6Rco5XW
         mjQX3BCFVJUMt03jpQMMpkF2VLZqFzETtoRy2v39VejgnXHIzxPn1zvX+eVxJRHgWIL0
         dkbXXQfW7oKcS2A78VkeUKYCn4cRYeEGgBrxo8Lk9jRoKZhS53Aadr7Sre+UREF41+eQ
         OPJxse19rDPcNnztkF0O2MJrqdw5drdW9VAuJsmNo1BpoGBDd0KPalxf61wDeP2skfG4
         gUSg==
X-Forwarded-Encrypted: i=1; AFNElJ9Yl9xpUpNnHhde/ydIQUW4HMS1bVZorw7ts6wKG2jn2j8aczqKyI6yzHU9KFTQLOlsfDVn33j0xyicwwJiOus=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMF/er2sO6uvJw37QbKpTAHWIgmfzvw39DXmUQmBiyqgThCYN
	LuCmoHKxNXNQNVNY3h4XVVjl2mcbRx6ElSMobygP/j37EyjBE9zrGjOVXbSXsXyAHYUtxJuPoCF
	fHhFYXFY9iGEutizOGApTU9EvQzBeHgSPpsn10wQY
X-Gm-Gg: Acq92OEYdi8OUqVqzynufC5pStm6ZQalSi8apUMfTZdvY1sA85bTnFdlimKP20zArsx
	DjzJZDL65L16V34rzOAwF0UAbfytvt3YeLeMt3FrFxwag4Uf7h2SwxHqXyQ1RdqfCoLYm0uf2z+
	MhfUwOmVcVSRbmq2u1nsLcES3g6RzMNWOZ168xvKI6Gu7hu9hbx2W/r1+qpJMSERBaGT61Io5Hj
	Z3Ti9bd4foSusFNdgXniESXK+MUgua6pR6SMkWHjDJtW2kTKBGiXMTmSQWp7YMQywjHPA5kni6J
	fZDWgQLB5QbyOxounDi5UGXv+q27rLrpb3KZm7EonzNE/vbighPsiqjoeSnzKFt3BEp4S3veG+T
	6Rw/2hu7I0GnF4I91Ck1fsmnC69bL1LTe6SWcHZyaPg6IwkifZz0J2ZsM5f8JifNPeTXP5Zo=
X-Received: by 2002:a05:7022:fb04:b0:138:51c:c5bf with SMTP id
 a92af1059eb24-138066c6ab3mr8922615c88.15.1780952136864; Mon, 08 Jun 2026
 13:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev> <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com>
In-Reply-To: <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 8 Jun 2026 13:55:25 -0700
X-Gm-Features: AVVi8CfcOCPt_p28nph01Kh8d_ahK1oBr_59XCUgMmWvjwIoHLnnauWUude20WM
Message-ID: <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Joe Stringer <joe@wand.net.nz>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:02=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon Jun 8, 2026 at 10:21 AM PDT, Kuniyuki Iwashima wrote:
> > On Mon, Jun 8, 2026 at 5:59=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux=
.dev> wrote:
> >>
> >> bpf_sk_assign_tcp_reqsk() can assign a TCP reqsk to a non-TCP skb,
> >> causing a panic when the skb enters the wrong L4 receive path [1].
> >> An initial attempt tried to fix this in the BPF helper by checking
> >> iph->protocol, but Sashiko [2] revealed that BPF programs can bypass
> >> this check via a TOCTOU attack by modifying iph->protocol around the
> >> call:
> >>
> >>     iph->protocol =3D IPPROTO_TCP;
> >>     bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> >>     iph->protocol =3D IPPROTO_UDP;
> >>
> >> Furthermore, bpf_sk_assign() has had the same class of vulnerability
> >> since its introduction =E2=80=94 it can assign any socket type to any =
skb
> >> without protocol validation.  Since the BPF helper check alone cannot
> >> prevent a malicious BPF program from crashing the kernel, add protocol
> >
> > I'm curious about the BPF maintainers' stance on this kind of "bug"
> > where admin tries to shoot oneself in the foot.
> >
> > I saw Alexei said this recently, and I guess it applies here as well ?
> > https://lore.kernel.org/bpf/CAADnVQLh7VEKAtckzz=3DXOVPT8ovpDQshvPPCWHDQ=
u2OWQx27_w@mail.gmail.com/
> >
> > ---8<---
> > Not every "bug" needs a fix.
> > If a malicious bpf user wants to crash the kernel they will
> > find a way to do so. Especially with agents.
> > We cannot realistically close all of the holes.
> > Right now the priority is to fix the issues that normal
> > users can hit and not bots.
> > ---8<---
>
> In addition to that I have to add that skb_steal_sock() is performance
> critical path of networking stack. Adding runtime overheard there
> because bots can find a way to abuse the interfaces is not a good trade o=
ff.
> If there is no simple way to fix it completely on the bpf side
> then we have to flag this issue as "won't fix" and move on.

I asked if we could fix this in the verifier but it seems difficult. [0]
Since this is triggered only by BPF misuse, treating it as "won't fix"
makes more sense to me.

[0]: https://lore.kernel.org/all/202648182730.i4ki.martin.lau@linux.dev/

Thanks
