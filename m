Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739226;
	b=L/hfcn99NcGCMbL6imJg8XDr5gGF+dgX1fnyFootwuWUnRWYkIM4CIvi+nI1ijI78bHE
	 HxjEC/pByjNsNbyWDldLGaFLuWkZCncbnx9RTltZc3rFz6knYdJOHGVMVZFzzhNoDM/yU
	 2tqN8Rhn/ubxQbW3bp0lTgt33bGyRz0PdtBw31mHpfvfCPnhpYzI2N6SICqbMAtu+vBqH
	 AIeXke5v/TsaaQ+qpnkWs96b0F3Tl91bsIu7N0cjLKaPyCha2smZ44+GocWiWi/eoRSdo
	 mQ4y0qD2Ysv7u8HxZnG+pD7FrYbt6NvdI3aUzrW1VrMvrx929GuiIixOeHSTOTuX7oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HU0IDlTEWZ/Nq80LY/Y8bonUl8UVtmzIsUjZigKckck=;
	b=Gw4qMx/8C5Rvle0KdYiWXr9BVH7sRb1eC2ZwCefCQFVMRxEGTJqZhEZbznHU8x4Onahc
	 kAyRn41DCRJVX411nC1z64jm6PAjoEWqercpmraLtVa4gZ5nRMa179GLE+oWH2yYxRNxm
	 Q9khjBa1TJbeT2ekmvPGitlCTwvs0GBYR04HLMwpxqOaMrdkEfCJe1o93MU64aKCpezMP
	 HS8TFFVrl+kyNcoEBmqZEFNf7YAfbUP075y+arx1uLg5vBLtWamUWeHWBgxTpem31hTz9
	 J+YhQSwuTS6S2XIrxnqTM3yxesNciUQbIXmRst9VUsN16nueU6uMMJulRxPMtRMJwsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=auyMeNme;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081A606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9081A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=auyMeNme
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49e08af5fd4so47394fac.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:53:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793739224; cv=none;
        d=google.com; s=arc-20260327;
        b=aMqvAj77jbtD0rAOeRQW+e9dMrz1BQjgY5BHGoJGxAB/67NCy0g1zny+CsPRt9desQ
         hDXof6wEOFTNDbIk4nWkQA34Nq7sgJxNwmDugnBZajLtFC/rqiuvbsG3oo9EelBbuqk4
         Dm2V02MY/Mt+B1zE1dxhDgjRVp/RqrnC6sAx36dbuDJqIVhmjbAixwhUFY25kuE/4YG5
         qYSfHiJCxZl0lexzF7dunrLIk+LZkS25kaOeNCsl6yo8Hu+lqeFBvecT1Vbor7x/Q7sF
         ECNbXrBzNzDDd6Zogi5RCLEORz2TkBC4Fv3siFnmf86yC3g4lEAZUSFEqvX14rncSt2b
         d7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HU0IDlTEWZ/Nq80LY/Y8bonUl8UVtmzIsUjZigKckck=;
        fh=R2kXQiZqCGYpI7icE3x3cfGfeupjOyqolGORpH674gA=;
        b=O0wnKywoTk4tDcFsF3LBXvGMejy5Aa4DapszcsIUuzkZp9gSFYiKsIAV6RSBc5m+4C
         5oiMIOP9yIsCJOUbzKDPJQS8vbxizRWWIIrAoCudRTttjtkrrnm569GdTg2JMor4a93A
         ksa5YXJDZJNvHQomf/+mhoXygppUdvQ7jyLWxo62dq/PUvlUi1w87TGRcOK+poczhl4L
         hCxyUxGN8Zo1EL0V0SDLH0eNiEsbMwdhzqZReq1vB4m0jYahfvlRXTVFOaG3ORp1t/ZB
         angx0Nc9LahVz9WdKpAFi07a37VZmp1r+ZxoRRSr8An3x20PDzkz745YE+aIh/He27LS
         pD3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793739224; x=1794344024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HU0IDlTEWZ/Nq80LY/Y8bonUl8UVtmzIsUjZigKckck=;
        b=auyMeNme4/2d01zzCWqyBDt/BzGNmz1TB0h3Ud+kIp+iV12/l8l+8oSCKuUj676PVq
         aBVugEhproylVMbxZ7jqq9EoEq0DaylN3bZe83HxC63yinS4CVEx+Fl497C9Hk9Feu5V
         X7YX0LQsolMtep+IVhOVyBefbxcZQDq3tAga2gRse5wioCQHAteEB2xjOC0Swqmbbq1u
         7vakZI0vFXnqKTQHHcfgr9Khsq03VzDmMwUASgXd2/k1nJSUEAGbYp4ac+KsSb6xsEvo
         GL46Z3ltFuZJbQj7hXahyilz5WzR2KwydmZJHQnpDiPtwSX1ANt31TnNEbJVh3nSc95B
         +ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739224; x=1794344024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HU0IDlTEWZ/Nq80LY/Y8bonUl8UVtmzIsUjZigKckck=;
        b=Y5Mde9QQG42wKuCN8tF6vrViY6jAAgHOQsi3S0Vsk0xpxbPpdGtOZMyFNXdI21M/oZ
         D54w+EoFgM/pC/oZEGt8lJ+OJt9NfeVkIQmXdnXv7NBsYbvr1UfabQgnnhIhfzuuTU9B
         tRGK4+s6+0VHxqyU2seIiw/FfKvFpU+Tq1gkN3Y4LRplhpIOtPxBrB1SNaecmldJN/5B
         fvx9Nf2/bd6jB6+L1a9hH8/9nPkQOKEF/BPpuHoFq50khQyHr+3iuyAkMI1pTHNwFWy/
         nEmqFjMV9MAPcKFCvTvyO2Uikq3VTsEuR4ishI/de/6svliWxTgvZ55tR5gQNOh9l7Ec
         3hxw==
X-Forwarded-Encrypted: i=1; AKwUvBz0aZhkThnH5K214FMw5SLGrg3bSNyHTUjEP7nVbojQda9h9VFWVszXwxaLzVxgHUtNI4i9QthU4LsdICFXDPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oz+3aIHR/IdI7v5zUmvTz+SKBH3JCe1huVBXLtNoNbkPsLxCi
	0AaOW02UbMGJ1w6D6mDsWWBAuqwgdnTOEnpzVlvr/6RmO12oZwinQnaOAGZEos3zBxQ3w3ytjVx
	gPEfA6oFbn29RLP1TvhGltkAGVqfyl4918ZyYfaHE5A==
X-Gm-Gg: AYBFou24N+xw1GxGeYBWWpo1JBsA1q06hkg4NnQzMIjSsh/9ddqIbiNK8yE6vNeuvHE
	QcihPi8qZg+U5/Ppw8zDzbsYbd3H/s2Fl24ks1lDP7vQzBu/GMlsE5kouy3HkaJFuX4c9t/Uqo6
	ST5nVj/in0leN22ppMQdfP3GaoBrThMWJvTmCYTUt4KUiyUzr8+mDbrHYgCae0bUtNzpkUq1G4K
	bPfsnG3MTJJNzLxpqfah/+UVfmmg0aBWeEuP+LRfFOejo08/rK7yggJT3eVx6xy9XK5RfEk4OUE
	vzL0loZDmzuB2wHoIKKdrUUFA1EY2/XAkNPX2+JXo5XViugYWKGmpwGWLGUH80rOk4lOzp6ZOc8
	GAmpttAfXYT5lnZmVXDqS3qwkXtccPlyaJuQr/6oGBadEiQNSGhUEcEtqYk88ogowWizQ28Ljq8
	0SqxiLjeTZAnDkATBeHfBwZxzo6WqwZ0k=
X-Received: by 2002:a05:6870:208:b0:497:4b0a:61f5 with SMTP id
 586e51a60fabf-4a90777511dmr8964664fac.43.1793739224442; Tue, 03 Nov 2026
 12:53:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103200036.65764-2-tianyi@cloudflare.com> <179373626776.488859.10701424242617832815@kernel.org>
In-Reply-To: <179373626776.488859.10701424242617832815@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Tue, 3 Nov 2026 20:53:33 +0000
X-Gm-Features: AclHuK_asYprUqDKWj4NTjMpDW40oUsEV9HAiqmCbg-4s8sP4_dIHmt3NG3pWyI
Message-ID: <CAG4wq-c32sQ2NiFj=9XVXuc5Eqa+5zHvTKcGRQ3ugAdXWnE9sQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] net: fix mac_len of skbs copied by generic XDP
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Toke Hoiland-Jorgensen <toke@redhat.com>, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I hit this while benchmarking generic XDP with an xdp.frags program
that redirects to a cpumap. TCP throughput dropped to almost zero.

Cheers,
Tianyi

On Tue, Nov 3, 2026 at 8:04=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.



--=20
Cheers,
Tianyi
