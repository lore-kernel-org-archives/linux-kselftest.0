Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785681;
	b=WIfCP5qyntp6KkzDnYE4OOHKxxGcgsn3CS3B8Q2mmYr98471zAt6yC/Oa0zWiLL19q51
	 7f/4FVF9YvJNn/QZwo5rJ1JNwIjV3kpQy7U6cAuB1Yu7U7OQ/+Muo6JrBtFjf2NC7TmmZ
	 rDwiOSwjqnbV89Nx93u1wzyQwuF1MWtJXWiqKXK/6QPQpEMdKPEUJIm9XnoCEt71JuSuo
	 NDB1ZrvWbxyNgr867qIBeOYiKPJdwEEEMCujyi6AUolBqAbDvohR6uW2PFkHEOmaCk6p+
	 bQoTqRrnHK1llxO410jmrFq56xBrLtIGnRGSHafjgxi/g7ioou2kcLJ3pvEIbieV0dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
	b=W5Qj7myUs+XHW+3WtnLrjq6Otbs+b1v0Dcbu2/AwbNVWxK5rkOnc6ndOkI81NJ2cnlC1
	 BOHY5cdcg+4xQOvH1+qqXEcPoAjc1kKLcVsYEVp2wCkMVn8yJclxlmVvHzEvEpZgH9xWd
	 iv5ccYq5fHMNd/xzQj22Bv12xCDZfJgi3sO854pk/LQQxYJlQdxNPtLX8e4rO/MyahFYF
	 jzE772+GH2K7bAFP5G1YT04CVkVKFdLd9OZnAHkztiG5LVh4hR1BvCkRjlbfbYSYd3RQf
	 sZDYDC/mIxLpvBYcRUZCzhzsbLubmh6Jjnt8KjmK1FdyPYUrzEAKN5CP4WRXIYKf/ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCCE60A2638
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 20:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCCE60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NhRUecM0
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-194d0c31715so2292c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 13:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792785680; cv=none;
        d=google.com; s=arc-20260327;
        b=TEnv4TheFxOEtFtOMkYJZpNIC9BHZRrQ5Z39JGu0+TdizZLrW8cR4ZbQzsqrR+XrRz
         Ne4O2rU7O/85kVVMSyeflNTlj8OAc3vw50xudlSS1fUTv/0KRCn6AQuboFt6DKcV3CSw
         ITlkyK8a7724/C8uNwImmbf8/olvpDJr+Csoo5GGxikmQC7Ckm/0KE1RIoP8DB5GOju/
         SJOb6LWS5Ou0a6IM2v/6UUvY8ttpKlbufgmgRMvCku39qgFg+4Ah3P+yYCUrMCiHF0oY
         M13KEJu5LYKFjNVvH7t0RAHqEnUkFb9vu8ah5TegBK09cGITfAWqRDi5zoAZcupOitB0
         M/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        fh=vvl/QvFEw9lVbwwjup2uVRd2OOVxf2dstThbo/rNOq4=;
        b=cVO5evGp+T4KYzt5kF1gxeNRl6a6nwNLJkni6289TMUZBkyaHYJHpfxdDuc5L7uahy
         wNPteQ9jFHEIPCbP8EnwTPZh1mz4hzTpiioGzX0RDZyniyxn8gb6wplDBfYGSE6b1xrK
         2zCXhz4j7Wlee6gHDAQrz8c3NmdwaUVwM6P5/emyQ1Q6Nxp0KSRSpARu/kZ2cFkWswz8
         /7XERG37rvZah52mG5dUoyVMipJqJ/aDgODiab/dltFSuZ770uLzjC0MU+drXfPnUyAQ
         z73ZQXCnV0Gg5AEvItG6oiWNPKxHpNdDSmjnrkKQnEk1h7hxn7Xo8HAFwLuM8j+0LgvH
         y3Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792785680; x=1793390480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=NhRUecM0MaSyL188/UhVkiKrlBbJzWi/BNVMU7d5YPBuZ4iNj3orcUODsTyxrukgQ0
         sshE9V3b3hpWy4yz5rTLrpU/3T/i7yiZemoOjtjAulVcVzmeu/+uUKXmFKRrbGV8DWhI
         ikhmpS8Z9Mn7sdgQlSNsC0RxuXXxhwIwObzqNeKh07tyr+63U8OQgBmFE4mockOozkgA
         PAdYIBVKieKprNJuM1Pvbqcymrtd+kJp6cXgA8iSY9nDhe9RlfG2ie2TZtH0ORW8F6sT
         xplVtIhXO2sZNExMdYq02R2Ax6WZmI4WYtHnZTJHSjY1I86x9aF4mAg70ShzvwGFSOk3
         yU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785680; x=1793390480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6P232PvLRYTH0fZdfO+3AJcU5WVHpT1tzKpJhoLyzQ=;
        b=lL5mKLbzz2ZOnKQ8GAkl8XCasD0vFTOmYpuwD1N/TgoKwN3ZsxiVq/D3I9Ah4fjrMZ
         rg8GNkNgAJI6aNPdPCeiCP82cGnwVn56pYShiZs7jNg8NnWCAFwyD1Q8GwZmlap6r8mZ
         V8Qo8qfBjVpXaK8FShtXduXOYB+dpmD55hqK81cxkb9ys9v6/SnrHvHi6tqa0ArwVJvR
         pZsIQn2SOem3CnyUI8Uafg1e/QiWdkYMhUv1M7yu7MP3Rei3axKzxvytiXwZbHrmpyrd
         FOzHAVpm7VMRYWGnIVHJ0pzDR7Xd9Vw0F2Zpz66VWkh4OrQV+hPgQ35XzBaCIyP5Y92D
         cT2g==
X-Forwarded-Encrypted: i=1; AKwUvBxX48nbq6XN/x/WxBZrCIFSecXyLxZTLv1+uBw/qf7O6N8XCIPA+Nxo27rJ4l1DHCe1xZi9mzlGKFG00RTSIEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxtkmMmH49EVSf4T2/DnSeYkRE/7CL9+aBe5+HcLkbGw/GtC61
	ANJ+W3+JhA7ArXuUyKEU/yFRwntAOmma+I4ubV28uGPXPabDSAKBeSATPjfgK4vUigoD7DwxIkI
	fNb1ixg6krzFifWsgkP3dYFKkTe3RWoJj0KSjCfOc
X-Gm-Gg: AYBFou2ID1dWexmM2+iJM2YKz+Ud0Tl4AHHeHc0Yrl3ANHTnLJV7mrncl31gvkW7ljm
	CxcjKHLkGR+qi7ru/cD5JXeIiA596qeikULld0YqiyYLTQJ0Qt9bRxg0gj4apIUYFh9Ocpb0ESg
	g8AxoBRdAh7BnOYl9/VmNkgBvtatqTm24FQsw7OE81tAG3q/7QUbvu044qAYeZVTe2XOUIHPO2G
	smCWNCw6qHibOaLLFmnHv2yqxXoP/uT35xd/re+2fQxO7l6GWIJOMgEV6w+hHSfQQF5XzE5V8ye
	xLQ+bB1mWb+mS5NNjLe5JDZNbRmHeghsenvTRknDprO0hcGJDdZsx9ZbIbb192Ww/ZjBKho1Ub/
	9fuWL+BzUfGSthPEOu9aGB+O8QBT5PY+h96Mv
X-Received: by 2002:a05:7022:4587:b0:184:6afb:b26c with SMTP id
 a92af1059eb24-1993fe82542mr15165c88.18.1792785679160; Fri, 23 Oct 2026
 13:01:19 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
 <20261022181911.5d19ff13@kernel.org>
In-Reply-To: <20261022181911.5d19ff13@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 13:01:04 -0700
X-Gm-Features: AclHuK-uP7Gir6yY-QN4sOQ103425f3gALMoJmdo_Tw66r7N7gb2W22rdmAKl0w
Message-ID: <CAHS8izOTLYU=5sfJvpwB57Bp3tJ=xt7Gwws5xCVqABFw4T3WUA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 22 Oct 2026 08:41:43 -0700 Mina Almasry wrote:
> > On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > > On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > > > But on the other hand the test coverage is nice, and maybe one day =
if
> > > > we add enough devmem support in netdevsim we'll be able to fuzz the
> > > > data path or something. Is there a way to get the best of both worl=
ds?
> > > > Like put a comment on top of netdevsim that this is test simulator
> > > > device and any missing functionality and/or bugs in it should be
> > > > medium criticality max or something? Or is it too much trouble and =
I
> > > > should drop the netdevsim support and tests?
> > >
> > > I already strip Fixes tags and apply the patches to net-next.
> > > But it's still a burden. If you're signing up to fix the issues /
> > > review the slop we can try.
> >
> > I'm more than happy to help but I'm not sure what you have
> > specifically in mind. What I was going to do is put a comment/readme
> > in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
> > netdev simulator, used for testing; do not call out missing or
> > incomplete functionality as bugs." And then hope that the LLMs and
> > sashiko pick the directive. If not, I can tell patch submitters to
> > ignore sashiko code review bug findings in netdevsim. Is that
> > sufficient, or do you need something else from me?
>
> No, the fact that it's a test harness only impacts whether fixes
> got to net & stable, not whether bugs need to be fixed.

Ack, I meant like if the bots start to consider missing/incomplete
functionality as 'bugs' when it's actually missing from netdevsim on
purpose because we don't need it for testing.

> I was expecting you to keep an eye on the list and review any fixes
> that come, basically.
>

OK, I'll add netdevsim to my email filters for patches to review and
see how it goes.

--=20
Thanks,
Mina
