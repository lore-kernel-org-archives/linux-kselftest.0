Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415533B6E3
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746338; cv=pass; b=ibAKH53cj82Zt2GFPBx0zAqQE3YIWaeEPeBy/Zm90dmatypgBb4eJHwtXb/Mj08HQmvd7dAfEtC9Yj63bdEWTjaemUUtGtuN2aOPT5qX+iSniIU6qrzEHH1qBJLBESjH5OBsPyyFtmSG6HaiNB8sWzeBQ8IYcvJ5e8BwybqWztU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746338; c=relaxed/simple;
	bh=hKJi0lQLwObxwCEMQQcUOOh16bysbmx0/laXW6Pjd3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwW1iIvfApofNpn/t5k0/sxkuSiTBaVLIYkaBdVY0r48eKBn1PRvoNFGoof3qhzmbqb4rYB6PhSqda/u0kttOFm+xKv0pbKiDjgPppO4HgiAySij9prYpNaLqhz55GyHFOKoqfqVsBu9F4eWa0MCZEnBdK5vpznzRj89YESLMAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXQpXiEV; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXQpXiEV"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7982c3b7dfcso9593997b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 07:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775746336; cv=none;
        d=google.com; s=arc-20240605;
        b=gVkr7CcH+5phamaYrwzzrrTas6QhJIyV6vR2irMVUp7kufeBAeJgTVDItVSRWIU3IL
         vwFJCCpx/O1zUYjGsv4VPI9CrAe4oPFGXUNa4uTiwCzxRPAVn148au9+7ygO9beEjLS9
         /RcfJ+RqxuKyddQ9HiQgRCdyRcmzjQwW5bhiY+LKDNFTWgXh9QI1J7aJb5mccZYQdXri
         plF+Dlit1lcWrnvH6o1FuprHOOOogo8fGzOb4k9L4mkwaEyTm01CeCQ685EUMckvaRzc
         zZYmjVf82cHJkcDwpQAfnbSvkvNfjdOeRWrs4ng/RoOuem6e8+1v7uCgNdWa4tmwexVm
         IFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DiNnldnjPMSbCMNtz3veOwqHeM68J275SUUTDTaa04Y=;
        fh=n4yMU4SLPJmL2Ao26gt307b8tE7P9QCRc1Y3xHNTR7M=;
        b=gnvUKgsN3eMpfLBgDfWED1kKCzJ68Apth4KpEHfaurQUeQfgK9DzskOrS+adMhmKHr
         N1dmYHp8AZtWKPnZjDtIJXVRr04511PrwpkUbkCCI0iEv72I1AHubvXFL1lh+A8G7qhr
         AN8eEjkuWaYUA8+boxgUuhsylQ2wPKbGP3IIBApnFdwCLd/LiyHVTj1iM5/+SrORSTj2
         bIiW17RkpYvzRFz/T4pvu3Zvx7g25YdUxwNabiwb9H9Qy0utLKmgiwR2d1DuqDEInECc
         Elos+98SlTwOB4/eEtj1G+TO35H/QkCXHWkRZ8zjovBSVrFNIifqaLtPEW5BVvoa6uhE
         lxfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775746336; x=1776351136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiNnldnjPMSbCMNtz3veOwqHeM68J275SUUTDTaa04Y=;
        b=BXQpXiEVEfTKCoSJocQ+XQFTSU+pTmWZPgq+66PKXkZyw7p3K8/4unhm37fvyMnqlq
         Re7ppKzOFr9v9ToX+zivCxfMmSQLUxe0MNt/x8i+Z6j4Z09ofgOJj0KvdcDwqaLoV8Qn
         i1Ah3wH5lW5Lg5nKrJbv5nHHYm+aizA0CXNGldBaAlX26IW1A7+JiHkOrTQBTgJdJfdP
         eTJHsuVfUUzRvOueKmdTqd2F/v/ernBIRYDPFmr1Fqr1Z9Khn0gcZNdumIQFV00Js5Ck
         IUnhAAMR7UOopsziBFs6tJB92aRNG36yXXANg6Qc1uQZ8tbCPv/LyG9K1vp2Sn8FL3qR
         do7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746336; x=1776351136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiNnldnjPMSbCMNtz3veOwqHeM68J275SUUTDTaa04Y=;
        b=Faqxl1mUjGHD7faH8Kmq30xVKhaQekF3/Vv/1SUSlwOJ2eNBUB+NhwcgN9I8O8lrn0
         B+qBXijsfz87ZxdV+MG0X3CZHKQcev84WJvNQRY40Nm5N34iwSDNlBqFT1rLKlvcM5+H
         W9FbRGnD8TMEj+OhL8VFA11P7enrHpM2w9J/oYH8iwsuybGP9glM+zHFDs2tQKdppU3/
         TbytoDq/0TXbqZ6X0+ZKSX3IGff9QKV4mnmI7be1+cNiYmFaDkM+s4vHhrLDZTo765jY
         NNzuC8hytnrPCGNljufBOvlonFTpCGV/CDSTNzuVUqqg+wE2Wptu0FbQaRqPFy9NwJTI
         S6fg==
X-Forwarded-Encrypted: i=1; AJvYcCVIaNf5I4NtC7g1ywQzB79/iWpmC83iTEDYR/cpdby+Ne4jCiW6bjlfixdU3WFgINFQabUK2l+KbP171m5uO7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQdjyVTy0CZK9cL6rJrRqfEYC7NTJl2GO5Am4nV3ZkZbmt8Xg
	9LCI7XHEAhQcSKPXj/NgAoFRt5HDsVlc3erLYimqVRSjwOkjiSFeGfnZJhW0S14a//zy4BAbg4Y
	g6sliRdGGP9ZsMX0HXXOD6rnND9RzFhRIXPQkd7C8
X-Gm-Gg: AeBDiev5wUoOtwF3VJbvVJ+npuEHCu+c4iGxiPC6JZMvM8QVlgJagm1WTzLVL4jLikV
	Nn7HVVLRFBZ016sykQT7H8aSPwEiyHMGdR6WGs6DV0G1Y3e65e6kpRHO8emJvewkmc1aH6PGW+u
	2sU2GADuzOdkDLI7giJ63nZJiAKsEKeo/mnBR4Bc3a0NKfSngJPd3pq3wWK7fiOwMHlHerWvGag
	zVA3K0ozqvp8V+06P7zD6sbV7f6r2R08ydeehmokWkS4RpMaJRHdi7wH7CuWJhcIwCWZddslSl3
	SuyOaWk=
X-Received: by 2002:a05:690c:e689:b0:79a:b1ad:d464 with SMTP id
 00721157ae682-7a4d3ace655mr154256017b3.23.1775746335985; Thu, 09 Apr 2026
 07:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-tcp_rcv_exact_clamp_and_wnd-v1-0-76a6f212e153@gmail.com>
In-Reply-To: <20260408-tcp_rcv_exact_clamp_and_wnd-v1-0-76a6f212e153@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Apr 2026 07:52:03 -0700
X-Gm-Features: AQROBzBj7fptL0gFliY6j_31as4pbCwrq5Bq_bkPULRfmYI_lFnOgafWpGVCNZI
Message-ID: <CANn89iJO5DTWeVVfMYh7y3e9Npsu+FQ_a=W9ZqbMtb_wLeBL7A@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] tcp: restrict rcv_wnd and window_clamp to
 representable window
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 2:50=E2=80=AFPM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> Hi,
>
> this series ensures that rcv_wnd and window_clamp do not exceed the
> maximum window size representable for the connection's window scale
> factor.
>
> This is most visible when TCP window scaling is not used for a
> connection. In that case, the advertised window is limited to 65535
> bytes, but rcv_wnd or window_clamp can still grow beyond 65535 when
> large receive buffers are used. The resulting mismatch breaks
> calculations that depend on the advertised window, such as the ACK
> decision in __tcp_ack_snd_check(), and can prevent immediate ACKs.
>
> Similar effects may also occur when window scaling is in use, e.g. if
> the application dynamically adjusts SO_RCVBUF in unusual ways or when
> the rmem sysctl parameters change during a connection=E2=80=99s lifetime.
>
> Summary:
>
> - Patch 1 keeps rcv_wnd capped by the (window scale-limited)
>   window_clamp at connection start.
> - Patch 3 and 6 ensure that window_clamp is limited to the
>   representable window when it is updated.
> - The other patches add packetdrill tests to verify the new behavior.
>
> A simple iperf test on a virtme-ng VM (Intel i5-7500, 4 cores,
> loopback) shows a noticeable improvement with window scaling disabled:

Explain why we should spend time reviewing patches trying to help
stacks from 2 decades ago,
risking breaking other usages.

Almost every time we change the rcvbuf logic, we introduce bugs.

Not using window scaling in 2026 and expecting "iperf improvement" is
quite something!

Out of curiosity, which legacy product is stuck in the 20th century?
