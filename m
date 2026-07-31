Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1403CF204
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505789; cv=pass; b=JAMKrDYbmiu+qdDgoc67iSXNyQEMiLgV/5R3T3RV03U14WvgdGKG5xBFyma6596C2rgJBUNEPx/iaQUle5C0ebpgUdTWuv1bHnt5t3lImwaaongqh2c6BwgDkkFKzxdzg6EykvzftAYuzZGokADdeJH86qq9u+6cO/ZPcYAAfmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505789; c=relaxed/simple;
	bh=YZ9CkSlTlrJLbh1WOVmHl9IAHWd1C2X3EZjHD0e7Bls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZ/+z7M49Soq5FDxw+Vf7l3IMimdL2i6FPSBG/VediL2GyLavLJMzwCg/MCjtllwOFsm2U7BNyTwzi7pfntcE/d92vOiuiUqSUVvai/MFrtDdcI4uQOOaoboPG/ungy6lkh9ISR/YhNGqiGef6bjMnbTaRkM6ljREcFYPskQFIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg2MeH0a; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg2MeH0a"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a496b6cc3dso422659b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 06:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785505779; cv=none;
        d=google.com; s=arc-20260327;
        b=fWVBuSyZ7B0YmpjXAsYsmgSz3RN8C6aiQ9GArQ6oRLNS6vk870fGFTliEAoCRjmQrS
         /1xqw3vxKPLUCoHY4sgQuYrQOfbuDwLqr78xKouFlB8MrrY3O4idcKrXxdESOMfJ4GIr
         RiNz5VHKinocgIxlqzdHTVi2YmSncDuflG8B/dc8yy3viyxIQ6zLlLFitN8dfU5jSheM
         x2UucSVDigaIhqcxf+m11k7IRrNdYRmsBMpVleV6r2qAbviG1WYJAFjdwO3xg+2lmEcL
         xapIeKk9qVsUkaB9q01UBKjoNcwJQjOh9o9gI+tRPJSLQ0vu365f8EqGJRWKY27o1Uv+
         Jekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCROSErOvst+rw5J7GR2giK0/Qqz2Z7mQAMi+70946Y=;
        fh=KzXK1cGfp9hlytvPwsabXjyhY41N4mr7bJV2t4hdgMs=;
        b=b8bpuQmrOXkSPxMqNQuZ4Br6GUEYAndMOhyXVYplPUrJsirZEoAKNXIyqaIvcZDdVt
         J7jHU7i2BIiGdJqxsS52Pj4qXSd1foSia1IqqmVFdLa5Avg6Oq3/hG5/Lf3RbYWgqV3S
         ti8GwjaAliUz5CsKVmIlyCbmk0Jz/V3RvdkIwX5PUjucBJT4srvQqEEYpLDgX7wghzKt
         v9Zq2EdxKm5LJUdin29npPSJcHXpKrt7UJIIzHaXlqPGlJNdJTVfqg0lpVyacN6zRids
         IVSzjbzUF5NSaIWQ2KPvL1u3gwc9reHKrNZSU68rbxaY1WFr+ssUT55SK/GcD7wn1nd+
         /MDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785505779; x=1786110579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCROSErOvst+rw5J7GR2giK0/Qqz2Z7mQAMi+70946Y=;
        b=Qg2MeH0ar3dUWrbDhSdYL1mOObW9k9LRK0A3OVYEpDmZ9FnXWsT7igVPlFGgqvvulC
         SEU4FNfXsgm/aXDMO9ovfvPlpzJRkcy9/o815pDSQCXZqDkJV0FN4O2IUBHMohHcQA+b
         uXfK7p+v7QG/SLw8/VpRTna5SbfT1DUP3s23k37LnJ80wOdbyXF9Z9zkabP5oA6hvra9
         QXKfbbu22Vml+oBs0T7o7oSwMO1pU5vw4uLUarpDlH2PUqyWgUASyo4FI/x3MXLKlRun
         6ccLa0rUo9ig8Yz5+DSB/CIOkfgXgMtsJ5FAfWI+aO35Z1BRDxGqSMnzJ+wQNLJsvyh4
         zryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505779; x=1786110579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCROSErOvst+rw5J7GR2giK0/Qqz2Z7mQAMi+70946Y=;
        b=AHCpTW06sYgLt52DMsdHjq8qvkRTj0TpTY/0KEm7hacyDcmwvISiGQGa3RMwY04OPS
         xMTjqDAsMs3Gr0tp6yLesZ7njovHhCDkToFR8xqS6kCiwv5/phmv0NFcAaZppJoGFCpd
         /9io3W7oN2hxt5Kl2V263y8ZVJ3Lx2j0w0SGOI9V1uwr3qVfwy7pPzHrmwUiWSy+WpvH
         0RRdc51AUQXQsvbnEJs8ZWkfgqhrdb3AjeXFM+xBN5twjEtn31n83hY8qzcLpOZ1nS1f
         klDyjpFISkkafnZDqM3IBkIosVjhkdnEX3x13dT9k7RsfrQfy5KYMKwUfv6dmlbBN1lR
         r/DQ==
X-Forwarded-Encrypted: i=1; AHgh+RodwMaIzDgepG2rGShefb2wH39H/FFTlYAc7e89JDWuKNg8YeQrbcWIwtbrRj/XOTqt+CM8Jrmcv91X8e9GcxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUUL2SavxcY72PDVTkIYm6dncGAafpmcXuXzxKnCYjkZK9ALv
	Jm7+GfZU70GaZ0Jk7uQO4DB5+7amhpLf4zE6mj7+pNK+AQBf+51rQyVLsXH5Kai8Fd98hQEklih
	HGpyNm+s/VTj6mj4lh/HEQ2JKa4039Eg=
X-Gm-Gg: AR+sD11EYZcIh5vRKs9kdgv40J+bTbAMNWmPi+ShSUitrzodxGI6zrhL8rUk1d6tqTk
	jutXUxCo8sqNxGGshJILgGz5djKDP4YgsMuHlvertBqOVXIt78CiPkf+oWure+ApSh0fyylbS7s
	yRsyctVGKhaG6elpPFiSC5VvBN0weIY6+8t2TYJFzpBL3xy8jNDFCVAurSGkZ2CbooenyVP1wk6
	v9T0zPa38itlR+nYXaEi8WZJ4RCN5iasbCJJ/C1fPdTHRvTTn41cvsQSNvW2iyJwpKx7m6GRhsI
	W+twGtuYy3tuYVub13THG8Ov46XNUPrIzdSoSg0pw9pD/Ij5WkrAXGI+jVLHDfJVsLwJykspyiY
	7
X-Received: by 2002:a05:6808:344c:b0:4ab:2abe:f031 with SMTP id
 5614622812f47-4ae4c42b8a4mr2564917b6e.6.1785505779353; Fri, 31 Jul 2026
 06:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730100006.3547944-1-reshmaisat@gmail.com>
 <20260730100006.3547944-2-reshmaisat@gmail.com> <CANn89iLqLYAE_ZbK8F1HNop7nVPAR8AaMD2ojk+XuCNomJPEUg@mail.gmail.com>
In-Reply-To: <CANn89iLqLYAE_ZbK8F1HNop7nVPAR8AaMD2ojk+XuCNomJPEUg@mail.gmail.com>
From: Reshma Sreekumar <reshmaisat@gmail.com>
Date: Fri, 31 Jul 2026 15:49:28 +0200
X-Gm-Features: AUfX_myxRyw9a1CIwOvJkIMGVH30iSlpFvC5hopR2ZmA55gPHYfsi0yrgbcYxtc
Message-ID: <CAGwYyQmtvyKd-NiA0-3fgB0FAjnExF+svd5CRaNzUvvMLemzfw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net/sched: flag inconsistent qdisc dumps
To: Eric Dumazet <edumazet@google.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 1:24 PM Eric Dumazet <edumazet@google.com> wrote:
  > I dislike this patch; it will force dump operations to restart on
busy netns.
  >
  > Most devices are created with a new ifindex (dev_index_reserve() is
  > called with ifindex =3D=3D 0)
  >
  > Forcing a given ifindex is rather unusual.

  Agreed.

  For context on why I went looking: we hit this on production hosts runnin=
g
  kernels predating 748bbef5fc6a. An agent that reconciles tc configuration
  against a qdisc dump saw qdiscs that did exist as absent, tried to create=
 them
  again (-EEXIST), and tore down configuration it believed had gone stale.
  Because nothing sets cb->seq there, a truncated reply is indistinguishabl=
e
  from a complete one, so there was no way to detect it and retry.

  748bbef5fc6a makes that far less likely, and I have not been able to repr=
oduce
  the missing-qdisc case on 7.2-rc5. One case does remain, which this patch
  would not have fixed either: ctx->q_idx is a position within the per-devi=
ce
  qdisc_hash walk, so a qdisc added or removed on the device at a batch bou=
ndary
  misaligns the skip count.

  Is that worth reporting to userspace, and how would you want it detected?


On Thu, Jul 30, 2026 at 12:25=E2=80=AFPM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Thu, Jul 30, 2026 at 12:00=E2=80=AFPM Reshma Sreekumar <reshmaisat@gma=
il.com> wrote:
> >
> > tc_dump_qdisc() walks every netdev in the netns and can span many netli=
nk
> > batches.  RTNL is only held while a single batch is filled, so devices =
can
> > be registered or unregistered in between.  Since 748bbef5fc6a ("net/sch=
ed:
> > switch tc_dump_qdisc() to for_each_netdev_dump()") the walk resumes on =
an
> > ifindex rather than a list position, but ifindexes are reused: a device
> > created between two batches can be given an ifindex the dump has alread=
y
> > walked past, and is then missed entirely.  Before that commit the resum=
e
> > used a position in the device list, so any unregister shifted every lat=
er
> > device and silently dropped a run of qdiscs from the reply.
>
> I dislike this patch; it will force dump operations to restart on busy ne=
tns.
>
> Most devices are created with a new ifindex (dev_index_reserve() is
> called with ifindex =3D=3D 0)
>
> Forcing a given ifindex is rather unusual.
>
> I suggest detecting this specific use case instead of slowing down everyt=
hing.
