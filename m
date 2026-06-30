Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2B1FF7C8
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782780438; cv=pass; b=nktP0Tx7sbwG8QVj04hW77p7MC0zUlFfYNlxBp5C75TUuC14+lLCowvW6mmRKk/BcrCTAR8Lz2SftlJ+7zokGiM+pBuYPKcfWxsHJ4xehaogzfzaYCKFqcDAHPwFrjSrajp3W9WY5LqpkKBn5SVEcdInxrxaQdKBS0R4r80ApSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782780438; c=relaxed/simple;
	bh=VSIZSjyLVSUbgNMmTj7rlDvbYCLAbV38QomywhLV1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYVFvgtaiRxNxnJEX+RstUZl2cdiMnTWCviCTgf49khtzMieHdJJk7r+3XaLXMXhhefn/0DYVIEvaRbsT7kajbIZABeV2NsT4InMdnoTBKSEeu9c/iC3LYnLBmZVjwrgbDeHePleI354vzcjxXZ79YgwInR5BtTM2MOqAUamorU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IF9utlaC; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IF9utlaC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6981fefb9easo2575a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 17:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782780435; cv=none;
        d=google.com; s=arc-20260327;
        b=D/6pHMcgYS5QqdmfLQ+mchI7uf3RX8WY8X053/IQ1mPgveg9L/WK9pVrGGcOnYavhT
         ecOE4+8mL+7J77VTsbJfry0Z9u+T+uY7FG/hhEsblFQsFAv7S9+2CAFMYRXkjVb9Js4I
         U8g5Byn7quMHNSGg8Jcb427ynoMUmMNfHNq7+vZZF0FXdfp/4ijMda9/rOn6/HTG4Lq3
         Qs83TsWYIvUYtIWrYkBQ61YHSmvzGp1P9z96ZJ+2Jysu27XOOgzRBkdVDnUnSUu59I+V
         jmfzXYmJlvsaefKynCOgCqqhEy5bC7FRb4nP+4gnEZSPatCGnYXxpCHZ9ZXXRLmZmzEc
         NMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSIZSjyLVSUbgNMmTj7rlDvbYCLAbV38QomywhLV1Rw=;
        fh=sXwLNKl29FGtnueJjGfTHG2t5QZOKifwdg7oYcC7lj0=;
        b=YtsbW/3oU38pPVP9LHjxTFTIYs1z1XVDmFviz8KWZXzKKREdHAJqawx/g0ZH0PZAEQ
         hzIuHh0y6+0c9AOthykGjYNI+O8CshRQK+feUjhDL97XvWEdeSF4S6/p0yioISwYPzgg
         Ej0jAK/8vvz4cqSCQ6wD8xHXTYFzlbgaKJTp571Myjn6oqKhoTIpbftqoylNbaOPcaWE
         qNNhpoVzpJssBiJKpUOP7IQZZ5iv8ELmFQmLbIF+WSNouskf0wSUF0SZ43oJWJOSgguJ
         rbcEwCJhc5HxbA5BIuuwHU7Fhs2/VBnQ+KK8oMoy5Ma1a+Bou1LhJm9VivkGe5/1Aj05
         iW+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782780435; x=1783385235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSIZSjyLVSUbgNMmTj7rlDvbYCLAbV38QomywhLV1Rw=;
        b=IF9utlaCafmp8o33CXrw8CQxGfmWH1KaO0gqJaT4bnbBTB5fxlmQ1b5/r4N/TvVueI
         6ppPBMRdzvGvpLfDyOOJ9l2kXoYCBAN6l11AJJuABFehnmVESkeb8AIdwfEUkA0CGQlW
         gvEluCslD96fPTNg5zLlMqmYGIjoFJFeavctmbIdsxlvExWK7yAB+pKzS79U7GbQ6M6m
         KmJz04+o4zR56K/AjJM678FCnwrPgXgH7D7yd1PNltrH8my6Q1sLEtv+E7goJDkKQRes
         kFzMXxXxEpQdpEr2qsZ/Z8eN54Pk2PwxPgjnwg57rjJSg85ABT+XvxGRMAilh53szrfa
         GXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782780435; x=1783385235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSIZSjyLVSUbgNMmTj7rlDvbYCLAbV38QomywhLV1Rw=;
        b=Ih788FCzgGi41wJaamdFPkCNEIwMfL2K1SZqE19UmcGrWJvVeJABZJUMnt/6mKe9MT
         XJEHJkMvxPSETBkyJWHNb+OAf6KVe3/csAgt9zH/6edsVjV/GaV4jL7NE6kj+NtqczVg
         Z11GZj9MK7M0G4/6VSXsIfoGWaQwJNozBOtZmWFPZGbpbMp/BPYxjKjYJ0CLBg4+4cuQ
         7fLnkxmd2DxQ5zFK6Kv5WN2NvHt3Lc+FIl4Kkp5HfCC0qY3wgrptH1tml2/VgcxuaQdQ
         rJ4tunCND8vq5+gOpnYjJkIgasXmpbX8mkjWiUr6Ax3nGEWE0cbvB4zneqtPv3MmpqwR
         eY0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsmYSiCsAVpo9PE0xhFwtqkcHcWtgZRUmWPxZuXZxZOjUQl0EvKBKa/KIfYzd1SAJDGE6DkZuNgsJJ0SO0bTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Q4E630mbuqCIXolmYCKwy9fVc9CJ9rvOP6Ik8EvhVzLi+Q6M
	9wNT0FVjKLmR1muWGcBVmYPdCF1nJNoISTy7Z+9soNNj1Yyl+IMLtmXywZFRknLLIxNlL0szu/Q
	sDbqUA3wYilKiiO8DHi3td6lCrcLj76XrYkEze/xD
X-Gm-Gg: AfdE7cndhhnH2CZDHbyYYxS5xuMvh6qmqzOS8BWLGkaocz38RC07bdMqBg/P2/4ABiu
	hS10orQfssNUBtdo5tD2uIcwBzLiVaDC9joYAcrnmBV7tYDQVAqqMniFxqPJ7J4ZWWKruC9RwQg
	fYCuITWovk0UwAmvqHypMK7F8NcXtV2SeJqhTLJFzlmYMUBlNbQuFRP2Zdtoz4LDFXzjgvyjZ5S
	V2ZByN56dI8R7TkTa9QXOpFfa2I7JQPg3FvPy911XQYBWeY0R6hYP2dA15RhZmKP0nR9rPpPYiw
	CaacXCbzriR1quTX6FWOkLqU3Jc=
X-Received: by 2002:aa7:cc06:0:b0:697:e82f:e4f2 with SMTP id
 4fb4d7f45d1cf-6987c8c6b20mr12507a12.4.1782780434872; Mon, 29 Jun 2026
 17:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629192029.4013794-1-tanshuhao@google.com> <20260629162619.55297244@kernel.org>
In-Reply-To: <20260629162619.55297244@kernel.org>
From: Shuhao Tan <tanshuhao@google.com>
Date: Mon, 29 Jun 2026 17:47:03 -0700
X-Gm-Features: AVVi8CeyPv_HP2xk8ySnhnc0pqyT64kuNUxCMJ35qQdjLil091krpfhQ9C5nrWU
Message-ID: <CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across napi_del()/napi_add().
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:26=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 29 Jun 2026 12:20:25 -0700 Shuhao Tan wrote:
> > These drivers destroy and recreate queues during configuration
> > changes. If a NAPI was threaded before destruction, during the
> > creation, a new kthread will be spawned for the NAPI.
> >
> > Some drivers do not have this problem, e.g. netdevsim. But these
> > drivers and the drivers mentioned above will still lose kthread
> > during link flap (ndo_stop/ndo_open).
> >
> > Because the kthreads before and after these configuration changes are
> > different, all the attributes associated with the kthread are lost.
> > These include CPU mask, priority, scheduler policy, etc.. If the
> > threaded state is preserved for a NAPI, it makes sense to want to
> > preserve the attributes of the thread as well.
>
> Send a netdev Netlink notification when NAPI is re-created and
> let the userspace re-apply the settings?

It feels surprising that the userspace needs to reconfigure thread
properties when changing NIC configurations unrelated to threading.
Another downside is that when userspace configures NIC configurations
in quick succession, re-application becomes messy because a previous
re-application might still be in progress when the thread is gone.

> Keeping a few u32s
> around is one thing but keeping a thread running and visible
> in /procfs for the lifetime of a machine feels a little bit much.
> IDK.

The thread will be parked, so at least it will not eat CPU cycles.
Regarding visibility, the only case that I am aware of where a thread
can be unwantedly visible requires first setting the device/queue to
be threaded and then reducing the number of queues. If certain
configurations are applied before the reduction, it makes sense to
want to restore those stuff when the queues get added back (like
irq_affinity today). Moreover, the user can stop the stale thread and
completely remove it by disabling threaded NAPI on the device. So the
thread is not completely tied to the machine's lifetime, and there is
a way to get rid of it.
