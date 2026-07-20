Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C0938238A
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566095; cv=pass; b=sCm3YtJDdE8dFuD5rdOL71WVfUM3Wgk4lLD86OrRlTF0e0mkxMWiLsy7198OMeQfIe3hW0AyjA7R8lxAeteFBREwqJQgPWPkc9dSQXZJ/8hpSCvhL+m+7UjOB37vK/Cuy23jlqVMx7U4E9BNWvJAa/jHYjfO/VX0ShgX4R9gET4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566095; c=relaxed/simple;
	bh=OJWbazha46ug8hN55IrSBbZwd/jVhUCm0IDIJgtN/m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/YUrTdnSqE1BEdR3HSkssLoCwQ2thkZ30PfYcfeCn4zQvMQEM4zeNVycXALAetC0thXyeeaskLnS/2tfFQcmwC2HCOp6LCo6DZjxmbKGXDbEJX/A9nIdNu79obl+A7Ykw9XQGbOJKYaOgHMCQN03WuLB8Pbeav15TNYLcs58As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LFewOWxn; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LFewOWxn"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92eafc94c9cso810807385a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 09:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566093; cv=none;
        d=google.com; s=arc-20260327;
        b=UfKKeKLn3LfOrptGjQm/ySTFDc3O39hhGTiODrhPslBp/+ijQLi8Ann+kyWLxH7bZM
         1lLcyZpfTuH28bg0z3NC3IJyfeRAi7q/kfOo70k8X8K6LB0Jc0pkEkns737FI1riEXSj
         TThgHlqH6F382Cd+9B4vwOt+YIs3t6Ph5RJWNPyzg+HU93o/qVu5uMOVVvd6097UsIFO
         Lr5decVer1rmAJ876ZdniG8eKvcIlm16LzI0A7HtCigIFPC9pYC2ekKhxsdKN6d9+yvF
         039xLXzt6tbP2Axy/ty9LFI2QG3VwiOTLKUGZkkZ3P1snTbV+u9M5WNBWoolFhJoxkV0
         kcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E990VIapzj8tuzMD1s5tgC9LyH+wMa65Oul4PHbwGUM=;
        fh=D4FrKz33NtQ66LWUYwrtFKA37QEY8LLWkg++6t6/Bf4=;
        b=ZN+bJlDBr0za1p4a+aMlz8S6fL1WDRKjuB6/eVkBRkVGTt9X1kRSRxUMpzNz1nd2oR
         H4aoCqU+2q3KvPSQfMazqCJ0gDYONnh1h6uuSirNMp3sov4ZB8t5pGI9mHwGdIq59uXt
         gUPDQOQCdUf9uBDMMgqm0td+QzRMY8e1xzpTGpwNcENuqi7AnM4kEYbB4TQmv54G+/ms
         NiA0XVLb4p+/nuNoB7pHuhpFZKmsPQu9uvo2iVZV9g9G6IPUrnH7Z7FZr08ntSfr+5a9
         lvFiAx0AheSbJ01iW6ET3fSnJWZIj62BFX9Ut+B0qstfrB1TXhEBCJDv9u9cGQRMPQ62
         8DNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566093; x=1785170893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E990VIapzj8tuzMD1s5tgC9LyH+wMa65Oul4PHbwGUM=;
        b=LFewOWxntZVlAMSmgUrbU4ROKlDQLZqTy7QKBdrPdkKJTQSAEX/ZJU/Ad9Rfk+KQxp
         mBSmmHksjAAnKgRnONcHhma0TigfhAtICSuzDGqP1EUTKFO90LKdqyCbZk7qb7dk6OrH
         a1o1OFRDBT18mX7AvxRhQ7725kDV0f+tbYQ1j77D0rv4DkVjtlwHwdgzVovKQPMudeOQ
         IvyuyED4EZn9ejLjLKJcDXaRuOsrsC2WcMpaWazjHRA/nuYbxmocPl0aHJ2jFqTlZL4i
         jWwXd0OY9XxcgUXp/Yhd80X5yyNuTJ+gYzhqwsUyZCpvRFD6If1ri8b+O3qvKqPVgka/
         TXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566093; x=1785170893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E990VIapzj8tuzMD1s5tgC9LyH+wMa65Oul4PHbwGUM=;
        b=YAKgismeEhOjgE2ec14flKh4gDkzPiXFy4TWGgouhshwfVfzlNirQhN0CvUycRiypC
         ipl7jE3+0sIGwj2KGgBGVOHlhmSw4N2r+nte46KsqQnmc605/K7ERl2FB/50OtudYhQz
         c1EossIzMiF6WhL+raR7bl4pluJ/x4HQdtyLAPNCVOKwNFpL+iZ5XhqH/HYQp8Cavk/c
         SpcXz9LQPrAVsJ2LevlWAscwyGsldK3Nuy5aMiWFIaXQCtZOji9nwW6FncvmDKq7luCa
         mwUFbd34zQxxLaZjc4G+mElgdko74r3XyxBFM8/C9dAWgPRaI0/5I+Knkag9Lzqcj5vv
         TYLg==
X-Forwarded-Encrypted: i=1; AHgh+RqxNOnW0QbthCw5uckNA61M+E1GZ/rcgzk0U1J8JU1D9l/iVu+xzxULWs2kUBHISL6CvGHgvkECv8bYR8ltBcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56uJgoKIkB6YZco1XYOaguAp6Qzp6wxRR8MUmhhKpPlquhi29
	3blk4nuii5RK9+mGb1KVxeUZYWacxOf1v0kuMUfJ2szal4cu/7AaUlvY59QJFMF4lz6PR0m8qro
	BeIgXD2OaGlk1jJL7yuS5Ry1Rbdqv4BHo3xdOrH4A
X-Gm-Gg: AfdE7ckMcZVCYT7NqfRTuykK0Wmkx/FDdbysjtZnI+JKLsr0N7CIG7HjB+aPa0+LfD6
	cOSooiKV7yxDcLtMHLnu/7r+lcRuLvsHtA4swZzha9OP/6yplEYBwyszX3+y4yHD1L90yg1LU9N
	UVQbXzVu9RjcYFuPUYAMJqGtR41OcQYTHRIRv1ZZB/QurpkmPfilDoBMfBdoqFK3Q57Lp6bN3C5
	4JLV+JqmoOPX7FRKQpHcjcUNte1gZWxqSNrvl90ow0Oatts2g0cGanC7hdZ0hAgZFlaVUqsuR0D
	f1aoNHUFEyWsaoYG+lVl6aQZ/idbGfluhHpDZ6CxbjIsCbL92wYtLi/LhbhlT+pk8Zfp4gV++w=
	=
X-Received: by 2002:a05:620a:454d:b0:92e:f0a5:ac3e with SMTP id
 af79cd13be357-930b3eb093fmr1435090885a.28.1784566092473; Mon, 20 Jul 2026
 09:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn> <20260717081443.809393-3-yangyx22@mails.tsinghua.edu.cn>
In-Reply-To: <20260717081443.809393-3-yangyx22@mails.tsinghua.edu.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 20 Jul 2026 18:48:01 +0200
X-Gm-Features: AUfX_mxP8PIp4yxhDb4hA3zkZgwpfcpK1so7ZTbdUqmesM2nikxx9tDMVtlcTyc
Message-ID: <CANn89iLQLQNgNRxaRn9_PLPsBb-4nguM6qw=jFv0xjU41WUUgw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests/net: packetdrill: cover RST validation
 in SYN-RECEIVED
To: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yizhou Zhao <zhaoyz24@mails.tsinghua.edu.cn>, 
	Ao Wang <wangao@seu.edu.cn>, Xuewei Feng <fengxw06@126.com>, Qi Li <qli01@tsinghua.edu.cn>, 
	Ke Xu <xuke@tsinghua.edu.cn>, yyxroy22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:15=E2=80=AFAM Yuxiang Yang
<yangyx22@mails.tsinghua.edu.cn> wrote:
>
> Add packetdrill coverage for the RFC 9293 reset checks on request
> sockets in SYN-RECEIVED.  Verify that an exact RST removes the request,
> a non-exact in-window RST sends a challenge ACK without removing it,
> and an out-of-window RST is silently discarded.
>
> Also cover an RST|ACK with an unacceptable ACK number to ensure RST
> sequence validation runs before ACK-field validation.
>
> Signed-off-by: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks!
