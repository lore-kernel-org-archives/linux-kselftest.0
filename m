Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B42F6577
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920968; cv=pass; b=dXUV0WmyEEHS4uR7057wx+gD4BLH2VZukWlbNOtfQaXWzcFbySORPO7Vn0/4SNgWhx8+DYWITiR03CvLAv3++PbHhtQmcFQ+/X/9kIUC8oMAwHYD2POd2fghCKLI96PqkuYcegOq9hb47y/j0lBikXGExJ7AiLTCv9Pc/UF+O/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920968; c=relaxed/simple;
	bh=Fd6QAcJI16f3MqUm0f9PMci/8jTCJThqTHKrceWrBx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6Fx+ji6sEFY7+oy6Y+LySOMZ8D76ID3udc+CBukCYrLgBnS+0EC8+KpKGC4PgaPTk+W/Bhnt/FZzVpCtWGzuneK2HwP/lOmYXpKvi3V8dIIQBTKfCbK8C6LpNlH7yWxoB7ZBevqU3100lL5FvJFGzY6lj7yQZr+mgrA9J6zseo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZdffUEh; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZdffUEh"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12a71ade78cso6111253c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 18:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774920967; cv=none;
        d=google.com; s=arc-20240605;
        b=RwsKGFXlatk/2O3SZVW4tcenK1eDZfLlj+kkASc0m0Tywg5H3fuadFt81nhKC5gP+R
         thsqzYa7Vf0CuGxKJwdaOIDoeXTxwVhApkhoGWGFfZEy8kfhaFzkETQ/ngUzCcdoELHA
         L4Tr0I/xnwHH9KpuQDaIO0y/j9E+7raQAqA93Kf6g5Qg8rL6jn1NmlbgTKhaTTbcWymE
         Omf5DFth+oEqWW9PiSeqF+SjKSRLPE+eZmDOaE86KkAhltn+14un/k4BbmYWCEXDfQh7
         1GuAoLkWJCuLjuZ0jLL9Ur9C8lNOnrAC0875SlHp2HpKCALvD59/VALFoQZNKQ0xhB8+
         nnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=65uWDB0Qv6BzU+J5GLRhSZeSW/d9SMCtWTbJ9K48rfo=;
        fh=GfYb0rROHnCWrUSbMKu4gq6eopX6L+jXSdKIIoW7CCA=;
        b=he1fVLmtlhK3/xBMkvRKgncCPgcMshLuSDGaCfrSEL4zwUcll15y96kffcWpSWzema
         zHqNCtmAqbvs14mqN53/UuKM+ICNlGPekHSNAj47VW6xRgLL/ccnFF9CLiAcASDpNMNS
         ORRetYmHhunXb6UjxnXz8+eOrO+Eq1rgGRFN7t+M1oCqRw9BNya4ODrRNCm4ikKrqEOj
         Z6CQJm5e5+xYgwIK8q6oNWwD4pmdEFac5pTTiZX77++HqW6ZG6gtzyYAU7mOD2Pse8Z7
         MjIBrqfZlD661mQg6kFvrtXhxDTgHwNDPdXeW6OFckeX4/RVOgwDGC1EpdopsL/JIAKG
         wroQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774920967; x=1775525767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65uWDB0Qv6BzU+J5GLRhSZeSW/d9SMCtWTbJ9K48rfo=;
        b=bZdffUEhwZTj6I+/0BWDtD7Mp6Ve92s6jNMnchowHJCU8Hq1Uq+75AKYcxyQd8/Cja
         HT8G1lYvQ4qq0y7HM5IpNIHiZv2e8/g7NyNXzRYdkB1kC6E3HK3g4CaopapLtfSSzj8f
         dcbhPJsiU6Ejng5l3p+eJxB2sV9tF10WiCcl24T0QWhyySyleAosf1qE3ij3mcGV6VFu
         dt6fD1d1zSCoumt4EkeAG6sIiUhml3HoLPcFxwgWjMwdgQI5VrGJZTLq1R8av85TrrC1
         91sCydZ1uxr+cf4idGzF5z/qntMNHzO581DKRJpjKAPEoGrBtiny94wLyHf0Xd2F1/RU
         PSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774920967; x=1775525767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=65uWDB0Qv6BzU+J5GLRhSZeSW/d9SMCtWTbJ9K48rfo=;
        b=QZknGG3/Fe2mSy3tUL8n8ziqWrsuN1XTAlZfdfEiiOEg5wxkRgrnAr5erO6JUzE+O7
         FP539ZSZd/T22ht46aegKUMP8kOuosJlOLsbNoBBAZSz/IHlBEcDjIwIb4akzyOLp1v4
         qzdUvd30rQlZ1L4KnAJ2LxaC9Xt/SB2Lf1iBGwz0kNDvmCe6b8+kp+PmknOACGP6d1eS
         6gBZZVN2eQRkNf9E0TecIe8FuB6qHIGXU4aH25mbGYdlkfqmAI8C7rBB+KJSyk7k2wHw
         bGrdju8x2xXDItEseGvCNnroGkWh0t+AV4qkAA4YJtYSO86YFXm99Ut175J1BQyemOV3
         ouqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7pWwgQinYOMRiKDawwtGE7aJ7Op3HFTzM96rMY1bwk41k7aprHfiqasHs/VL3fny3C7i5o6u/zaxjGbY0qx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKYkTRsSXbkbwffd43qiuyc0NAQ/s5Ba8WdDNKLpWmV4tu3x3
	gxTB2QdVsr4Lqalac38YP4xTOXD1cv7Y0BheopTbV94M9utHS9JIJKQjfDgQ1f12iUvLOTv4w9b
	M4LBFNq9N4Y1INLFSzuEcXtZiZT4VRwKw8LtmMF8V
X-Gm-Gg: ATEYQzzhX+NfsM14Vs+MCnYN/FLW7Z5Ag3bAdKvMx43jj0jPYVM8+0TyDKjeNuH8OLo
	nE907uEtG98T16JSNzzYUE0q4yLZH0zW1BjNg15oLTMuXhB90Z94/NLxBOJQ6+o7DHzpcJA3BdK
	ftRal68Ij2GYrUY8Pp0dGJEs4yMKL1uhePkSr7ixxPJh0HSb1UTKVnaf5PACY/AZSmlMIw6l67M
	+csqUYZvtj5NQBJs2BQ05OEV8zT2WV6SM1sOEYczi2sfvIHItqHp+lGpzoThnwAbwSflts0P/Lj
	yk9u+P1H8b3P+6PUDnzLjpe9wnq5ROjleldVAkUMEk6ghwOGIFqRuvCMWdvx8c41k+Yj+EeT
X-Received: by 2002:a05:7022:220a:b0:12a:6c4b:9cf0 with SMTP id
 a92af1059eb24-12ab284bbddmr7115803c88.3.1774920966145; Mon, 30 Mar 2026
 18:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330080746.319680-2-jiayuan.chen@linux.dev>
 <6ee24770a2b014219d86839b2243e1b7bad4dc4f520457269d5e8ca2b21c2cb8@mail.kernel.org>
 <d1a739d2-c4ea-4fae-aeaf-f49e75dac0f3@linux.dev>
In-Reply-To: <d1a739d2-c4ea-4fae-aeaf-f49e75dac0f3@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 30 Mar 2026 18:35:55 -0700
X-Gm-Features: AQROBzAoWaoGMz8lgwUE4cc5pzeu3Q6dad4Ef9SHjpneA1fRPQ9yGPYn9pz2kSE
Message-ID: <CAAVpQUD1n7L6LkP32H_Ct71RLNpJ2RQWFc8w08+c8h=U_tDjpQ@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: tcp: Reject non-TCP skb in bpf_sk_assign_tcp_reqsk()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, clm@meta.com, 
	martin.lau@linux.dev, daniel@iogearbox.net, john.fastabend@gmail.com, 
	sdf@fomichev.me, ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, kpsingh@kernel.org, 
	haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 2:26=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 3/30/26 5:00 PM, bot+bpf-ci@kernel.org wrote:
> >> #if IS_BUILTIN(CONFIG_IPV6)
> >>      case htons(ETH_P_IPV6):
> >> +            if (ipv6_hdr(skb)->nexthdr !=3D IPPROTO_TCP)
> >> +                    return -EINVAL;
> >> +
> >>              ops =3D &tcp6_request_sock_ops;
> > For IPv6, ipv6_hdr(skb)->nexthdr gives the type of the header
> > immediately following the base IPv6 header. If extension headers
> > are present (hop-by-hop options, routing, etc.), nexthdr would be
> > the extension header type rather than IPPROTO_TCP, even when the
> > packet is a valid TCP segment.
> >
> > Would it be worth using ipv6_find_hdr() here, similar to
> > bpf_update_srh_state() in the same file, to walk past any extension
> > headers? The IPv4 check above is fine since ip_hdr(skb)->protocol
> > always identifies the transport protocol directly.
> >
> > In practice this is very unlikely to matter since TCP SYN packets
> > with IPv6 extension headers are essentially non-existent, but the
> > check as written would reject them.
> >
> >
> > ---
> > AI reviewed your patch. Please fix the bug or email reply why it's not =
a bug.
> > See:https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READ=
ME.md
> >
> > CI run summary:https://github.com/kernel-patches/bpf/actions/runs/23735=
111188
>
>
> Thanks for the analysis.
>
> There are many places in the kernel that check nexthdr directly without
> walking extension headers.
>
> I'd prefer to keep it simple for now and leave ipv6_find_hdr() as a
> potential future improvement if needed.

+1.

Given this feature is to create a reqsk to process on this running
host, it does not make sense to support such ext options.
