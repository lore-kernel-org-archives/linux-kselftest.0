Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699E39B48E
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954541; cv=pass; b=SUzZz7YqYwYsJ1/5yPeSvtLRVJl4a9eTXt+tqZ4U7uJ5SQXgwryDvXYEwRS0b+Gv9I0m66+hzyKu0Ck8Kk+KMO0v7T4j65GoITYzvz3rDkd7QAU4LpbjAlTxIWycKyTbpfOh867zSjzJBPzY195OavdoZIESq/kxcRMQymdWaF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954541; c=relaxed/simple;
	bh=1A5zKEqAscmhGqROJUPu7ZRqKa1REMrRG6hrstD7bCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKIveQXpenZ4oLlQ3th/yAYYteJI0xSD43xX7HldrPHkqfvn06IMGyh02zd4DAPLOXAgnRSqWlG8EGM/BDzqx7wVF55H1oOBR/vcQeU9nYNI1zhAfPZ7Gha8SMe0EbVxdGycmsEKPqCSATS5moG48DnrhyLe+uBfyIN2JBHARt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uo2OUVbR; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uo2OUVbR"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1382c509485so1581955c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 14:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780954539; cv=none;
        d=google.com; s=arc-20240605;
        b=ki0BJRn4XsEcgGnwPW05ALHFxO2tNRzpkLvrdUjYNunOLDHbbvABSQovUv8BwsAuYw
         Tqe4Wk0M1oX20P43oJ93UXtqmcaLY5Oh7GtN2u34dhcDhq8QlnSAxX+/LrRzNe5SnqwZ
         pujCVjqdjjLbLyJ18aOKsttkwEkwB1X9ptHvwcTpyZ1sxOG8TDyTAhH0JqUxjMKW6Zs4
         QYD/IjIgMdbFQzyjNPjiKgoC9GLutiCEFZvQkk+LKmQeFAhOUfwromfnD+gZRFVjFWln
         vMS2BBvhK0Xr8Ee6hUfdjA68943sJgEW865ZwExh0qDlpvWTcLZzqSYOQzMOpKTOf+yw
         pBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kfEI3p6vfYRJLFYBKXtD1V6ydUrj2yea5C4lNu0JJ2A=;
        fh=zMl6fRObPbhGRAh4VMRSJcas4/6uL03BTGBoi5lPD4Q=;
        b=cRbLI2vks51+YesgcUAJfUq7t0A6C030FxqpSxBpVkoxIv9hvAnWpQmg/DcVc/RMKp
         LAIkZR+wm63u88RNQ+zuLuqCjED9r2IEsqlj6nPEo8am42IY4zD1wwS4UofJkbgIg/86
         +RzVowcoW403lx3J6qp/voETlz1c0leJhVlM3pGjQnE4r2CLKtNzRRavKNAx1vMXjd0O
         Ba+rJXMlM/ppB8v+CX5X3cJLomlm0Ul8EYn4ulb3+WMt2Il4CeQNI8WQnASmDlqv/C2B
         3XzlY0Eetql/diOsXiStkqtfdrc/cugIEhO1wvzAIYDW3O1MYs31tOZWydyq2bPnW6uI
         n5YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780954539; x=1781559339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfEI3p6vfYRJLFYBKXtD1V6ydUrj2yea5C4lNu0JJ2A=;
        b=uo2OUVbRa39U0wC/EJUyZ70AuVfZ4D5qWOO2Jx0vUNXm1mfnhx1yYx3KDRhv/2aYI6
         F+0vATXhlu+ZEenNggghGhACfDSEh4azmVb3o4lWBECZhaDDjqrusmk1ToCFJo1VqK0s
         wnaGRd9/XnEE789JK6TTDah6qKHGr5ApOV1DWp6AJX+cFzmmkN6jLaZ2dFXQXREL8Xmt
         iovp1VAtUmVrZXe69ZZbsSj0jSDFfS9xXcsilB2TlHTQGcOxJIvraR+A3CzU2jxYAEch
         w0rayS+pgRH0M+35kI4+lSsMFlAk7BXYhTqt2Q9drGcOLLjkkzhvIjEQc/ZxXWDl8aMf
         zceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780954539; x=1781559339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kfEI3p6vfYRJLFYBKXtD1V6ydUrj2yea5C4lNu0JJ2A=;
        b=MTzNa0e+cCfBYHoYMO2vb5u6jq/IxEtr0XBeEYvkCrrfOuyK3DqxckvQ0rYxNmnj96
         d/voiFLvOxrGpJd+b9XRnN8FN/cNScjXBAWtSr+g4ifWx6Y5SLePGDEUaW9WszT14G2s
         FSgW+JMz2Tgx1uSlY09Asjw9gDUcDSYLTI+0Vc9ol+t/F6W57+VoqTDMyQkmeBkboJkC
         IYY5YYuL8w1gRmJ5UWQafPryioZdr98pLLMebJeNzEfcQu9VpubNNCY8qmPZtZCeMM/F
         lzgqKeOrGxD9zOaQGGC9PCvFm8RDOFfdriYpvJnowkV6PBEnqbs4H+NccAHc1BpT3clf
         K9fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/E7VtkBkfaLBbB9aK/VhKBf97v7AXLkGiqDGR/aqsjTYRNjb1CNI+b+tAWn/1QqBAzATWwP66tsShUMVQzo7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaiEgtVLLi8me2hSX9azvHsOs9dVdvLfgwn21USBqAUiVIHfz
	x2nL4wK1YHfRllQ1JCS2qe9SBG4PTUBuT49CClOAumb75gPCTu6Kig3iJwgRry+QcKxjElIrsiW
	79cUp/JTr4mAt5onnzqSGPYhEhs6VaTUcXgdHf3Xd
X-Gm-Gg: Acq92OH4gfpHN3J7+62hUo7ob3ALy4GDsL2VTc1SfCNcjFdCGlHcOgHXJdhTdmgu42c
	Fc8Kc4Nw0UaF9Mqu/K0kGgq6lFNhroGKsd6TgoDYdI/Q6elOEJnJr8nQQjZB2H6/5Mj3Wwi3r89
	KOJqZnNg4s/mifTrSA3gOK1tOY/UaPqeGmYdcWz12bpYh0ELz6b6XP+kvhLPtH3YTej1DmXYG2i
	0D3kn5C2lgerrgtrQHi6qKEJKfCIPvOugkbm090L2lFK/+6JXCMcyBgXfeGdhbNQhK0Vls63LCA
	Z5NM0ahT4CBNOGPlQxNr6NdlVm4Q1tRHd8V35QlVMK/NHRAuDEgvyjTsVPVS/jibu5A1pqf2vEo
	kZiy2hycBUHHrEnCXyrRynTP0NNskqq5FfGVBqOPNmiEmEgy6tmlZVu5+9vFL
X-Received: by 2002:a05:7022:503:b0:137:f0d8:4ffe with SMTP id
 a92af1059eb24-13806764206mr8627440c88.36.1780954538395; Mon, 08 Jun 2026
 14:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev> <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com> <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
 <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
In-Reply-To: <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 8 Jun 2026 14:35:26 -0700
X-Gm-Features: AVVi8CfNPnu_11Y9w6rUPwUMj9tXfuWG5h97XU5lB3N-O0DJfMa4Mh5VgPAmWag
Message-ID: <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Joe Stringer <joe@wand.net.nz>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 2:26=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Jun 8, 2026 at 1:55=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
> >
> > On Mon, Jun 8, 2026 at 1:02=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Mon Jun 8, 2026 at 10:21 AM PDT, Kuniyuki Iwashima wrote:
> > > > On Mon, Jun 8, 2026 at 5:59=E2=80=AFAM Jiayuan Chen <jiayuan.chen@l=
inux.dev> wrote:
> > > >>
> > > >> bpf_sk_assign_tcp_reqsk() can assign a TCP reqsk to a non-TCP skb,
> > > >> causing a panic when the skb enters the wrong L4 receive path [1].
> > > >> An initial attempt tried to fix this in the BPF helper by checking
> > > >> iph->protocol, but Sashiko [2] revealed that BPF programs can bypa=
ss
> > > >> this check via a TOCTOU attack by modifying iph->protocol around t=
he
> > > >> call:
> > > >>
> > > >>     iph->protocol =3D IPPROTO_TCP;
> > > >>     bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> > > >>     iph->protocol =3D IPPROTO_UDP;
> > > >>
> > > >> Furthermore, bpf_sk_assign() has had the same class of vulnerabili=
ty
> > > >> since its introduction =E2=80=94 it can assign any socket type to =
any skb
> > > >> without protocol validation.  Since the BPF helper check alone can=
not
> > > >> prevent a malicious BPF program from crashing the kernel, add prot=
ocol
> > > >
> > > > I'm curious about the BPF maintainers' stance on this kind of "bug"
> > > > where admin tries to shoot oneself in the foot.
> > > >
> > > > I saw Alexei said this recently, and I guess it applies here as wel=
l ?
> > > > https://lore.kernel.org/bpf/CAADnVQLh7VEKAtckzz=3DXOVPT8ovpDQshvPPC=
WHDQu2OWQx27_w@mail.gmail.com/
> > > >
> > > > ---8<---
> > > > Not every "bug" needs a fix.
> > > > If a malicious bpf user wants to crash the kernel they will
> > > > find a way to do so. Especially with agents.
> > > > We cannot realistically close all of the holes.
> > > > Right now the priority is to fix the issues that normal
> > > > users can hit and not bots.
> > > > ---8<---
> > >
> > > In addition to that I have to add that skb_steal_sock() is performanc=
e
> > > critical path of networking stack. Adding runtime overheard there
> > > because bots can find a way to abuse the interfaces is not a good tra=
de off.
> > > If there is no simple way to fix it completely on the bpf side
> > > then we have to flag this issue as "won't fix" and move on.
> >
> > I asked if we could fix this in the verifier but it seems difficult. [0=
]
> > Since this is triggered only by BPF misuse, treating it as "won't fix"
> > makes more sense to me.
> >
> > [0]: https://lore.kernel.org/all/202648182730.i4ki.martin.lau@linux.dev=
/
>
> btw is earlier sashiko TOCTOU concern real?

Yes, the selftest in patch 2 should reproduce null-ptr-deref.
(I tested one in a prior version)


> iph->protocol =3D IPPROTO_TCP;
> bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> iph->protocol =3D IPPROTO_UDP;
>
> as far as I can tell past bpf_sk_assign_tcp_reqsk()
> the networking stack only looks at skb->protocol,
> so modifying iph->protocol will only mess up
> things on the wire (if this packet goes out).

ip_rcv_finish_core() uses iph->protocol for early demux
and ip_local_deliver_finish() also uses it for demux.
