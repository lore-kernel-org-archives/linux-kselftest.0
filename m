Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31A3A6406
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953969; cv=pass; b=XBzejpwVRD3yHfIGRuvca7FzuzxxRGJRUqsF5rcISJqtyXxa6JuWAF31JN/SMhHBmsXEuWVQ8A0tEZwD0DWx6eZGC12cd+YdYiqGA00nACzMAouPAHj0ckhWmvhcTxlHgRB7JTG29BacyRjkxfF7bb6kVkCnkMDCqK4fwLCjfv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953969; c=relaxed/simple;
	bh=uf5HZTHJoAXInjP6F/jPwTZEqhmJlXS7G2mQJDPJKIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmfNQVxW0iUzvFG5Srjd9F0miIcYuElYMBxaYhbvEDa+0vkHCNaxPFp9uxQEdG0hMH/dtZYrjnI/152zH8k2XSUrAxkcahMCXSpAYxPIXL3/QGBP8XW1NFoqrpKVX64vr4WKPl29/qciX8VLtHtG24gN+cBMU8gdXBdtNiBGk0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs1lWboY; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs1lWboY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3242501f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 14:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780953966; cv=none;
        d=google.com; s=arc-20240605;
        b=Zf7EopU2o+WcPwO6cjkmnKapsnHvWdHmIf3ogy+BpXS305DZXuQW/+8d1ljOZInY6Q
         EF+EgXgf++75K7MJ2DKYKAoJXSxbaQApKe23zNJe4/O9HaJHZGVD4I+DI3RVWagmQ7Q7
         TJAarAzeGkFTiGKBHCjZv9nzGoD7r5da3CCCTP8dXCQg03hGXHNWZoglFBWZVCaUy2Jy
         vYKNP9BZECRFJk5HDpz+zigDvRQXBsYn/EIy6z7l+xQ1MBqByO/34AIrMa4GCPPRPN/g
         4fC88SWMURLIKzP8twKaLZVZ/5jqOaMgp7Q0YK0BAIUYXp7aHbA8/7uIOaEG2GosP98q
         mxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbOXCSw4UW03CiAnUGJEGMnbivoK/CLI2jGJHgllnPI=;
        fh=599xUVmZkavgJfVolNnp4iV/U9cWEwCBsKWyTa5z/ao=;
        b=fGaf4PdxhrUB93fD30h1CK7mvtDpzHIRNIvIJgkgHtRQNslz/TlqNkDjQs+BWyJSeI
         Qsd+7YY2tTnuqwH3dtXrfCKNHDd5DURs2BII8RhqF+8wjEHT+uRNC/aT7DqpVjPonQsB
         wYvZHfyNnBcTMlZ2klvFFw46Ds8XPljaZ7MsYLD5lLzNT+C7AjNotZV7rleLV4H6rKZb
         C6T0RjYhci5mJzXU3xuuCWSnELYuJq+6gsI/QQRAKpTnt0N2m7HFMsx6BzyWlp+3VN4x
         rNpmoI41nx8sIxmbWrMTExV8hWQuYz9Hh9h9r3u6f+mxIvBh30ToYOuIGaqKj1bTmJOF
         yr9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953966; x=1781558766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbOXCSw4UW03CiAnUGJEGMnbivoK/CLI2jGJHgllnPI=;
        b=Fs1lWboYpHyPc0zTxwQpATFDS1TinajwLgIiUffWox8eqbd2QrjpOMnpADipxnDdUE
         adeXpbwH6QBzGeN7YrZefeJW1rFRdHbXh9efhtlQZvn+kNi7vLe35plR0BsxeXDk/R3i
         bf5PMgGrZMmkt8h6wOTcgdYR+4D875AswUHBqia5yNFTuvgMQ+pP9Jsr61IuOufJLV2I
         dXm6VetciYYiByJodoMDm2QHuviWQyOSyHOrXCppQfLaZ+3r1A7L9FAvhiikNDfTW+SD
         fSRN64uq4f72FYkijaLhnhnuZeAARE+w3K3n4VDFVv2SUrBng844Gye1g4tKESHmEIJa
         BGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953966; x=1781558766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bbOXCSw4UW03CiAnUGJEGMnbivoK/CLI2jGJHgllnPI=;
        b=qfWsL/bUPd0TpEPLLq0q84J2Y30hy+oM3XqeYBIEF61XKtEh14Cqb2QEWCE4nBZnrS
         gK5ycYc2AeiNRWNpX4BBmozS3v/rnlwzqgaewT06NUlIw06UBORlkaZVF7QYTTgo3OQl
         wh7P/XVN8P7sOnrm5jgaw8bgHT5Dek3qLPRaXm1ecsE8afxBUMVwOYbuvMDLYYSAcAv4
         eDuaotGA1IT0cxtV+1x/4/di3XtkOEJ/skAjT781QdK8idTfT6iPisCYI9Oks0tmT5R6
         US4ZRwS/igG7Xw58Z6l/F6pwRVW4WD1Dct0vFDx4/vLUh7TdzCtyJWH+Nb5SalLLomWt
         hB9A==
X-Forwarded-Encrypted: i=1; AFNElJ8aFr2VssjPpDKLu+FlQkAvQGbVDsOfra5xcO7DV8ucQ74+ZabSihgUUdmCadKT2x5i01aow0lmsR0wrRIPRm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybY6Lqo48R3uM9EwZUvfXL5x9VcGMEqCBFWdnhMGnmkFvbGR07
	7dcpNJZqVEy6/kpN8PyA49nE+OxRzCSnxlGjwfgg3FpSg88DKbwNrhkz/9YMRwbhG8H0JJlO5n3
	JMEuFk0B/GjNx9de/C4RHthCbaMv8mCY=
X-Gm-Gg: Acq92OGWn06inmqbuxdyWby7yca/MWf9TZva3W4+ifuwtPunYuJmGsWbZ4Q2YgdYyQY
	Pk+rJdMjCfHhRw/D1A0DI2sHP6cbNFm6SH3n1GxYBVB+bGLem4Vxgcy4cSwQ+4szWYpDLHRlEmT
	KrwM9jrvCIJhmaoo8hFoajC5zBG3EqFwLp0bG9zH86L95Ug5mYHBYban9ggrefZpqqY9SSYPxpu
	cYSUPCi9bvkXq/0ZcyEQ8AQuDEFx1Sra7ewXq3Po6mAhwakSFPWZVAIZsSEwWG9siUUHuLSI8yb
	FE8MbH28vMy/vEDAtuw0xdG/4Efw/ZI0dSaNbPbrYKYGoy2KQ2XuQJd7AMlcq8xEG/G3iRBxQ5A
	cSB4K5XM8eqPNwvfWoZc2jg149Jf+l+aqZoo=
X-Received: by 2002:a5d:5747:0:b0:45e:f266:f4c4 with SMTP id
 ffacd0b85a97d-4603061efd1mr20310565f8f.29.1780953966314; Mon, 08 Jun 2026
 14:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev> <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com> <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
In-Reply-To: <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 8 Jun 2026 14:25:53 -0700
X-Gm-Features: AVVi8CcgT8ycMVDBgmvoAGA-VFeJoLSpPQAJdB-dJg65JsknvnohoOnZrD5JvOE
Message-ID: <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Kuniyuki Iwashima <kuniyu@google.com>
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

On Mon, Jun 8, 2026 at 1:55=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Mon, Jun 8, 2026 at 1:02=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon Jun 8, 2026 at 10:21 AM PDT, Kuniyuki Iwashima wrote:
> > > On Mon, Jun 8, 2026 at 5:59=E2=80=AFAM Jiayuan Chen <jiayuan.chen@lin=
ux.dev> wrote:
> > >>
> > >> bpf_sk_assign_tcp_reqsk() can assign a TCP reqsk to a non-TCP skb,
> > >> causing a panic when the skb enters the wrong L4 receive path [1].
> > >> An initial attempt tried to fix this in the BPF helper by checking
> > >> iph->protocol, but Sashiko [2] revealed that BPF programs can bypass
> > >> this check via a TOCTOU attack by modifying iph->protocol around the
> > >> call:
> > >>
> > >>     iph->protocol =3D IPPROTO_TCP;
> > >>     bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> > >>     iph->protocol =3D IPPROTO_UDP;
> > >>
> > >> Furthermore, bpf_sk_assign() has had the same class of vulnerability
> > >> since its introduction =E2=80=94 it can assign any socket type to an=
y skb
> > >> without protocol validation.  Since the BPF helper check alone canno=
t
> > >> prevent a malicious BPF program from crashing the kernel, add protoc=
ol
> > >
> > > I'm curious about the BPF maintainers' stance on this kind of "bug"
> > > where admin tries to shoot oneself in the foot.
> > >
> > > I saw Alexei said this recently, and I guess it applies here as well =
?
> > > https://lore.kernel.org/bpf/CAADnVQLh7VEKAtckzz=3DXOVPT8ovpDQshvPPCWH=
DQu2OWQx27_w@mail.gmail.com/
> > >
> > > ---8<---
> > > Not every "bug" needs a fix.
> > > If a malicious bpf user wants to crash the kernel they will
> > > find a way to do so. Especially with agents.
> > > We cannot realistically close all of the holes.
> > > Right now the priority is to fix the issues that normal
> > > users can hit and not bots.
> > > ---8<---
> >
> > In addition to that I have to add that skb_steal_sock() is performance
> > critical path of networking stack. Adding runtime overheard there
> > because bots can find a way to abuse the interfaces is not a good trade=
 off.
> > If there is no simple way to fix it completely on the bpf side
> > then we have to flag this issue as "won't fix" and move on.
>
> I asked if we could fix this in the verifier but it seems difficult. [0]
> Since this is triggered only by BPF misuse, treating it as "won't fix"
> makes more sense to me.
>
> [0]: https://lore.kernel.org/all/202648182730.i4ki.martin.lau@linux.dev/

btw is earlier sashiko TOCTOU concern real?
iph->protocol =3D IPPROTO_TCP;
bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
iph->protocol =3D IPPROTO_UDP;

as far as I can tell past bpf_sk_assign_tcp_reqsk()
the networking stack only looks at skb->protocol,
so modifying iph->protocol will only mess up
things on the wire (if this packet goes out).
