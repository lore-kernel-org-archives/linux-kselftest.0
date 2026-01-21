Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0B3ACA7D
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029673; cv=pass; b=ZZj4dEiJP0pbNaTdUraYLqov+wL3gBYURoORzXGZpzk8gn144OOg6JpCLbq7muPjJledLyiHjWCo0VzX7I0N/ubB4eTf2AMUjiIjLSuGeI0Oscp11hFzlmttmg03yNh2t+AAOWGyrTnDou5AmtW3dJB0eJqEdgzoez6PzDqtJLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029673; c=relaxed/simple;
	bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au5vrUPb3S4XMUQcsHkowoAL/8BGA7megQLcVGurjcuG0LQ12iAs4RbSOFAjGOJtDUyKFkOJ1L7sgg6zbAsCqvv3no/nu97qH7Kmejt/DYHoPjcxCsBCaFD/W/SQH29F9PIPVX6aLMyoK1EQGH27YQh0tGNx/e6IbO0xyfG/kgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQeqyJeM; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQeqyJeM"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5014b5d8551so130791cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029667; cv=none;
        d=google.com; s=arc-20240605;
        b=EQigijL8PLdKu9nVvOfGNoMcqwa3SHTaRZ1z284To9FHoJ0fh8FEax4ysXLfEpGawu
         lao5/tvLzByCFCtx6YER9wetgXM9vd3tSyxRq2R08hX12i/teAnGwxHPemWRhnmKcpHr
         0AgS7zq0Ea1By3aljgv0EGWhUSvZncjjPPwiPG5UOMkc+vcxQ0DKvteEmnV7L4hsJ8kT
         p6TJ7+bQVr0m1sq6YbJRizr/C3kH2KIUGKyHiYV74jRKk1sipPUIFRddVWK+9JcMrngP
         2c8io32j9bMkMm3wmJBjA7mUqtZmIIq+JTgakR90HINg1KqMy34vUdS66rqHNnAN815E
         BNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        fh=skhLhWQMa1wbFSIXinEHN5uL9hGPArk+GqBdpVlx6K8=;
        b=jqQw8E822Zf2TwYm3HCGxhoRqI7AdNPXCR6xFWs+R6VS+YueZQxcF/z+ZAgfQzhAVA
         Zw1PZprMDi20Z0v0xt3IvEgUkomOvNrbrGjYhpUzpc5otdSBI9hTryc0u1rrqfcCtLhg
         9+vzBr1E+GtlEQHN2lw6K8PXoLRJ3agPx9xBiIwOMjFfz/nS3cPdlZm6M0UOH7RwzVKR
         9JwVv9fDjSuXaw+nDNehapvWpXo3csC0xIVZURPIcjPh37AqPTmIP0T+DZ4kpeA5MuSg
         miPHn1XQrqOdtBgr3V5uF2je6Vu6vUCs57JPkO8BN8Se7dGNIjNqoKWj3EHymdsa0xM/
         zCzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769029667; x=1769634467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        b=SQeqyJeMzhPwZVMwezMEbd/Zhg8Dp6ruPVSwYPG/XOz1e5uRFg4ksHfL9QtwxIXHfV
         ptsIQ574V8qsD33A49aSXeEswthUWZu5q6OQztfVTUw7XbIFmX846CwEnmrdARgi0BjU
         zW+RSaH54PmqgSyE94iTpD5KkQkJuB7dTvgCBAZrBsTukd0VDNS4AAz8vhsmKBCUi1w8
         1ifEVM2pldEUht8y33DONlblUvkvItE8LdsGiEAalcWBpOdcJwEgFFB1fPfsK9/Xauwa
         nLv/48DFgjdTL2tP+n9XWtHP7ZtH+5DEbrDkDmTKHv7LvY8Q/2pTKlCTs+gyEPbrygm/
         tJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029667; x=1769634467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vIrtZLlR9y3VX65/B/Uk/Cvhdyt5IYMtPMqdkwsTUis=;
        b=bDZDDW74YTqyr3sKTIRl9/wwW9fwZV+36z+e/r+hLQcpEHMkvSaKhMK5WWAWkAp5K9
         TH0fRFEuKhGJbWtoOJXvoqtC5tRLOEBfR0KR3R5wn2cA56YZPvYTPjzjyEzYBlA+on5V
         a+pLAzhrjCx0pA8RPTepLF3S8RvYxF5FQXN/ML1WX065Dis49dYDSb39+FMJrCbN/j3K
         QpKUXLYGoX76Qr/mwNbtGK3Lbu1Wp14rRIaNioPzGq+gpO8yaHrrWTIXhJfCeqK6OqIH
         S6iCgo2GM9jRaLsGPfxiOI0QXg2XMshKkjbj4xZMiaUiQO1TQ1oQTH3U8HHpTeAh5fid
         l51g==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7aLFhEvtLjUhnKgizN3ZX9eyHiwg1A4A6hITeDoIwXQGhDgGY2hcd/sQXsicgaTvGDAzM5I1oZAK3U2xo8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZVhqKzu1jLulgktApBXbC3XseGKt7grOhnzCnSu6DvkpdggB
	v5XQ0ey3/mlYoKxbScl6VgUqpjndl0AHXwduqDe8JeK10kTXbwQ9y0StQNI+M2wd+9iPzHxNo0N
	ybZnGJe7twWSBBQgVpOqkF5yxSJk2oLQ36QkuG7Un
X-Gm-Gg: AZuq6aI8yzRhzNJK5H8pEb2FmL87MrHNduG6G0Eosm84nrEtDYf7In874f+QDAfCGgB
	o0MZbul0Phgq6AlBCY49ODo0w4ENtdjJlS3XNYuw+5Ygf9cmEvCFgBg65cJPQ3/u8C5gfJO9kwB
	3EE0fgZIWfHDENMpSyLutfgLR9HP5gf9ijzP7IP9cWf+Zr5K+ReujZZRqFMU9QNgay0HJ3NluRh
	gS5M8ATDJYOwXlIeY/L6NJ9+LpiMVQpYBtIgSSGr+9qqNDdlwknJLA6pwBM5SmykGAdIrpW5BJX
	U3Wk3VVDAoUOhDQNn0ACRTaw2ndKbOGLCaMx19+4f8EKjJ6tTOvjt3/vHMIK
X-Received: by 2002:a05:622a:10d:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-502ece23329mr407501cf.7.1769029666268; Wed, 21 Jan 2026
 13:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121125504.32ea788c@kernel.org>
In-Reply-To: <20260121125504.32ea788c@kernel.org>
From: Neal Cardwell <ncardwell@google.com>
Date: Wed, 21 Jan 2026 16:07:29 -0500
X-Gm-Features: AZwV_QjMA9pxvIgwt5ruSX8S6CumDWx8tec6mJvW5t5NdsFW525cQ4qDlmi2IZ8
Message-ID: <CADVnQym58ujAwozxSgMNxcCBvTf5JVYrzEoDuBFTjheY-PoHHQ@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 00/15] AccECN protocol case handling series
To: Jakub Kicinski <kuba@kernel.org>
Cc: chia-yu.chang@nokia-bell-labs.com, pabeni@redhat.com, edumazet@google.com, 
	parav@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:55=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Jan 2026 15:32:00 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Hello,
> >
> > Plesae find the v10 AccECN case handling patch series, which covers
> > several excpetional case handling of Accurate ECN spec (RFC9768),
> > adds new identifiers to be used by CC modules, adds ecn_delta into
> > rate_sample, and keeps the ACE counter for computation, etc.
>
> Looks like we went in the wrong directions, multiple tests are failing
> now:
>
> https://netdev.bots.linux.dev/contest.html?branch=3Dnet-next-2026-01-21--=
18-00&executor=3Dvmksft-packetdrill&pw-n=3D0&pass=3D0

Looks like the first two are failing because the v10 series has a
different layout for tcp_info than what packetdrill currently expects:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/3=
0-tcp-accecn-delivered-updates-pkt/stdout
https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/5=
8-tcp-accecn-delivered-falseoverflow-detect-pkt/stdout

Chia-Yu, can you please post a patch for packetdrill to make it expect
the new layout from the v10 series?

For the third one:
https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/483641/6=
9-tcp-accecn-client-accecn-options-lost-pkt/stdout

... it looks like the test line that says:

+.002 ... 0.052 connect(4, ..., ...) =3D 0

needs to be changed to:

+.002 ... 0.102 connect(4, ..., ...) =3D 0

It seems like running the tests before emailing the patches should
have caught these 3 issues?

Chia-Yu, can you please make sure you run all the AccECN packetdrill
tests with the latest kernel and latest packetdrill binary you are
proposing, before posting a v11 kernel patch series and packetdrill
patch?

Thanks,
neal
