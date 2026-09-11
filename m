Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084F743E092
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123780; cv=pass; b=fDKqOT4Mq0/8739pI18CIKocQFo77cuvj8BCuuRgdjlRXGPI0XLxMvi3COzyZDHjDlAZ2TyVxcUZID/jP8RJIPLN798EtuBtR/srZCrkQUC3seEnW5kswnenfoFifcROjAjSo8wX/k+XXdVXpUatT7SYUYhqUpILxDf4/kpbH2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123780; c=relaxed/simple;
	bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnZH8SBU0xU8GhMWAVFEAfyr6lPAremMRtPOYjVov57tkxD48DlnUmtfLsgqs9UncFuthuva/Lc8R97LymdTa/h2dT8IPpYu5MV9539Ow2LjRjtOxn+pCNGwMCuncbEUBfT+X66DAr6HKPhHyoEwcq1o4cmllk2IYCQxBCKribw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6ulhmTx; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6ulhmTx"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af39dso7351581fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789123776; cv=none;
        d=google.com; s=arc-20260327;
        b=A7Wj5kR82QBh4REBUJK/bid7zsJiHmmKmNFikTsosHyFBp9u8XAdFEHaps5F2SlbRr
         Ut2aaOZ4/uXJuo+WhvdT0zpYD5yMvffSVDS5dAwfopb0NmiB0hxB6ioTcR/UWUlPie0F
         um3wcnbYDfHNfPmCpEM73qXaXujVK1jE3IBb4lNVy4qfdFxEUjEk4Z8akG3ix+dM7/rl
         8/6LONBD9WmUCP1Zpg0nrWvhs1uXHSYRHEsgiLRS4W4AfHgwCt40GIX33c5bIzYRAVVJ
         EMv7vG/Ct04MDUSaKpcHkDZE0qZBVBMaC1e3554D2G13u+oTw9hNJvYfnxpR8NkWOtPt
         PhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        fh=dU4vZ2KsHEAmoZ+ZUSHb41oO2OVS1/AUUzTuIeublzA=;
        b=M+txEyPjbmS8NlKCR+QVGAMb0oQOD68mxf4kYUfxcE7I1qY0UgwUxdB1ADLm8DFwpb
         Z/Cdb66V8j/Nn4hyQWeuWKMxbdQ12WTxAz75Yu0IfcBBwJdRIM+qCj975f/0m/wirpjd
         6c2IwZCKz1bNYv4mmYa/zU0oOiCqbpW/51wj6bp0jmAlPuVWDcMe5cqaYsqLeXHe4Yev
         aah8Y/DGWrCq2P8mrp+WNi8SUMQDYke0ciBzeTc27ijRxUsM1mBT/lazYnW8cxFpvDc8
         4AGR38pgUU4+FSN3L63QGmM0XZPSGUk9oRFk405/gnivDdu+6Tej8R/W3p73Q8nnJTMi
         5XWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123776; x=1789728576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        b=g6ulhmTxVfv5JLib3EYTsO8p4RLkpMe2c9CxsMnw8v9n2gO1eUQ719E7ieF/SgM+CH
         0O/c9rdgTdxSMePZv0lIzRqLw03gDI6exq9pBcqyMl3/qsWBD7BckcWhdPE80VUGxwoB
         D7SX1DGTPaNi7EMB0rNbnmSnTpOBEvuXqOEp27ZU9ehLtwgoZYsjf9IN/hlWmoEY0/Lp
         xrAu6ubEf+uPhr9jjoomSzCYdzSeF0r7czhqonntJuIsY9oUeYXPz1E/7WnroBWqf6kz
         UNt7ho3Ntg5e4zQV1AnrWrMo12G1X2dpQAERxhQGy95fAamCQ7ZZf10yB1VNpMBJTowV
         j51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123776; x=1789728576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezSrAn9CJ7GjnHLdrzeGHcm7ENN3QID29LGU2q4vePY=;
        b=U1kI65Nnal9+kpY2FzyjshPT0fpT4jhhkqiJ0ThFnyViC/y0StCvq6VGFB6nxy9sns
         nBsa7a4degF1YB0A0UkZti6sUph11DbL3tZVTbGc4CLLB0LegubQ5hPMQmegFF1vA6xq
         /nw6bk2rzWbsUgBZ+VCtSc9yBBWyCwnvu5rFWU3X95E0XD4frlSXmW+rC3nRBDOq2D2F
         i3juz+wC042wb7cqcTcy4AKyGmtIj0JfDGUM1zj/ffHaOAiDv40tRSe/6vq+P+jats0Z
         mEY17k5XkniljFHgvrEMQyv6GeexdfmNt/UmqQWdF0zZ3BNFCthszz8DnYToq5lqBoVj
         q5kw==
X-Forwarded-Encrypted: i=1; AKwUvBzELKcY9ceH0X2a8ygtWHd9zq99YPtRKm2f64Z7ao42g1lOdy7WXGT8YxYaOfYp/Adlj2RMHF8d9XDDxXiiXAk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwTLWVQbYLlYw9HlAQ7j9kNExI6yVj7UnMJF4npItjuPxdQxR0
	2P68XEYlUgHct8Br2iLc1wlqhWfi5gqiDXVHVf+cSQvgNBWLTKn8Ys/Vm6uLZ8iQtEPdYWVFZ4o
	fbAKQ9JAoKc7mlM1Fh7m8HrCVZFtJZkk=
X-Gm-Gg: AYBFou2myt1pruE7CLiQTNvLf4FbJOv1sq1h2mjDt/NjrdYDagy3hXPuT5mXSpKM50y
	kM8xobuLXmjNPO92vEQxLZQn1SISx6dj/0Ss5jPGhyr4/QIFl6ysD10ONeHwrS6Kj3z4jIwUQbm
	9r7iaynvhdNe2naTxgrO/a9sJIbhLcGwYb4wt14YbTrIMMurvJCWDvGEdEsmHeYnEl5e9HZHt8H
	nTackdHsAAGU27L6IR5uj1nNnVnRAg7WaRe2hMsaJOB22JZib8QPS1tX5l3DVIZCsRoCkPcbpL8
	V6RMYEN0KU4IaY/Zy5XgEdbyo5Bkb+e/NwtjUJ60W3B7fsfDv8efIMV2XbjAfhAKkEE/V8VN0mp
	fCjfu5gCezGQ=
X-Received: by 2002:a2e:bc81:0:b0:39c:9955:9e0c with SMTP id
 38308e7fff4ca-3a5a51ef765mr8895901fa.6.1789123775747; Fri, 11 Sep 2026
 03:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-3-sigefriedhyy@gmail.com> <178904820206.219967.5313952981588630189@kernel.org>
In-Reply-To: <178904820206.219967.5313952981588630189@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 11 Sep 2026 19:49:23 +0900
X-Gm-Features: AcwNN1VW2hCRe9SDtg7vs6h_4VOh4Y_U9CCUKTlYjaVlanKSuOtZxvyADFn39dg
Message-ID: <CA+7S2vKD8LAkRCuBKvZRWAqfGwbOXLEGch0V28v_p93Dan2uPw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/4] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909133247.113923-1-sigefriedhyy%40gmail.com

The comment here is duplicated in previous version.
